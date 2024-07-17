import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_mapp/Const/colors.dart';
import 'package:test_mapp/Const/icons_path.dart';
import 'package:test_mapp/Const/measures.dart';

Widget myTextField({
  required double width,
  required double height,
  required String hint,
  Widget suffix = const SizedBox(),
  Widget prefix = const SizedBox(),
  bool enable = true,
  int? maxLine,
  int? maxLength,
  // TextInputAction? inputAction = TextInputAction.newline,
  ValueChanged<String>? onChange,
  required TextEditingController controller,
  required TextStyle textStyle,
  EdgeInsets margin = EdgeInsets.zero,
  EdgeInsets padding = EdgeInsets.zero,
  TextAlign textAlign = TextAlign.left,
  GestureTapCallback? onTap,
  TextInputAction inputAction = TextInputAction.done,
  TextInputType inputType = TextInputType.text,
  bool autoFocus = false,
  bool obscureText = false,
  List<TextInputFormatter>? textMask,
}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    padding: padding,
    child: TextField(
      inputFormatters: textMask ?? [],
      obscureText: obscureText,
      controller: controller,
      style: textStyle,
      maxLines: maxLine ?? 1,
      enabled: enable,
      onTap: onTap,
      maxLength: maxLength,
      onChanged: onChange,
      textInputAction: inputAction,
      textAlign: textAlign,
      keyboardType: inputType,
      autofocus: autoFocus,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        counter: const SizedBox(),
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey.withOpacity(.4),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.grey.withOpacity(.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusAll12,
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey.withOpacity(.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusAll12,
          borderSide: BorderSide(
            width: 2.0,
            color: mainColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: radiusAll12,
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.white,
          ),
        ),
        enabled: enable,
        suffixIcon: suffix,
        prefixIcon: prefix,
      ),
    ),
  );
}

Widget loadingAlertWidget({
  required bool isCanCancel,
}) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Container(
      width: Get.width,
      height: Get.height * .4,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            splashAnim,
            height: Get.height * .2,
            width: Get.height * .2,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          const Text(
            'Loading ... ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: Get.height * .03,
          ),
          (isCanCancel)
              ? InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: Get.width * .4,
                    height: Get.height * .05,
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: radiusAll12,
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}

void showSuccessSnakeBar({
  required String body,
}) async {
  Get.snackbar(
    'Yess :)',
    body,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    backgroundColor: Colors.green.withOpacity(.5),
    snackPosition: SnackPosition.TOP,
    margin: paddingAll6,
    colorText: Colors.black,
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(seconds: 4),
    icon: Lottie.asset(
      'assets/anims/success.json',
    ),
    leftBarIndicatorColor: Colors.green.shade800,
    barBlur: 3.0,
    borderRadius: 10.0,
    isDismissible: true,
    // borderWidth: 1.5,
    // borderColor: Colors.green,
  );
}

void showErrorSnakeBar({
  required String body,
}) async {
  Get.snackbar(
    'Ohh ...',
    body,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    backgroundColor: Colors.red.withOpacity(.5),
    snackPosition: SnackPosition.TOP,
    margin: paddingAll6,
    leftBarIndicatorColor: Colors.red.shade800,
    colorText: Colors.black,
    animationDuration: const Duration(milliseconds: 800),
    duration: const Duration(seconds: 4),
    // boxShadows: shadow(),
    icon: Lottie.asset(
      'assets/anims/faild.json',
    ),
    barBlur: 3.0,
    borderRadius: 10.0,
    isDismissible: true,
    // borderWidth: 1.5,
    // borderColor: Colors.red,
  );
}

Widget animationConfig({
  required Widget widget,
  required int index,
}) {
  return AnimationConfiguration.synchronized(
    child: SlideAnimation(
      duration: Duration(milliseconds: index * 400),
      child: FadeInAnimation(
        duration: Duration(milliseconds: index * 400),
        child: widget,
      ),
    ),
  );
}


void showLoadingAlert() {
  RxBool isCanCancel = false.obs;

  Timer cancelTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (timer.tick >= 20) {
      isCanCancel(true);
    }
  });

  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Obx(
              () => loadingAlertWidget(
            isCanCancel: isCanCancel.value,
          ),
        ),
      );
    },
  ).then((value) {
    cancelTimer.cancel();
  });
}



