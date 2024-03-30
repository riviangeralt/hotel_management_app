import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/shimmer.dart';

class BookingDetailsImageSlider extends StatelessWidget {
  const BookingDetailsImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      padEnds: false,
      itemCount: 3,
      // onPageChanged: controller.onUpdateSlide,
      // controller: controller.pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(
          right: index != 3 - 1 ? 10.h : 0,
        ),
        child: Image.network(
          'https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          fit: BoxFit.cover,
          loadingBuilder: (
            _,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            return CustomShimmer(
              height: 250.h,
              width: double.infinity,
              isLoading: loadingProgress != null,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
