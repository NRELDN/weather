import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather/core/theme/colors.dart';

class CrystalLoadingIndicator extends StatefulWidget {
  final double size;
  final Color? color;

  const CrystalLoadingIndicator({super.key, this.size = 50.0, this.color});

  @override
  _CrystalLoadingIndicatorState createState() =>
      _CrystalLoadingIndicatorState();
}

class _CrystalLoadingIndicatorState extends State<CrystalLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark
        ? widget.color ?? AppColors.primaryColor
        : widget.color ?? AppColors.secondaryColor;

    return RotationTransition(
      turns: _controller,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _CrystalPainter(color),
      ),
    );
  }
}

class _CrystalPainter extends CustomPainter {
  final Color color;
  _CrystalPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Draw 3 arcs
    for (int i = 0; i < 3; i++) {
      final gradient = SweepGradient(
        center: Alignment.center,
        startAngle: (i * 2 * pi / 3).toDouble(),
        endAngle: (i * 2 * pi / 3) + (pi / 2),
        colors: [
          color.withOpacity(0.0),
          color.withOpacity(1.0),
          color.withOpacity(0.0),
        ],
        stops: const [0.0, 0.5, 1.0],
      );

      paint.shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        (i * 2 * pi / 3).toDouble(),
        (2 * pi / 3) * 0.8, // Arc length
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
