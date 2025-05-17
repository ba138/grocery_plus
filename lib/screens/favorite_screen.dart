import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/controllers/favorite_controller.dart';
import 'package:grocery_plus/widgets/favorite_card_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Screen"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Obx(
            () => ListView.builder(
                itemCount: controller.wishItems.length,
                itemBuilder: (context, index) {
                  var item = controller.wishItems[index];
                  return FavoriteCardWidget(
                    item: item,
                    ontap: () {
                      controller.deleteItem(item.productId);
                    },
                  );
                }),
          )),
    );
  }
}
