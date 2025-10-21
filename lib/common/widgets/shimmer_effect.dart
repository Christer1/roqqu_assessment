

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RShimmerEffect extends StatelessWidget {
  const RShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black38,
      highlightColor: Colors.grey[700]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color:  Colors.black54,
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
