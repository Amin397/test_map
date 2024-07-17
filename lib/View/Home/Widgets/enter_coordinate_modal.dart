import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_mapp/Const/colors.dart';
import 'package:test_mapp/Const/icons_path.dart';
import 'package:test_mapp/Const/measures.dart';
import 'package:test_mapp/Controller/Home/home_controller.dart';
import 'package:test_mapp/Util/view_utils.dart';

class EnterCoordinateModal extends StatelessWidget {
  const EnterCoordinateModal({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .95,
      padding: paddingAll16,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Find Your Destination',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.clear),
              )
            ],
          ),
          SizedBox(
            height: Get.height * .04,
          ),
          animationConfig(
            widget: myTextField(
              width: Get.width,
              height: Get.height * .07,
              hint: 'Latitude...',
              controller: controller.latTextController,
              textStyle: const TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
              inputType: TextInputType.number,
              enable: true,
              maxLine: 1,
              onChange: (text) {
                controller.update(['calcButton']);
              },
            ),
            index: 2,
          ),
          animationConfig(
            widget: myTextField(
              width: Get.width,
              height: Get.height * .07,
              hint: 'longitude...',
              controller: controller.lngTextController,
              textStyle: const TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
              inputType: TextInputType.number,
              enable: true,
              maxLine: 1,
              onChange: (text) {
                controller.update(['calcButton']);
                // ctx.update(['sendButton']);
              },
            ),
            index: 3,
          ),
          animationConfig(
            widget: _buildButton(),
            index: 3,
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Center(
                child: Lottie.asset(
                  emptyListAnim,
                  height: Get.height * .2,
                  width: Get.height * .2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return GetBuilder(
      init: controller,
      id: 'calcButton',
      builder: (ctx) {
        return InkWell(
          onTap: () {
            if (ctx.latTextController.text.isNotEmpty &&
                ctx.lngTextController.text.isNotEmpty) {
              Get.back(result: true);
            } else {
              showErrorSnakeBar(body: 'Please fill in the following values');
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: Get.width,
            height: Get.height * .06,
            decoration: BoxDecoration(
              color: (ctx.latTextController.text.isNotEmpty &&
                      ctx.lngTextController.text.isNotEmpty)
                  ? purpleColor
                  : Colors.grey[400],
              borderRadius: radiusAll12,
              boxShadow: (ctx.latTextController.text.isNotEmpty &&
                      ctx.lngTextController.text.isNotEmpty)
                  ? shadow()
                  : [],
            ),
            child: Center(
              child: Text(
                'Find it',
                style: TextStyle(
                  color: (ctx.latTextController.text.isNotEmpty &&
                          ctx.lngTextController.text.isNotEmpty)
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
