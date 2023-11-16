import 'package:coffeshop/pages/stock/add_stock_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                Row(
                  children: [
                    for (int i = 0; i < 5; i++) ProductCard(),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStokPage(),
            ),
          );
        },
        heroTag: null,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Ganti lebar container sesuai kebutuhan Anda
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lime,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ini Adalah Gambar"),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Produk',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                'Detail Produk: Deskripsi produk disini...',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                'Harga: \$100',
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
              Text(
                'Stok: 50',
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
