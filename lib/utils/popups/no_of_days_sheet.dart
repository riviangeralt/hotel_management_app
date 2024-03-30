import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/bottom_sheet_header.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

Future<Widget?> showNoOfDaysSheet({
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
                title: "Edit no of days",
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Text(
                  'Number of days',
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
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
                  ],
                  decoration: const InputDecoration(
                    hintText: '1',
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
        ),
      );
    },
  );
}
