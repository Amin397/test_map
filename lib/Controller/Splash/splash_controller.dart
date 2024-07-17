
import 'dart:async';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_mapp/Util/routs_utils.dart';

class SplashController extends GetxController {
  RxDouble containerOneW = (Get.width * .2).obs;
  RxDouble containerTwoW = (Get.width * .45).obs;
  bool revers = false;
  bool revers2 = false;

  Timer? timer1;
  Timer? timer2;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData()async {
    timer1 = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!revers) {
        containerOneW.value = containerOneW.value + (Get.width * .05);
        if (containerOneW.value == Get.width * .7) {
          revers = true;
        }
      } else {
        containerOneW.value = containerOneW.value - (Get.width * .05);
        if (containerOneW.value <= Get.width * .2) {
          revers = false;
        }
      }
    });

    timer2 = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (!revers2) {
        containerTwoW.value = containerTwoW.value + (Get.width * .05);
        if (containerTwoW.value >= Get.width * .85) {
          revers2 = true;
        }
      } else {
        containerTwoW.value = containerTwoW.value - (Get.width * .05);
        if (containerTwoW.value <= Get.width * .1) {
          revers2 = false;
        }
      }
    });

    getPermission();

  }


  void getPermission() async{

    if (!await Permission.location.status.isGranted) {
      await Permission.location.request();
    }


    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(NameRouts.home);
      Get.delete<SplashController>();
    });


  }




  @override
  void onClose() {
    timer1!.cancel();
    timer2!.cancel();
    super.onClose();
  }

}
