import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mapp/Const/colors.dart';
import 'package:test_mapp/Const/icons_path.dart';
import 'package:test_mapp/Const/measures.dart';
import 'package:test_mapp/Controller/Home/home_controller.dart';
import 'package:test_mapp/View/Home/Widgets/build_detail_widget.dart';
import 'package:test_mapp/View/Home/Widgets/build_map_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        child: Center(
          child: Image.asset(
            directionIcon,
            color: Colors.white,
            height: Get.height * .035,
            width: Get.height * .035,
          ),
        ),
        onPressed: () {
          controller.openCoordinateModal(
            context: context,
          );
        },
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            BuildMapWidget(
              controller: controller,
            ),
            GetBuilder(
              init: controller,
              id: 'mapUpdate',
              builder: (ctx) {
                if(ctx.routPoints.isEmpty){
                  return const SizedBox();
                }else{
                  return Obx(
                        () => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      // Animation duration
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          alignment: Alignment.topCenter,
                          filterQuality: FilterQuality.high,
                          child: child,
                        );
                      },
                      child: (controller.isDetailShow.isTrue)
                          ? BuildDetailWidget(
                        controller: controller,
                      )
                          : InkWell(
                        onTap: () {
                          controller.switchCollapsed();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: Get.height * .04,
                            left: Get.width * .03,
                            right: Get.width * .03,
                          ),
                          width: Get.width,
                          height: Get.height * .05,
                          padding: paddingAll8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadow(),
                            borderRadius: radiusAll4,
                          ),
                          child: const Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Show Detail '),
                              Icon(Icons.arrow_drop_down_outlined),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
