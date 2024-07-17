import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mapp/Controller/Home/home_controller.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});


  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder(

    );
  }
}
