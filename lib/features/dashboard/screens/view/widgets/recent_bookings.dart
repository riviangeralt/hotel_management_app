import 'package:flutter/material.dart';
import 'package:hotel_booking_app/common/widgets/booking_card.dart';

class RecentBookings extends StatelessWidget {
  const RecentBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (_, __) {
          return const BookingCard();
        },
      ),
    );
  }
}
