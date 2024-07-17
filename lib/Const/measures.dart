import 'package:flutter/material.dart';
import 'package:get/get.dart';

const EdgeInsets paddingAll8 = EdgeInsets.all(8.0);
const EdgeInsets paddingAll4 = EdgeInsets.all(4.0);
const EdgeInsets paddingAll2 = EdgeInsets.all(2.0);
const EdgeInsets paddingAll10 = EdgeInsets.all(10.0);
const EdgeInsets paddingAll6 = EdgeInsets.all(6.0);
const EdgeInsets paddingAll16 = EdgeInsets.all(16.0);
const EdgeInsets paddingAll12 = EdgeInsets.all(12.0);
const EdgeInsets paddingAll18 = EdgeInsets.all(18.0);
const EdgeInsets paddingAll24 = EdgeInsets.all(24.0);
const EdgeInsets paddingAll28 = EdgeInsets.all(28.0);
const EdgeInsets paddingAll32 = EdgeInsets.all(32.0);
const EdgeInsets paddingAll38 = EdgeInsets.all(38.0);
const EdgeInsets paddingAll42 = EdgeInsets.all(42.0);
const EdgeInsets paddingAll64 = EdgeInsets.all(64.0);
const EdgeInsets paddingSymmetricH8 = EdgeInsets.symmetric(horizontal: 8.0);
const EdgeInsets paddingSymmetricH10 = EdgeInsets.symmetric(horizontal: 10.0);
const EdgeInsets paddingSymmetricH4 = EdgeInsets.symmetric(horizontal: 4.0);
const EdgeInsets paddingSymmetricH6 = EdgeInsets.symmetric(horizontal: 6.0);
const EdgeInsets paddingSymmetricH2 = EdgeInsets.symmetric(horizontal: 2.0);
const EdgeInsets paddingSymmetricH16 = EdgeInsets.symmetric(horizontal: 16.0);
const EdgeInsets paddingSymmetricH14 = EdgeInsets.symmetric(horizontal: 14.0);
const EdgeInsets paddingSymmetricH12 = EdgeInsets.symmetric(horizontal: 12.0);
const EdgeInsets paddingSymmetricH24 = EdgeInsets.symmetric(horizontal: 24.0);
const EdgeInsets paddingSymmetricH20 = EdgeInsets.symmetric(horizontal: 20.0);
const EdgeInsets paddingSymmetricH30 = EdgeInsets.symmetric(horizontal: 30.0);
const EdgeInsets paddingSymmetricH35 = EdgeInsets.symmetric(horizontal: 35.0);
const EdgeInsets paddingSymmetricH40 = EdgeInsets.symmetric(horizontal: 40.0);
const EdgeInsets paddingSymmetricV10 = EdgeInsets.symmetric(vertical: 10.0);
const EdgeInsets paddingSymmetricV8 = EdgeInsets.symmetric(vertical: 8.0);
const EdgeInsets paddingSymmetricV6 = EdgeInsets.symmetric(vertical: 6.0);
const EdgeInsets paddingSymmetricV4 = EdgeInsets.symmetric(vertical: 4.0);
const EdgeInsets paddingSymmetricV2 = EdgeInsets.symmetric(vertical: 2.0);
const EdgeInsets paddingSymmetricV16 = EdgeInsets.symmetric(vertical: 16.0);
const EdgeInsets paddingSymmetricV20 = EdgeInsets.symmetric(vertical: 20.0);
const EdgeInsets paddingSymmetricV24 = EdgeInsets.symmetric(vertical: 24.0);
const EdgeInsets paddingSymmetricV28 = EdgeInsets.symmetric(vertical: 28.0);
const EdgeInsets paddingSymmetricV36 = EdgeInsets.symmetric(vertical: 36.0);
const EdgeInsets paddingSymmetricV42 = EdgeInsets.symmetric(vertical: 42.0);

final BorderRadius radiusAll4 = BorderRadius.circular(4.0);
final BorderRadius radiusAll6 = BorderRadius.circular(6.0);
final BorderRadius radiusAll8 = BorderRadius.circular(8.0);
final BorderRadius radiusAll10 = BorderRadius.circular(10.0);
final BorderRadius radiusAll12 = BorderRadius.circular(12.0);
final BorderRadius radiusAll16 = BorderRadius.circular(16.0);
final BorderRadius radiusAll20 = BorderRadius.circular(20.0);
final BorderRadius radiusAll24 = BorderRadius.circular(24.0);
final BorderRadius radiusAll28 = BorderRadius.circular(28.0);
final BorderRadius radiusAll32 = BorderRadius.circular(32.0);
final BorderRadius radiusAll36 = BorderRadius.circular(36.0);
final BorderRadius radiusAll42 = BorderRadius.circular(42.0);
final BorderRadius radiusAll50 = BorderRadius.circular(50.0);
final BorderRadius radiusAll60 = BorderRadius.circular(60.0);
final BorderRadius radiusAll70 = BorderRadius.circular(70.0);
final BorderRadius radiusAll80 = BorderRadius.circular(80.0);
final BorderRadius radiusAll100 = BorderRadius.circular(100.0);
final BorderRadius buttonsRadius = BorderRadius.circular(100.0);

const double moneyTextSize = 22.0;
const double titleTextSize = 18.0;
const double contentTextSize = 16.0;
const double mediumContentTextSize = 14.0;
const double smallContentTextSize = 10.0;
double buttonsHeight = Get.height * .05;


List<BoxShadow> shadow({
  Offset offset = const Offset(1.0, 1.0),
}) {
  return [
    BoxShadow(
      color: Colors.black12 ,
      blurRadius: 5.0,
      spreadRadius: 2.0,
      offset: offset,
    ),
  ];
}

List<BoxShadow> itermShadow({
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(.07),
      spreadRadius: 3.0,
      blurRadius: 5.0,
      offset: offset,
    )
  ];
}


var persian = RegExp(r'[\u0600-\u06FF]');
var english = RegExp(r'[a-zA-Z]');
