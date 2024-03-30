import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/icon_button.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.showBack = true,
    this.centerTitle = true,
    required this.title,
    this.onBack,
    this.actions,
    this.bottom,
  });

  final bool? showBack;
  final bool? centerTitle;
  final List<Widget>? actions;
  final String title;
  final VoidCallback? onBack;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      shape: Border(
        bottom: BorderSide(
          color: const Color(0xFF1721EE).withOpacity(.08),
          width: 1.w,
        ),
      ),
      leading: showBack!
          ? Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Transform.scale(
                scale: .8,
                child: Transform.rotate(
                  angle: 180 * 3.1415927 / 180,
                  child: CustomIconButton(
                    height: 28.w,
                    width: 28.w,
                    onTap: onBack,
                    child: Icon(
                      Iconsax.send_1,
                      size: 28.w,
                      color: const Color(0xff292D32),
                    ),
                  ),
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.applyTextStyles(
          styles: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18.sp,
          ),
        ),
      ),
      actions: actions,
      centerTitle: centerTitle,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size(50.w, 50.h),
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  8.w,
                  8.h,
                  8.w,
                  12.h,
                ),
                child: bottom,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        AppDeviceUtils.getAppBarHeight().h * (bottom != null ? 2.05.h : 1.h),
      );
}
