import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    required this.xAxisCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final int xAxisCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: xAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 200,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
