import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/core/data/models/apis/meal_models.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/meal_details/meal_details_controller.dart';
import 'package:food_order/ui/views/meal_details/meal_details_view.dart';
import 'package:get/get.dart';
import '../../../../core/translation/app_translation.dart';
import '../../../shared/colors.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  final Function onPressed;
  HomeView({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Obx(() {
            return controller.isCategoryLoading
                ? SpinKitCircle(
                    color: AppColors.mainOrangeColor,
                  )
                : Expanded(
                    child: controller.categoryList.isEmpty
                        ? Text(tr("no_category"))
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsetsDirectional.only(
                                    start: screenWidth(15)),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          'http://via.placeholder.com/350x150',
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      width: screenWidth(3),
                                      height: screenWidth(3),
                                    ),
                                    Text(
                                      controller.categoryList[index].name ?? '',
                                      style:
                                          TextStyle(fontSize: screenWidth(20)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  );
          }),
          Obx(() {
            return controller.isMealLoading
                ? SpinKitCircle(
                    color: AppColors.mainOrangeColor,
                  )
                : Expanded(
                    child: controller.mealList.isEmpty
                        ? Text(tr("no_meal"))
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.mealList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(top: screenWidth(15)),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(MealDetailsView(
                                        meal: controller.mealList[index]));
                                  },
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            'http://via.placeholder.com/350x150',
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        width: screenWidth(3),
                                        height: screenWidth(3),
                                      ),
                                      Text(
                                        controller.mealList[index].name ?? '',
                                        style: TextStyle(
                                            fontSize: screenWidth(20)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  );
          })
        ],
      )),
    );
  }
}
