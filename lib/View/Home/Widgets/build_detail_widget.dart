import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mapp/Const/colors.dart';
import 'package:test_mapp/Const/measures.dart';
import 'package:test_mapp/Controller/Home/home_controller.dart';

class BuildDetailWidget extends StatelessWidget {
  BuildDetailWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: Get.height * .04,
          left: Get.width * .03,
          right: Get.width * .03,
        ),
        width: Get.width,
        height: Get.height * .17,
        padding: paddingAll8,
        decoration: BoxDecoration(
          borderRadius: radiusAll8,
          color: Colors.white,
          boxShadow: shadow(),
        ),
        child: GetBuilder(
          init: controller,
          id: 'mapUpdate',
          builder: (ctx) {
            return Column(
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height * .07,
                  child: Row(
                    children: [
                      const Text('Your Location '),
                      Expanded(
                        child: SizedBox(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              20,
                              (e) => (e == 0)
                                  ? Container(
                                      height: 6.0,
                                      width: 6.0,
                                      margin: paddingSymmetricH2,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: mainColor,
                                      ),
                                    )
                                  : (e == 19)
                                      ? Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15.0,
                                          color: mainColor,
                                        )
                                      : Container(
                                          width: 5.0,
                                          height: 1.0,
                                          color: mainColor,
                                          margin: paddingSymmetricH2,
                                        ),
                            ),
                          ),
                        ),
                      ),
                      const Text('Destination'),
                    ],
                  ),
                ),
                Text(
                  '${controller.totalDistance}  m',
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      controller.switchCollapsed();
                    },
                    icon:Icon(Icons.arrow_drop_down_outlined),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
