import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_mapp/Const/icons_path.dart';
import 'package:http/http.dart' as http;
import 'dart:math' show cos, sqrt, asin;
import 'package:test_mapp/View/Home/Widgets/enter_coordinate_modal.dart';

import '../../Util/view_utils.dart';

class HomeController extends GetxController {
  String mapKey =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjM1NzVlNmIyOGY3MGRkY2I1YTNlNTgyYmNhZTY5YjFlOTFjZjdjNzY4YjljMmMzZmNmMjA3MzViOGIwNTAzYWY5NWNhMGQ3ZDQ2ZmQ2Y2E0In0.eyJhdWQiOiIyNzcwMyIsImp0aSI6IjM1NzVlNmIyOGY3MGRkY2I1YTNlNTgyYmNhZTY5YjFlOTFjZjdjNzY4YjljMmMzZmNmMjA3MzViOGIwNTAzYWY5NWNhMGQ3ZDQ2ZmQ2Y2E0IiwiaWF0IjoxNzE4MDkwNDE1LCJuYmYiOjE3MTgwOTA0MTUsImV4cCI6MTcyMDY4MjQxNSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.Y-AyCQDukd5JKv0LIwZ3eN_9fT59mnLJgbisU6wGj70xVdSWZb0M01sAfTsLyijEmh0K7L28HnHrbimHFoXd7fvJKLxCGzLLlf_KiMu3sBHba1ztZXLNrImHG2yjOH50bIYB6iG-KPAGJhU0Xlo2QCCKazP1mHJ-9wZ2jCKBCJgMrPuzrpZG2GhWjip3LbEYY91DS_U2Viosef0J-y8E-60y1q1h8xpFkYPd1lPoFDnmHGbFeizJY3NG0OnpxmQpW3TOW7AgLsms2hfMUgpAWlNAxk0No3sk28zhlc4aR_5TB58Aa52eRnjFxVYUVY3DYDxIFpdBsFCLLhbHzkFU0g';

  Timer? refreshLocationTimer;

  RxBool isDetailShow = false.obs;

  TextEditingController latTextController = TextEditingController();
  TextEditingController lngTextController = TextEditingController();

  List<LatLng> routPoints = [];
  MapController mapController = MapController();
  Marker? currentMarker;
  Marker? cLocation;

  Marker? originMarker;

  Marker? centerMarker;

  Marker? destinationMarker;
  List<Marker> markerList = [];

  String totalDistance = '';

  @override
  void onInit() {
    updateLocation();
    super.onInit();
  }

  Future<void> updateLocation() async {
    if (await Permission.location.status.isGranted) {
      _getCurrentLocation();
    } else {
      await Permission.location.request();
      updateLocation();
    }
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
      forceAndroidLocationManager: true,
    ).then((Position position) async {
      cLocation = Marker(
        rotate: true,
        point: LatLng(
          position.latitude,
          position.longitude,
        ),
        child: const SizedBox(),
        alignment: Alignment.center,
      );
      currentMarker = Marker(
        rotate: true,
        point: LatLng(
          position.latitude,
          position.longitude,
        ),
        child: SvgPicture.asset(
          currentLocationIcon,
        ),
        alignment: Alignment.center,
      );

      mapController.moveAndRotate(
          currentMarker!.point, mapController.camera.zoom, 3.0);
      refreshCurrentLocation();
      Future.delayed(const Duration(milliseconds: 500), () {
        update(['mapUpdate']);
      });
    }).catchError((e) {
      print(e);
    });
  }

  refreshCurrentLocation() async {
    refreshLocationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      print('Timer:${timer.tick}');
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        forceAndroidLocationManager: true,
      ).then((Position position) async {
        currentMarker = Marker(
          point: LatLng(
            position.latitude,
            position.longitude,
          ),
          child: SvgPicture.asset(
            currentLocationIcon,
          ),
        );
        cLocation = Marker(
          point: LatLng(
            position.latitude,
            position.longitude,
          ),
          child: const SizedBox(),
        );
        mapController.moveAndRotate(
            currentMarker!.point, mapController.camera.zoom, 3.0);

        Future.delayed(const Duration(milliseconds: 500), () {
          update(['mapUpdate']);
        });
      }).catchError((e) {
        print(e);
      });
    });
  }

  void openCoordinateModal({required BuildContext context}) async {
    refreshLocationTimer!.cancel();
    showLoadingAlert();
    routPoints.clear();
    totalDistance = '';
    markerList.clear();
    update(['mapUpdate']);

    var result = await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => EnterCoordinateModal(
        controller: this,
      ),
    );

    if (result is bool) {
      markerList.insert(
        0,
        Marker(
          point: LatLng(
            double.parse(latTextController.text),
            double.parse(lngTextController.text),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              markerIcon,
              // height: Get.height * .0,
              // width: Get.height * .0,
              fit: BoxFit.cover,
            ),
          ),
          rotate: true,
        ),
      );

      mapController.move(markerList.first.point, 9.0);
      Future.delayed(const Duration(milliseconds: 300), () {
        update(['mapUpdate']);
      });
      await makeRoutRequest();
    }
  }

  Future<void> makeRoutRequest() async {
    Uri url = Uri.parse(
        // 'http://router.project-osrm.org/route/v1/driving/${originLatLng.longitude},${originLatLng.latitude};${destinationLatLng.longitude},${destinationLatLng.latitude}?steps=true&annotations=true&geometries=geojson&overview=full');
        'http://router.project-osrm.org/route/v1/driving/${currentMarker!.point.longitude},${currentMarker!.point.latitude};${markerList.first.point.longitude},${markerList.first.point.latitude}?steps=true&annotations=true&geometries=geojson');
    http.Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    routPoints = [];

    List router =
        jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
    totalDistance =
        jsonDecode(response.body)['routes'][0]['distance'].toString();

    String amin = router.first.toString();

    amin = amin.replaceAll(']', '').replaceAll('[', '').replaceAll(' ', '');

    for (var o in router) {
      String reep = o.toString();
      reep = reep.replaceAll(']', '').replaceAll('[', '').replaceAll(' ', '');

      var lat1 = reep.split(',');
      var lng1 = reep.split(",");

      routPoints.add(
        LatLng(
          double.parse(lat1[1]),
          double.parse(lng1[0]),
        ),
      );
    }
    isDetailShow(true);

    Get.back();
    Future.delayed(const Duration(seconds: 1), () {
      update(['mapUpdate']);
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  sumMethod() {
    // for(var i = 0; i < routPoints.length-1; i++){
    // totalDistance += calculateDistance(routPoints[i].latitude, routPoints[i].longitude, routPoints[i+1].latitude, routPoints[i+1].longitude);
    // }
  }

  void switchCollapsed() {
    isDetailShow(!isDetailShow.value);
  }
}
