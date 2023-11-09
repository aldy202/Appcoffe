import 'package:coffeshop/controllers/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../assets/style.dart';

class SideBarPage extends StatelessWidget {
  const SideBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.put(SideBarController());
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: bluelight,
                child: Obx(
                  () => ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 42.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage("images/logoap.png"),
                              width: 700,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      ListTile(
                        title: Center(
                          child: Text(
                            "KASIR",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      //menu side bar
                      //dashboard
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical:
                                8.0), // Sesuaikan padding sesuai kebutuhan
                        title: Container(
                          width: double
                              .infinity, // Lebar container mengisi seluruh lebar ListTile
                          height:
                              60.0, // Sesuaikan nilai height sesuai kebutuhan
                          decoration: BoxDecoration(
                            color: greylight,
                            borderRadius: BorderRadius.circular(
                                10.0), // Sesuaikan nilai radius sesuai kebutuhan
                          ),
                          child: Center(
                            child: Text(
                              "DASHBOARD",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        onTap: () => sideBarController.index.value = 0,
                        selected: sideBarController.index.value == 0,
                      ),
                      //STOCK
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical:
                                8.0), // Sesuaikan padding sesuai kebutuhan
                        title: Container(
                          width: double
                              .infinity, // Lebar container mengisi seluruh lebar ListTile
                          height:
                              60.0, // Sesuaikan nilai height sesuai kebutuhan
                          decoration: BoxDecoration(
                            color: greylight,
                            borderRadius: BorderRadius.circular(
                                10.0), // Sesuaikan nilai radius sesuai kebutuhan
                          ),
                          child: Center(
                            child: Text(
                              "STOCK",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        onTap: () => sideBarController.index.value = 1,
                        selected: sideBarController.index.value == 1,
                      ),
                      //BUKTI TRANSAKSI
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical:
                                8.0), // Sesuaikan padding sesuai kebutuhan
                        title: Container(
                          width: double
                              .infinity, // Lebar container mengisi seluruh lebar ListTile
                          height:
                              60.0, // Sesuaikan nilai height sesuai kebutuhan
                          decoration: BoxDecoration(
                            color: greylight,
                            borderRadius: BorderRadius.circular(
                                10.0), // Sesuaikan nilai radius sesuai kebutuhan
                          ),
                          child: Center(
                            child: Text(
                              "BUKTI TRANSAKSI",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        onTap: () => sideBarController.index.value = 2,
                        selected: sideBarController.index.value == 2,
                      ),
                      //MARKETPLACE
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical:
                                8.0), // Sesuaikan padding sesuai kebutuhan
                        title: Container(
                          width: double
                              .infinity, // Lebar container mengisi seluruh lebar ListTile
                          height:
                              60.0, // Sesuaikan nilai height sesuai kebutuhan
                          decoration: BoxDecoration(
                            color: greylight,
                            borderRadius: BorderRadius.circular(
                                10.0), // Sesuaikan nilai radius sesuai kebutuhan
                          ),
                          child: Center(
                            child: Text(
                              "MARKETPLACE",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        onTap: () => sideBarController.index.value = 3,
                        selected: sideBarController.index.value == 3,
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  // Header
                  Container(
                    color: aqua,
                    width: 1027.0,
                    height: 106.0,
                    padding: EdgeInsets.all(16.0),
                    child: Image(
                      image: AssetImage("images/APCOFFE.png"),
                    ),
                  ),
                  // Content
                  Expanded(
                    child: Obx(
                      () =>
                          sideBarController.page[sideBarController.index.value],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
