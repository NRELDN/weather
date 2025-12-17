import 'package:flutter/material.dart';
import 'responsiveService.dart';

extension ResponsiveNum on num {
  double get w => ResponsiveService.w(this);
  double get h => ResponsiveService.h(this);
  double get sp => ResponsiveService.sp(this);
  double get r => ResponsiveService.r(this);

  SizedBox get vSpace => SizedBox(height: h);
  SizedBox get hSpace => SizedBox(width: w);
}
