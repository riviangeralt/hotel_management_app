import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/features/dashboard/screens/notification/widgets/notification_card.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        onBack: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'CLEAR ALL',
                    style: AppTextStyles.applyTextStyles(
                      styles: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12.sp,
                        color: const Color(
                          0xff2F343A,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (_, __) {
                    return const NotificationCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
