import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 90, decoration: BoxDecoration(color: Colors.blue[200], borderRadius: BorderRadius.circular(10))),
          SizedBox(height: 10),
          Text("Medicine Name", maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Brand Name", style: TextStyle(fontSize: 12, color: Colors.grey)),
          Spacer(),
          Text("৳ 500", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
