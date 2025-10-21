
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class RCircularIcon extends StatelessWidget {
  const RCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = RSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed, 
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size,)),
    );
  }
}
