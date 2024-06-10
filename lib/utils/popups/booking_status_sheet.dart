import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/bottom_sheet_header.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

Future<Widget?> showBookingStatusSheet({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext innercontext) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomSheetHeader(
                innerContext: innercontext,
                title: "Booking Status",
              ),
              SizedBox(
                height: 16.h,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Text(
                          'Booking Status',
                          style: AppTextStyles.applyTextStyles(
                            styles: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 46.h,
                        ),
                        padding: EdgeInsets.all(12.h),
                        child: TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,4}'))
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Select Booking Status',
                            suffixIcon: Icon(
                              Iconsax.arrow_down4,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Proceed',
                            style: AppTextStyles.applyTextStyles(
                              styles: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -80,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 24,
                      margin: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.h),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const ListTile(title: Text("jhdfsdjbf"));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
