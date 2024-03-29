import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/dashboard/controller/view/view_controller.dart';
import 'package:hotel_booking_app/features/dashboard/screens/view/widgets/dashboard_card.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';

class DashboardCardSlider extends StatelessWidget {
  const DashboardCardSlider({super.key});
  static const List<Map<String, dynamic>> colors = [
    {"title": 'Available Rooms', "color": Color(0xff0071FE), "value": 0},
    {"title": 'Occupied Rooms', "color": Color(0xff001529), "value": 890},
    {"title": 'Available Bookings', "color": Color(0xff0B9F7C), "value": 10},
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Column(
      children: [
        SizedBox(
          width: AppDeviceUtils.getScreenWidth(context),
          height: 82.h,
          child: PageView.builder(
            padEnds: false,
            itemCount: 3,
            onPageChanged: controller.onUpdateSlide,
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(
                right: index != colors.length - 1 ? 10.h : 0,
              ),
              child: DashboardCard(
                color: colors[index]['color'],
                title: colors[index]['title'],
                value: colors[index]['value'],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colors
              .asMap()
              .entries
              .map(
                (entry) => Obx(
                  () => GestureDetector(
                    onTap: () => controller.onUpdateSlide(entry.key),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 10.w,
                      ),
                      width: 15.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: controller.currentSlide.value == entry.key
                            ? const Color(0xff0071FE)
                            : const Color(0xffDFDFDF),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
