import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/features/dashboard/screens/search_bookings/widgets/bookings_list.dart';
import 'package:iconsax/iconsax.dart';

class SearchBookingsScreen extends StatelessWidget {
  const SearchBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Bookings',
        onBack: () => Get.back(),
        bottom: SizedBox(
          height: 45.h,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search by room no or booking ID",
              prefixIcon: Icon(
                Iconsax.search_normal_14,
                size: 17.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body:  BookingsList()
      // Padding(
      //   padding: EdgeInsets.all(12.sp),
      //   child: const Column(
      //     children: [
      //       ,
      //     ],
      //   ),
      // ),
    );
  }
}
