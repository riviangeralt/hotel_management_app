import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class SingleDetail extends StatelessWidget {
  const SingleDetail({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.all(8.h),
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                color: const Color(0xff2F343A),
                fontSize: 14.sp,
              ),
            ),
          ),
          Text(
            value,
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                color: const Color(0xff2F343A),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
