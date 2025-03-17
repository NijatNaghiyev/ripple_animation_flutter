import 'package:flutter/material.dart';

/// A custom clipper that creates a ripple animation effect.
/// The ripple expands from a center point outwards in a circular shape.
class RippleAnimation extends CustomClipper<Path> {
  /// The progress of the ripple animation from 0.0 to 1.0
  final double animationValue;

  /// The center point from where the ripple originates
  final Offset center;

  RippleAnimation({
    super.reclip,
    required this.animationValue,
    required this.center,
  });

  @override
  getClip(Size size) {
    final path = Path();

    // Define the corners of the clipping area
    final topLeft = Offset.zero;
    final topRight = Offset(size.width, 0);
    final bottomLeft = Offset(0, size.height);
    final bottomRight = Offset(size.width, size.height);

    // Calculate distance from center to each corner
    final distanceToTopLeft = (topLeft - center).distance;
    final distanceToTopRight = (topRight - center).distance;
    final distanceToBottomLeft = (bottomLeft - center).distance;
    final distanceToBottomRight = (bottomRight - center).distance;

    // Find the maximum distance to ensure ripple covers entire area
    final maxDistance = [
      distanceToTopLeft,
      distanceToTopRight,
      distanceToBottomLeft,
      distanceToBottomRight,
    ].reduce((value, element) => value > element ? value : element);

    // Calculate current radius based on animation progress
    final radius = maxDistance * animationValue;

    // Create circular path for the ripple
    path.addOval(
      Rect.fromCircle(center: Offset(center.dx, center.dy), radius: radius),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // Always reclip since animation values change frequently
    // It is important to return true here to ensure the animation is updated
    return true;
  }
}
