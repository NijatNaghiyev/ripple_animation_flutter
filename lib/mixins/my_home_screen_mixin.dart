import 'package:flutter/material.dart';
import 'package:ripple_animation_flutter/screens/my_home_screen.dart';

/// A mixin that provides animation functionality for [MyHomeScreen].
/// This mixin handles the ripple animation effect and image toggle state.
mixin MyHomeScreenMixin on State<MyHomeScreen>, TickerProvider {
  /// Controller for the ripple animation
  late final AnimationController controller;

  /// The animation that drives the ripple effect from 0.0 to 1.0
  Animation<double> animation = const AlwaysStoppedAnimation(0.0);

  /// Notifies listeners when the image toggle state changes
  final isFirstNotifier = ValueNotifier<bool>(true);

  /// The center point from where the ripple animation originates
  Offset center = Offset.zero;

  /// Handles tap events to trigger the ripple animation.
  /// Updates the center position and starts the animation.
  Future<void> onTapDown(TapDownDetails details) async {
    // Prevent multiple animations from running simultaneously
    if (controller.isAnimating) return;

    /// Handles tap events to trigger the ripple animation.
    center = details.localPosition;

    // Create a new animation from 0.0 to 1.0
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutQuad));

    // Start the animation and reverse it when complete
    await controller.forward();

    // Toggle the image state and reset the animation
    isFirstNotifier.value = !isFirstNotifier.value;

    // Reset the animation to its initial state
    controller.reset();
  }

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with a 1 second duration
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    // Clean up resources when the widget is disposed
    controller.dispose();
    isFirstNotifier.dispose();
    super.dispose();
  }
}
