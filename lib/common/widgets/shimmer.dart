import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required this.height,
    required this.width,
    this.radius = 5,
    this.isLoading = true,
    this.child,
  });

  final double height;
  final double width;
  final double radius;
  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: isLoading
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!, // Adjust opacity if necessary
              highlightColor: Colors.grey[100]!, // Adjust opacity if necessary
              child: Container(
                height: height,
                width: width,
                color: Colors.white,
              ),
            )
          : child,
    );
  }
}
