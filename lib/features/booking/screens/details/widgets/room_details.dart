import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/features/booking/screens/details/widgets/single_detail.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class RoomDetails extends StatelessWidget {
  const RoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CAL7394748',
          style: AppTextStyles.applyTextStyles(
            styles: TextStyle(
              color: const Color(0xff001529),
              fontSize: 22.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Text(
          'Standard Rooms . Room 406',
          style: AppTextStyles.applyTextStyles(
            styles: TextStyle(
              color: const Color(0xff5D6065),
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const Divider(
          color: Color(0xffF1F1F1),
        ),
        const SingleDetail(
          title: "Status",
          value: 'Completed',
        ),
        const SingleDetail(
          title: "Booking ID",
          value: 'CAL7394748',
        ),
        const SingleDetail(
          title: "Room no",
          value: '406',
        ),
        const SingleDetail(
          title: "Reservation type",
          value: 'Pay on arrival',
        ),
        const SingleDetail(
          title: "Booking Status",
          value: 'Unpaid',
        ),
        const SingleDetail(
          title: "Customer Name",
          value: 'Agbama Ulimhuka',
        ),
        const SingleDetail(
          title: "Phone  No",
          value: '09069469010',
        ),
        const SingleDetail(
          title: "Email Address",
          value: 'agbama@gmail.com',
        ),
        const SingleDetail(
          title: "Number of days",
          value: '1',
        ),
        const SingleDetail(
          title: "Date of arrival",
          value: '13-09-2023',
        ),
        const SingleDetail(
          title: "No of Check-In ",
          value: '0',
        ),
        const SingleDetail(
          title: "Amount in Naira",
          value: '₦15,000',
        ),
      ],
    );
  }
}
