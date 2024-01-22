import 'package:flutter/material.dart';

class TemplateSectionSliver extends StatelessWidget with MediaQueryLayaouts {
  const TemplateSectionSliver({
    super.key,
    this.backgroundColor,
    this.preferrizeHeight,
    this.image,
    this.child,
  });

  final Color? backgroundColor;
  final ImageProvider? image;
  final Widget? child;
  final double? preferrizeHeight;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: SizedBox(
        height: preferrizeHeight ?? (isSmallScreen(context) ? 1600 : 800),
        width: double.infinity,
        child: child,
      ),
    );
  }
}

mixin MediaQueryLayaouts on Widget {
  bool isSmallScreen(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 847;
}
