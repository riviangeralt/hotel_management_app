import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/features/dashboard/screens/view/widgets/dashboard_card_slider.dart';
import 'package:hotel_booking_app/features/dashboard/screens/view/widgets/recent_bookings.dart';
import 'package:hotel_booking_app/features/dashboard/screens/view/widgets/section_heading.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DashboardCardSlider(),
        SizedBox(
          height: 10.h,
        ),
        const SectionHeading(),
        SizedBox(
          height: 10.h,
        ),
        const RecentBookings()
      ],
    );
  }
}
