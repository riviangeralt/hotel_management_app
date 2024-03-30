import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/common/widgets/icon_button.dart';
import 'package:hotel_booking_app/features/booking/screens/details/widgets/image_slider.dart';
import 'package:hotel_booking_app/features/booking/screens/details/widgets/room_details.dart';
import 'package:hotel_booking_app/utils/popups/booking_details_sheet.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Details',
        showBack: true,
        centerTitle: true,
        onBack: () => Get.back(),
        actions: [
          SizedBox(
            width: 32.w,
            height: 32.h,
            child: CustomIconButton(
              onTap: () => showBookingDetailsSheet(context: context),
              child: Icon(
                Iconsax.more,
                size: 22.h,
              ),
            ),
          ),
          SizedBox(
            width: 12.h,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.w,
            horizontal: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250.h,
                width: double.infinity,
                child: const BookingDetailsImageSlider(),
              ),
              SizedBox(
                height: 8.h,
              ),
              const RoomDetails()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 81.h,
        padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 24.h),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Check In',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
