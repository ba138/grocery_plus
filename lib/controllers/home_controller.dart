import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/grocery_model.dart';

class HomeController extends GetxController {
  var firestore = FirebaseFirestore.instance;
  var isloading = false.obs;
  var itemsList = <Items>[].obs;
  void fetchData() async {
    isloading.value = true;

    try {
      debugPrint("this is value of loading:${isloading.value}");

      var snapshot = await firestore.collection("products").get();
      itemsList.value =
          snapshot.docs.map((doc) => Items.fromMap(doc.data())).toList();
      isloading.value = false;
    } catch (e) {
      debugPrint("Error while fetching data: $e");
    } finally {
      isloading.value = false;
      debugPrint("this is value of loading in final:${isloading.value}");
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
