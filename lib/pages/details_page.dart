import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoe_model.dart';
import '../providers/cart_provider.dart';

class DetailsPage extends StatelessWidget {
  final Shoe shoe;

  const DetailsPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(shoe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm
            Center(
              child: Image.network(shoe.imageUrl, height: 250),
            ),
            const SizedBox(height: 16),

            // Tên sản phẩm
            Text(
              shoe.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Giá
            Text(
              '\$${shoe.price}',
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Mô tả
            Text(
              shoe.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24), // Khoảng cách giữa mô tả và nút

            // Nút Add to Cart
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  final newShoe = ShoeInCart(
                    id: shoe.id,
                    name: shoe.name,
                    price: shoe.price,
                    imageUrl: shoe.imageUrl,
                    description: shoe.description,
                  );

                  Provider.of<CartProvider>(context, listen: false).addItem(newShoe);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
