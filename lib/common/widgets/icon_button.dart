import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    this.height = double.infinity,
    this.width = double.infinity,
    required this.child,
  });

  final double height;
  final double width;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        width: 16.w,
        height: 16.h,
        constraints: BoxConstraints(
          maxWidth: 16.w,
          maxHeight: 16.h,
        ),
        decoration: const BoxDecoration(
          color: Color(
            0xffF2F2F2,
          ),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
