import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_plus/Models/grocery_model.dart';
import 'package:grocery_plus/constants/colors.dart';

class FavoriteCardWidget extends StatelessWidget {
  final Items item;
  final Function() ontap;
  const FavoriteCardWidget(
      {super.key, required this.ontap, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "images/splash_image.png",
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Text(
                      "Product Name",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Product Name",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: ontap,
                  child: Icon(
                    Icons.delete,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.shopping_cart,
                  color: AppColors.primaryColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
