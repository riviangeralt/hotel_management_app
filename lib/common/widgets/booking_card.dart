import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/shimmer.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.w,
            color: const Color(0xffF1F1F1),
          ),
        ),
      ),
      child: Row(
        children: [
          Image.network(
            'https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            fit: BoxFit.cover,
            loadingBuilder: (
              _,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              return CustomShimmer(
                height: 50.h,
                width: 50.w,
                radius: 50.r,
                isLoading: loadingProgress != null,
                child: child,
              );
            },
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmer(
                height: 18.h,
                width: 111.w,
                isLoading: false,
                child: Text(
                  'Room 406',
                  style: AppTextStyles.applyTextStyles(
                    styles: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomShimmer(
                height: 16.h,
                width: 100.w,
                isLoading: false,
                child: Text(
                  'CAL8729203939',
                  style: AppTextStyles.applyTextStyles(
                    styles: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff5D6065),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomShimmer(
            height: 18.h,
            width: 90.w,
            isLoading: false,
            child: Text(
              '13-01-2022',
              style: AppTextStyles.applyTextStyles(
                styles: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
