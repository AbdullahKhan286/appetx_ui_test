import 'package:apptex_ui_task/config/constant/color.dart';
import 'package:apptex_ui_task/view/custom_widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color textColor;
  final double height;
  final double width;
  final Color background;

  const CustomButton(
      {super.key,
      this.onTap,
      this.text = "",
      this.textColor = primaryColor,
      this.height = 55.0,
      this.width = 214.0,
      this.background = whiteColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
            child: CustomText(
          text: text,
          color: textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        )),
      ),
    );
  }
}
