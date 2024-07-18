import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_mapp/Controller/Home/home_controller.dart';
import 'package:test_mapp/Util/view_utils.dart';

class BuildMapWidget extends StatelessWidget {
  BuildMapWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: GetBuilder(
        init: controller,
        id: 'mapUpdate',
        builder: (ctx) {
          return FlutterMap(
            options: MapOptions(
                maxZoom: 22,
                minZoom: 12,
                keepAlive: true,
                initialCenter: (ctx.currentMarker is Marker)
                    ? ctx.currentMarker!.point
                    : const LatLng(35.7959, 51.4171),
                initialZoom: 18.0,
                onTap: (s, position) {
                  controller.thisPosition(
                    position: position,
                  );
                }),
            mapController: ctx.mapController,
            children: [
              TileLayer(
                urlTemplate:
                    // "https://map.ir/shiveh/xyz/1.0.0/Shiveh:Shiveh@EPSG:3857@png/{z}/{x}/{y}.png?x-api-key=${controller.mapKey}",
                    //     'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}@2x.png?key=4c1N5rAPVh6vwCrss8Rx',
                    //     'https://api.maptiler.com/maps/streets-v2/{z}/{x}/{y}@2x.png',
                    'https://basemaps.cartocdn.com/rastertiles/voyager_nolabels/{z}/{x}/{y}.png',
                // 'https://api.mapbox.com/styles/v1/mapbox/light-v11/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiaG9vZGFkdGVjaCIsImEiOiJjbG1memp3ZGwwOXNwM3NsbGZ3MWkwdWwwIn0.-1Iv-9rRM5OtKwmkQnV2BA',
                // 'https://{s}.tile.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=bc9acb264e2a4170a05632581c1e42ee',
                userAgentPackageName: 'com.example.test_mapp',
              ),
              if (ctx.routPoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: ctx.routPoints,
                      color: Colors.blue,
                      strokeWidth: 9.0,
                    ),
                  ],
                ),
              // if (ctx.originMarker is Marker)
              //   MarkerLayer(
              //     markers: [ctx.originMarker!],
              //   ),
              // if (ctx.destinationMarker is Marker)
              //   MarkerLayer(
              //     markers: [ctx.destinationMarker!],
              //   ),

              MarkerLayer(
                markers: ctx.markerList,
              ),
              if (ctx.currentMarker is Marker)
                MarkerLayer(
                  markers: [
                    ctx.currentMarker!,
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
