import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/grocery_model.dart';
import 'package:grocery_plus/controllers/cart_Controller.dart';
import 'package:grocery_plus/widgets/cart_widget.dart';
import 'package:grocery_plus/widgets/primary_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  var controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: PrimaryButton(
            title: "Buy Now", icon: Icons.shopping_bag, ontap: () {}),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => ListView.builder(
                itemCount: controller.itemsData.length,
                itemBuilder: (context, index) {
                  var item = controller.itemsData[index];
                  return CartWidget(
                    items: item,
                    onDelete: () {
                      controller.deleteCartItem(item.productId);
                    },
                  );
                }))),
      ),
    );
  }
}
