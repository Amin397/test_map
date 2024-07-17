
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_mapp/Const/colors.dart';
import 'package:test_mapp/Const/icons_path.dart';
import 'package:test_mapp/Controller/Splash/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});


  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Positioned(
              top: Get.height * .1,
              child: SizedBox(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                      () => Row(
                    children: [
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerTwoW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(.2),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mainColor,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height * .3,
              child: SizedBox(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                      () => Row(
                    children: [
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerOneW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: mainColor.withOpacity(.2),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Get.height * .5,
              child: SizedBox(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                      () => Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: mainColor.withOpacity(.2),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              topRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerOneW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: mainColor,
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * .23,
              child: SizedBox(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                      () => Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(

                            border: Border.all(
                              color: mainColor,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              topRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerTwoW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(.2),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * .05,
              child: SizedBox(
                width: Get.width,
                height: Get.height * .1,
                child: Obx(
                      () => Row(
                    children: [
                      AnimatedContainer(
                        height: double.maxFinite,
                        width: controller.containerOneW.value,
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          maxWidth: Get.width * .8,
                          minWidth: Get.width * .2,
                        ),
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(.1),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mainColor,
                              width: 1.0,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


            Center(
              child: Lottie.asset(
                splashAnim,
                height: Get.height * .15,
                width: Get.height * .15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
