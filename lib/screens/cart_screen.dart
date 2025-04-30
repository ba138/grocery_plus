import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_plus/Models/grocery_model.dart';
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
  Stream<List<Items>> getCartItems() {
    return firestore
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection("cartItems")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Items.fromMap(doc.data())).toList());
  }

  Future<void> deleteCartItem(String productId) async {
    try {
      await firestore
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection('cartItems')
          .doc(productId)
          .delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
            child: StreamBuilder(
                stream: getCartItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  if (snapshot.data == null) {
                    return Center(
                      child: Text("No items in cart"),
                    );
                  }
                  final cartItems = snapshot.data!;
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var item = cartItems[index];
                        return CartWidget(
                          items: item,
                          onDelete: () {
                            deleteCartItem(item.productId);
                          },
                        );
                      });
                })),
      ),
    );
  }
}
