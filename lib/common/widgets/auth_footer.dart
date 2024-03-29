import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.text,
    required this.ctaText,
    this.onCtaClick,
  });

  final String text;
  final String ctaText;
  final VoidCallback? onCtaClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.applyTextStyles(
            styles: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff949395),
            ),
          ),
        ),
        const SizedBox(
          width: 6.0,
        ),
        GestureDetector(
          onTap: onCtaClick,
          child: Text(
            ctaText,
            style: AppTextStyles.applyTextStyles(
              styles: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff001529),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
