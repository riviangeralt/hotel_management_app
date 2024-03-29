import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/booking_card.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

class BookingsList extends StatelessWidget {
  const BookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    const bool noDataAvailable = true;
    return SizedBox(
      height: double.infinity,
      child: noDataAvailable
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.flash_circle5,
                    size: 85.w,
                  ),
                  Text(
                    'No search result',
                    style: AppTextStyles.applyTextStyles(
                      styles: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.only(
                top: 12.h,
                left: 12.h,
                right: 12.h,
              ),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (_, __) {
                  return const BookingCard();
                },
              ),
            ),
    );
  }
}
