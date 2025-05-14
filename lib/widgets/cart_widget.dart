import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_plus/Models/grocery_model.dart';

class CartWidget extends StatelessWidget {
  final Items items;
  final Function() onDelete;
  CartWidget({super.key, required this.onDelete, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Image.network(
                //   items.imageUrl,
                //   height: 60,
                //   width: 60,
                // ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items.name,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      items.price,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ],
            ),
            InkWell(onTap: onDelete, child: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
