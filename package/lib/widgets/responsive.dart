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
        if (constraints.minWidth >= 1536) {
          // 2xl
          return child2Xl ??
              childXl ??
              childLg ??
              childMd ??
              childSm ??
              childXs;
        } else if (constraints.minWidth >= 1280) {
          // xl
          return childXl ?? childLg ?? childMd ?? childSm ?? childXs;
        } else if (constraints.minWidth >= 1024) {
          // lg
          return childLg ?? childMd ?? childSm ?? childXs;
        } else if (constraints.minWidth >= 768) {
          // md
          return childMd ?? childSm ?? childXs;
        } else if (constraints.minWidth >= 640) {
          // sm
          return childSm ?? childXs;
        } else {
          // xs
          return childXs;
        }
      },
    );
  }
}
