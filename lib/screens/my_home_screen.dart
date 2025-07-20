import 'package:flutter/material.dart';
import 'package:ripple_animation_flutter/data/images.dart';
import 'package:ripple_animation_flutter/helpers/ripple_animation.dart';
import 'package:ripple_animation_flutter/mixins/my_home_screen_mixin.dart';

/// A screen that displays an image with a ripple animation effect when tapped.
/// The animation transitions between two images using a circular reveal effect.
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

/// The state class for [MyHomeScreen] that handles the animation logic.
/// Uses [SingleTickerProviderStateMixin] for animation controller and
/// [MyHomeScreenMixin] for shared functionality.
class _MyHomeScreenState extends State<MyHomeScreen>
    with SingleTickerProviderStateMixin, MyHomeScreenMixin {
      
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: AnimatedBuilder(
        // Rebuilds when animation controller updates
        animation: controller,
        builder: (context, child) {
          return ValueListenableBuilder(
            // Rebuilds when the image toggle state changes
            valueListenable: isFirstNotifier,
            builder: (context, isFirst, _) {
              return Center(
                child: GestureDetector(
                  // Handles tap events to trigger the ripple animation
                  onTapDown: onTapDown,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // Background image that will be revealed
                        image: NetworkImage(
                          isFirst ? Images.image1 : Images.image2,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipPath(
                      // Custom clipper that creates the ripple effect
                      clipper: RippleAnimation(
                        animationValue: animation.value,
                        center: center,
                      ),
                      child: SizedBox(
                        // Container for the foreground image
                        width: size.width * 0.8,
                        height: size.width * 0.8,
                        child: Image.network(
                          // Foreground image that will be clipped
                          isFirst ? Images.image2 : Images.image1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
