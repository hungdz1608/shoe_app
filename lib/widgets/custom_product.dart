import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoe_model.dart';
import '../pages/details_page.dart';
import '../providers/cart_provider.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hình ảnh
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                widget.shoe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Tên sản phẩm
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.shoe.name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Giá
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
            child: Text(
              '\$${widget.shoe.price}',
              style: TextStyle(color: Colors.grey[700], fontSize: 13),
            ),
          ),

          const Spacer(),

          // Nút
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Nút View Details (nhỏ, có border, không làm gì)
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(shoe: widget.shoe),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    minimumSize: const Size(0, 32),
                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),

                // Nút giỏ hàng tròn màu xanh
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add_shopping_cart, size: 18, color: Colors.white),
                    onPressed: () {
                      final newShoe = ShoeInCart(
                        id: widget.shoe.id,
                        name: widget.shoe.name,
                        price: widget.shoe.price,
                        imageUrl: widget.shoe.imageUrl,
                        description: widget.shoe.description,
                      );
                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(newShoe);
                    },
                    tooltip: "Add to cart",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
