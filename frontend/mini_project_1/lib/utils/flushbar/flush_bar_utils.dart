import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class FlushBarUtils {
  static void showFlushBar({
    required BuildContext context,
    required String message,
    FlushBarType flushBarType = FlushBarType.info,
    int durationInSeconds = 3,
    FlushbarPosition flushbarPosition = FlushbarPosition.BOTTOM,
    AnimationType animationType = AnimationType.slideInOut,
    IconData? customIcon, // Allow custom icon if needed
    Color? customBackgroundColor, // Allow custom background color if needed
    double borderRadius = 8.0,
    EdgeInsets margin = const EdgeInsets.all(8.0),
    bool isDismissible = true, // Allow flushbar to be dismissible
    Function()? onTap, // Optional tap callback
    Function()? onDismissed, // Optional dismiss callback
  }) {
    Flushbar(
      message: message,
      duration: Duration(seconds: durationInSeconds),
      backgroundColor: customBackgroundColor ?? _getBackgroundColor(flushBarType),
      icon: customIcon != null ? Icon(customIcon, color: Colors.white) : _getIcon(flushBarType),
      margin: margin,
      borderRadius: BorderRadius.circular(borderRadius),
      flushbarPosition: flushbarPosition,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: _getForwardAnimationCurve(animationType),
      reverseAnimationCurve: _getReverseAnimationCurve(animationType),
      isDismissible: isDismissible,
      onTap: (flushbar) {
        if (onTap != null) onTap();
      },
      onStatusChanged: (status) {
        if (status == FlushbarStatus.DISMISSED && onDismissed != null) {
          onDismissed();
        }
      },
    ).show(context);
  }

  static Color _getBackgroundColor(FlushBarType flushBarType) {
    switch (flushBarType) {
      case FlushBarType.success:
        return Colors.green;
      case FlushBarType.error:
        return Colors.red;
      case FlushBarType.warning:
        return Colors.orange;
      case FlushBarType.info:
      default:
        return Colors.blue;
    }
  }

  static Icon _getIcon(FlushBarType flushBarType) {
    switch (flushBarType) {
      case FlushBarType.success:
        return const Icon(Icons.check_circle, color: Colors.white);
      case FlushBarType.error:
        return const Icon(Icons.error, color: Colors.white);
      case FlushBarType.warning:
        return const Icon(Icons.warning, color: Colors.white);
      case FlushBarType.info:
      default:
        return const Icon(Icons.info, color: Colors.white);
    }
  }

  static Curve _getForwardAnimationCurve(AnimationType animationType) {
    switch (animationType) {
      case AnimationType.fadeInOut:
        return Curves.easeIn;
      case AnimationType.bounce:
        return Curves.bounceIn;
      case AnimationType.scale:
        return Curves.fastLinearToSlowEaseIn;
      case AnimationType.slideInOut:
      default:
        return Curves.easeInOut;
    }
  }

  static Curve _getReverseAnimationCurve(AnimationType animationType) {
    switch (animationType) {
      case AnimationType.fadeInOut:
        return Curves.easeOut;
      case AnimationType.bounce:
        return Curves.bounceOut;
      case AnimationType.scale:
        return Curves.fastOutSlowIn;
      case AnimationType.slideInOut:
      default:
        return Curves.easeInOut;
    }
  }
}

enum FlushBarType { success, error, warning, info }

enum AnimationType { slideInOut, fadeInOut, bounce, scale }
