import 'dart:ui';

import 'package:apptex_ui_task/config/constant/asset.dart';
import 'package:apptex_ui_task/config/constant/color.dart';
import 'package:apptex_ui_task/config/routes/routes_name.dart';
import 'package:apptex_ui_task/config/utils.dart';
import 'package:apptex_ui_task/view/custom_widgets/custom_text/custom_text.dart';
import 'package:apptex_ui_task/view/home_screen/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Icons List
  List<String> actionIcons = [
    Asset.actionIcon_1,
    Asset.actionIcon_2,
    Asset.actionIcon_3,
  ];

  List<List<String>> tabbarIcons = [
    [Asset.tabbarIcon_1, "Freelancer"],
    [Asset.tabbarIcon_2, " Business"],
    [Asset.tabbarIcon_3, "Product"],
  ];

  List<List<String>> bottombarIcons = [
    [Asset.bottombarIcon_1, "Home"],
    [Asset.bottombarIcon_2, " Note"],
    [Asset.bottombarIcon_3, "Message"],
    [Asset.bottombarIcon_4, "Profile"],
    [Asset.bottombarIcon_5, "Setting"],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          ///
          /// ----->  Appbar
          ///
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 210.h),
            child: Padding(
              padding: EdgeInsets.all(18.h),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomText(
                        text: 'Home',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: textColor1,
                      ),
                      const Spacer(),
                      ...List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    actionIcons[index],
                                    height: 24.h,
                                    width: 24.w,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ))
                    ],
                  ),
                  verticalSizedBox(height: 16.h),
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 16.w),
                        const Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: TextField(
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor2),
                            decoration: InputDecoration(
                              hintText: 'Search Here...',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor2),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSizedBox(height: 16.h),
                  TabBar(
                    indicatorColor: primaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    tabs: [
                      ...List.generate(
                        3,
                        (index) => FittedBox(
                          child: SizedBox(
                            height: 36.h,
                            child: Row(
                              children: [
                                Image.asset(
                                  tabbarIcons[index][0],
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.fill,
                                ),
                                horizontalSizedBox(width: 8.w),
                                CustomText(
                                  text: tabbarIcons[index][1],
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: textColor3,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          ///
          /// ----->  Body
          ///
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      CustomText(
                        text: 'Popular',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor1,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RoutesName.product, (route) => true);
                        },
                        child: Row(
                          children: [
                            CustomText(
                              text: 'See All',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: textColor3,
                            ),
                            horizontalSizedBox(width: 8.w),
                            Icon(
                              Icons.arrow_forward,
                              size: 12.sp,
                              color: textColor3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSizedBox(height: 16.h),
                SizedBox(
                  height: 260.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, RoutesName.product, (route) => true);
                          },
                          child: Container(
                            width: 192.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.grey[200]!),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Column(
                                children: [
                                  Image.asset(
                                    Asset.item1,
                                    height: 135.h,
                                    width: 177.w,
                                    fit: BoxFit.fill,
                                  ),
                                  verticalSizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: '43 sold',
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: textColor2,
                                      ),
                                      horizontalSizedBox(width: 13.w),
                                      Icon(Icons.star,
                                          size: 14.sp, color: Colors.yellow),
                                      CustomText(
                                        text: '4.5',
                                        fontSize: 10.sp,
                                        color: textColor2,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  verticalSizedBox(height: 4.h),
                                  CustomText(
                                    text:
                                        'Tortor vitae enim turpis massa ac tellus.',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    maxLines: 2,
                                  ),
                                  verticalSizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: '\$ 21',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffEF6A1F),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                verticalSizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      CustomText(
                        text: 'Other',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor1,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RoutesName.product, (route) => true);
                        },
                        child: Row(
                          children: [
                            CustomText(
                              text: 'See All',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: textColor3,
                            ),
                            horizontalSizedBox(width: 8.w),
                            Icon(
                              Icons.arrow_forward,
                              size: 12.sp,
                              color: textColor3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSizedBox(height: 16.h),
                SizedBox(
                  height: 300.h,
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, RoutesName.product, (route) => true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Colors.grey[200]!),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(8.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      Asset.item2,
                                      height: 84.h,
                                      width: 110.w,
                                      fit: BoxFit.fill,
                                    ),
                                    horizontalSizedBox(width: 8.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        verticalSizedBox(height: 4.h),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: '43 sold',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: textColor2,
                                            ),
                                            horizontalSizedBox(width: 13.w),
                                            Icon(Icons.star,
                                                size: 14.sp,
                                                color: Colors.yellow),
                                            CustomText(
                                                text: '4.5',
                                                fontSize: 9.5.sp,
                                                color: textColor2,
                                                fontWeight: FontWeight.w200),
                                          ],
                                        ),
                                        verticalSizedBox(height: 4.h),
                                        SizedBox(
                                          width: 161.w,
                                          child: CustomText(
                                            text: 'Tortor vitae enim turpis',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        verticalSizedBox(height: 4.h),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: '\$ 21',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: Image.asset(
                                        Asset.actionIcon_2,
                                        height: 23.h,
                                        width: 23.h,
                                        fit: BoxFit.fill,
                                        color: primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),

          ///
          /// -----> Bottom Navigation Bar
          ///
          bottomNavigationBar:
              Consumer<HomeModel>(builder: (context, model, child) {
            return Container(
              height: 67.h,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          model.changeIndex(index);
                        },
                        child: model.currentIndex == index
                            ? Container(
                                width: 74.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(bottombarIcons[index][0],
                                        height: 20.h,
                                        width: 20.h,
                                        color: whiteColor),
                                    horizontalSizedBox(width: 4.w),
                                    CustomText(
                                      text: bottombarIcons[index][1],
                                      fontSize: 10.sp,
                                      color: whiteColor,
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Image.asset(
                                  bottombarIcons[index][0],
                                  height: 20.h,
                                  width: 20.h,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
