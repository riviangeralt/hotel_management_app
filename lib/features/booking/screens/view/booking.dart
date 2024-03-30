import 'package:flutter/material.dart';
import 'package:hotel_booking_app/common/widgets/booking_card.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, __) {
          return const BookingCard();
        },
      ),
    );
  }
}
