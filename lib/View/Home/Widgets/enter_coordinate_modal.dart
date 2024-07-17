import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_mapp/Const/colors.dart';
import 'package:test_mapp/Const/icons_path.dart';
import 'package:test_mapp/Const/measures.dart';
import 'package:test_mapp/Controller/Home/home_controller.dart';
import 'package:test_mapp/Model/history_model.dart';
import 'package:test_mapp/Util/storage_utils.dart';
import 'package:test_mapp/Util/view_utils.dart';

class EnterCoordinateModal extends StatelessWidget {
  const EnterCoordinateModal(
      {super.key, required this.controller, required this.historyList});

  final HomeController controller;

  final List<HistoryModel> historyList;

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
              hint: 'Lat  e.g., 40.7128, -74.0060  ...',
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
              hint: 'Lng e.g., 40.7128, -74.0060...',
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
              child: (historyList.isNotEmpty)
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: historyList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildHistory(
                          history: historyList[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: paddingSymmetricH20,
                          child: Divider(),
                        );
                      },
                    )
                  : Center(
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

  Widget _buildHistory({
    required HistoryModel history,
    required int index,
  }) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 450),
      child: SlideAnimation(
        horizontalOffset: 151.0,
        child: FadeInAnimation(
          child: InkWell(
            onTap: () {
              Get.back();
              controller.startHistory(
                history: history,
              );
            },
            child: Container(
              width: Get.width,
              padding: paddingAll8,
              decoration: BoxDecoration(
                borderRadius: radiusAll16,
                color: fillTextColor.withOpacity(.5),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: mainColor.withOpacity(.5),
                        ),
                        SizedBox(
                          width: Get.width * .05,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                      'Lat : ${history.position.latitude}  ,  '),
                                  Text('Lng : ${history.position.longitude}'),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        Icon(
                          Icons.directions,
                          color: mainColor.withOpacity(.5),
                        ),
                        SizedBox(
                          width: Get.width * .05,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  const Text('Distance : '),
                                  Text('${history.distance} m'),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: mainColor.withOpacity(.5),
                        ),
                        SizedBox(
                          width: Get.width * .05,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  const Text('DateTime : '),
                                  Text(
                                      '${history.dateTime.year}/${history.dateTime.day}/${history.dateTime.month}    ${history.dateTime.hour}:${history.dateTime.minute}'),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
              if (double.parse(controller.latTextController.text) >= -90.0 &&
                  double.parse(controller.latTextController.text) <= 90.0 &&
                  double.parse(controller.lngTextController.text) >= -180.0 &&
                  double.parse(controller.lngTextController.text) <= 180.0) {
                Get.back(result: true);
              } else {
                showErrorSnakeBar(body: 'The format entered is not correct');
              }
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
