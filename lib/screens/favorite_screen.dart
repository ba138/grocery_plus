import 'package:flutter/material.dart';
import 'package:grocery_plus/widgets/favorite_card_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return FavoriteCardWidget();
        }),
      ),
    );
  }
}
