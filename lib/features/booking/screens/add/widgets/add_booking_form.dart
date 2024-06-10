import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utils/popups/date_picker_popup.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

class AddBookingForm extends StatelessWidget {
  const AddBookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your full name',
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Email address',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Phone number',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your phone number',
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Room type',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Select a room type',
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Room number',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Select a room number',
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Number of days',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Select Number of days',
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Date of arrival',
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            readOnly: true,
            decoration: const InputDecoration(
              hintText: 'Select a date',
              suffixIcon: Icon(
                Iconsax.calendar,
                color: Color(0xFF898C8F),
              ),
            ),
            onTap: () => showDatePickerPopup(
              context: context,
              selectedDate: DateTime(2024, 1, 2),
              onDatePick: (date) => debugPrint(date.toString()),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: () => {},
              child: Text(
                'Continue',
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
    );
  }
}
