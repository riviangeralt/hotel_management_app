import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/icon_button.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key,
    required this.innerContext, required this.title,
  });

  final String title;
  final BuildContext innerContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF1721EE).withOpacity(.08),
            width: 1.w,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
             title,
              style: AppTextStyles.applyTextStyles(
                styles: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: CustomIconButton(
                onTap: () => Navigator.pop(innerContext),
                child: Icon(
                  Icons.close,
                  size: 18.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
