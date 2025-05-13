import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/grocery_model.dart';
import 'package:grocery_plus/constants/colors.dart';
import 'package:grocery_plus/controllers/product_detail_controller.dart';
import 'package:grocery_plus/widgets/primary_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final Items items;
  const ProductDetailScreen({super.key, required this.items});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put(ProductDetailController(productId: widget.items.productId));

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text("Product Detail"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: AppColors.fontColor, width: 1),
                        image: DecorationImage(
                            image: NetworkImage(widget.items.imageUrl),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                if (controller.inWishList.value) {
                                  controller.removeFromWishList(
                                      widget.items.productId);
                                } else {
                                  controller.addToWishList(
                                      widget.items.name,
                                      widget.items.imageUrl,
                                      widget.items.descritpion,
                                      widget.items.price,
                                      widget.items.productId);
                                }
                              },
                              child: Obx(
                                () => Icon(
                                  Icons.favorite,
                                  color: controller.inWishList.value
                                      ? Colors.red
                                      : AppColors.whiteColor,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.items.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.items.price,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.items.descritpion,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.addToCart(
                              widget.items.name,
                              widget.items.imageUrl,
                              widget.items.descritpion,
                              widget.items.price,
                              widget.items.productId);
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.fontColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Icon(Icons.shopping_cart_checkout),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: PrimaryButton(title: "Buy Now", ontap: () {}))
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
