import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    required this.childXs,
    this.childSm,
    this.childMd,
    this.childLg,
    this.childXl,
    this.child2Xl,
  });
  final Widget? child2Xl;
  final Widget? childXl;
  final Widget? childLg;
  final Widget? childMd;
  final Widget? childSm;
  final Widget childXs;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth < 640) {
          // xs
          return childXs;
        } else if (constraints.maxWidth < 768) {
          // sm
          return childSm ?? childXs;
        } else if (constraints.maxWidth < 1024) {
          // md
          return childMd ?? childSm ?? childXs;
        } else if (constraints.maxWidth < 1280) {
          // lg
          return childLg ?? childMd ?? childSm ?? childXs;
        } else if (constraints.maxWidth < 1536) {
          // xl
          return childXl ?? childLg ?? childMd ?? childSm ?? childXs;
        } else {
          // 2xl
          return child2Xl ??
              childXl ??
              childLg ??
              childMd ??
              childSm ??
              childXs;
        }
      },
    );
  }
}
