import 'dart:math' as math;
import 'package:flutter/material.dart';

class ResponsiveService {
  static MediaQueryData? _media;

  static const double _designWidth = 390;
  static const double _designHeight = 844;

  static void init(BuildContext context) {
    _media = MediaQuery.of(context);
  }

  static MediaQueryData get _safeMedia {
    assert(_media != null, 'ResponsiveService must be initialized with init()');
    return _media!;
  }

  static double get sw => _safeMedia.size.width;
  static double get sh => _safeMedia.size.height;

  static double get _scaleW => sw / _designWidth;
  static double get _scaleH => sh / _designHeight;

  static double get scale => math.min(_scaleW, _scaleH);

  static double w(num v) => v * _scaleW;
  static double h(num v) => v * _scaleH;

  static double sp(num v) => (v * scale).clamp(10, 36);

  static double r(num v) => v * scale;

  static double spWithContext(BuildContext context, num v) {
    final media = MediaQuery.of(context);
    final scaleW = media.size.width / _designWidth;
    final scaleH = media.size.height / _designHeight;
    final scale = math.min(scaleW, scaleH);
    return (v * scale).clamp(10, 36);
  }
}
