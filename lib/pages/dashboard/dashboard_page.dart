import 'package:coffeshop/assets/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 15,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: bluelight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 136,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 6),
                        color: greylight.withOpacity(0.5),
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "STOCK BARANG",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "7",
                        style: TextStyle(fontSize: 50, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 15,
                  decoration: BoxDecoration(
                    color: bluelight,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text("Content"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
