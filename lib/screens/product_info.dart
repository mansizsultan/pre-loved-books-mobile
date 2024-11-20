import 'package:pre_loved_books/models/product.dart';
import 'package:flutter/material.dart';

class ProductInfoPage extends StatelessWidget {
  final Product item;

  const ProductInfoPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${item.fields.name}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Description: ${item.fields.author}"),
            const SizedBox(height: 8),
            Text("Price: ${item.fields.price}"),
            const SizedBox(height: 8),
            Text("Description: ${item.fields.description}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali ke list produk"),
            ),
          ],
        ),
      ),
    );
  }
}