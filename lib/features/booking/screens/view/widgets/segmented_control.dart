import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class CustomSegmentedControl extends StatelessWidget {
  const CustomSegmentedControl({
    super.key,
    required this.list,
    required this.onTabChange,
    required this.selected,
  });

  final List<String> list;
  final void Function(int tab) onTabChange;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        6.w,
        6.h,
        0.w,
        6.h,
      ),
      decoration: BoxDecoration(
        color: const Color(
          0xfff4f4f4,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: list
            .asMap()
            .entries
            .map(
              (entry) => Expanded(
                child: GestureDetector(
                  onTap: () => onTabChange(entry.key),
                  child: Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(
                      right: 6.w,
                    ),
                    decoration: BoxDecoration(
                      color: entry.key == selected
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        list[entry.key].toString(),
                        style: AppTextStyles.applyTextStyles(
                          styles: TextStyle(
                            color: entry.key == selected
                                ? const Color(0xff02000A)
                                : const Color(0xff898C8F),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
