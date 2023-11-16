import 'package:coffeshop/assets/outline_input_border.dart';
import 'package:coffeshop/controllers/product_controller.dart';
import 'package:coffeshop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddStokPage extends StatefulWidget {
  const AddStokPage({super.key});

  @override
  State<AddStokPage> createState() => _AddStokPageState();
}

class _AddStokPageState extends State<AddStokPage> {
  // Deklarasi variable
  final formKey = GlobalKey<FormState>();
  final pdctrl = ProductController();

  String? productName;
  String? productDetailText;
  String? imageUrl;
  int? price;
  int? stok;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Stok"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade400,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.pink,
                      Colors.pink,
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 500,
                      width: 700,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // Nama Produk
                          Container(
                            width: 500,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: myInputborder(),
                                enabledBorder: myInputborder(),
                                focusedBorder: myFocusborder(),
                                labelText: 'Nama Produk',
                                labelStyle: labelStyleText(),
                                hintText: 'Enter Your Name Produk',
                              ),
                              onChanged: (value) {
                                productName = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Name Product";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Produk Detail
                          Container(
                            width: 500,
                            child: TextFormField(
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                border: myInputborder(),
                                enabledBorder: myInputborder(),
                                focusedBorder: myFocusborder(),
                                labelText: 'Produk Detail',
                                labelStyle: labelStyleText(),
                                hintText: 'Enter Your Name Produk',
                              ),
                              onChanged: (value) {
                                productDetailText = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Product Detail";
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Price and Stok
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Nama Price
                              Container(
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: myInputborder(),
                                    enabledBorder: myInputborder(),
                                    focusedBorder: myFocusborder(),
                                    labelText: 'Price',
                                    labelStyle: labelStyleText(),
                                    hintText: 'Enter Your Price',
                                  ),
                                  onChanged: (value) {
                                    price = int.tryParse(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Your Price";
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // Nama Stok
                              Container(
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: myInputborder(),
                                    enabledBorder: myInputborder(),
                                    focusedBorder: myFocusborder(),
                                    labelText: 'Stok',
                                    labelStyle: labelStyleText(),
                                    hintText: 'Enter Your Stok',
                                  ),
                                  onChanged: (value) {
                                    stok = int.tryParse(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Your Name Product";
                                    }
                                  },
                                ),
                              ),

                              SizedBox(
                                width: 30,
                              ),

                              // Button Upload Gambar
                              InkWell(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Upload Gambar'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              GestureDetector(
                                                child: Text('Camera'),
                                                onTap: () async {
                                                  await pdctrl.uploadImage(
                                                      ImageSource.camera,
                                                      imageUrl ?? "");
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              SizedBox(height: 10),
                                              GestureDetector(
                                                child: Text('Gallery'),
                                                onTap: () async {
                                                  await pdctrl.uploadImage(
                                                      ImageSource.gallery,
                                                      imageUrl ?? "");
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: 160,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Upload Foto",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            child: InkWell(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  String formatDate =
                                      DateFormat('yyyy-MM-dd HH:mm:ss')
                                          .format(DateTime.now());
                                  ProductModel pd = ProductModel(
                                      productName: productName!,
                                      productDetail: productDetailText!,
                                      priceProduct: price!,
                                      stock: stok!,
                                      lastUpdated: formatDate);

                                  var aa = pdctrl.addProduct(pd);

                                  if (aa != null) {
                                    Navigator.pop(context, true);
                                  }

                                  //successful
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Berhasil Menambahkan data'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                              // Navigate to the next screen or perform any desired action
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  //  Failed
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Gagal menambahkan Data'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              // Navigate to the next screen or perform any desired action
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    "Submit",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
