import 'package:apptex_ui_task/config/constant/asset.dart';
import 'package:apptex_ui_task/config/constant/color.dart';
import 'package:apptex_ui_task/config/utils.dart';
import 'package:apptex_ui_task/view/custom_widgets/custom_button/custom_button.dart';
import 'package:apptex_ui_task/view/custom_widgets/custom_text/custom_text.dart';
import 'package:apptex_ui_task/view/custom_widgets/expandable_text/expandable_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();
  String image =
      'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3JtMzYyLTAxYS1tb2NrdXAuanBn.jpg';
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 285.h,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        image,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: DotsIndicator(
                        dotsCount: 5,
                        position: _currentIndex,
                        decorator: DotsDecorator(
                          activeColor: whiteColor,
                          color: greyColor.withOpacity(0.5),
                          size: Size.square(9.sp),
                          activeSize: Size.square(9.sp),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.h, left: 16.w),
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_back_ios_new,
                                  color: greyColor, size: 20.sp),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: '\$ 21',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: greyColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Image.asset(
                              Asset.actionIcon_2,
                              fit: BoxFit.contain,
                              color: primaryColor,
                              height: 18.h,
                              width: 18.w,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  verticalSizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: 'Tortor vitae enim turpis',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.star_rate_rounded, color: yellow, size: 20.sp),
                      horizontalSizedBox(width: 4.w),
                      CustomText(
                        text: '4.5',
                        fontSize: 14.sp,
                        color: greyColor,
                      ),
                    ],
                  ),
                  verticalSizedBox(height: 16.h),
                  ExpandableText(
                    text:
                        'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being delicious, pancakes are also very easy to make, you can make them at home with your family.',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: textColor3,
                  ),
                  verticalSizedBox(height: 16.h),
                  const Divider(color: lightGreyColor),
                  verticalSizedBox(height: 16.h),
                  Row(
                    children: [
                      CustomButton(
                        onTap: () {},
                        text: "Add To Card",
                        height: 55.h,
                        width: 214.w,
                      ),
                      const Spacer(),
                      CustomButton(
                        onTap: () {},
                        text: "Buy Now",
                        height: 55.h,
                        width: 111.w,
                        background: primaryColor,
                        textColor: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
