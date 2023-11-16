import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeshop/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductController {
  final productCollection = FirebaseFirestore.instance.collection('Product');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  final StreamController<String> imageuploadController =
      StreamController<String>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;
  Stream<String> get imageUploadStream => imageuploadController.stream;

  // Create Product
  Future addProduct(ProductModel pdModel) async {
    final productM = pdModel.toMap();

    final DocumentReference docref = await productCollection.add(productM);

    final String prodId = docref.id;

    final ProductModel productModel = ProductModel(
      idProduct: prodId,
      productName: pdModel.productName,
      productDetail: pdModel.productDetail,
      priceProduct: pdModel.priceProduct,
      stock: pdModel.stock,
      imageProduct: pdModel.imageProduct,
      lastUpdated: pdModel.lastUpdated,
    );

    await docref.update(productModel.toMap());
    await getProduct();
  }

  // Get All Product
  Future getProduct() async {
    final product = await productCollection.get();
    streamController.sink.add(product.docs);

    return product.docs;
  }

  // Method Upload
  Future uploadImage(ImageSource source, String img) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Get a reference to storage root
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImage = referenceRoot.child('images');

      // create a reference
      Reference referenceImageToUpload =
          referenceDirImage.child(uniqueFileName);

      // Handle error/success
      try {
        // Store the file
        await referenceImageToUpload.putFile(
          File(pickedImage.path),
        );

        // success message
        img = await referenceImageToUpload.getDownloadURL();
        imageuploadController.sink.add(img);
      } catch (e) {
        print(e);
      }
    }

    void dispose() {
      streamController.close();
      imageuploadController.close();
    }
  }
}
