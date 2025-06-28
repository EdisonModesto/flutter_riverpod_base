import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class GlobalSnackbar {
  static void showErrorSnackbar({
    required BuildContext context,
    required IconData icon,
    required String message,
    Duration? duration,
  }) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition
          .bottom, // Position of snackbar on mobile devices
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInCubic,
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.all(8),
          color: Colors.amber,
          height: 50,
          child: const Text('A custom snackbar'),
        );
      }),
    ).show(context);
  }

  static void showSuccessSnackbar({
    required BuildContext context,
    required IconData icon,
    required String message,
    Duration? duration,
  }) {
    AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition
          .bottom, // Position of snackbar on mobile devices
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInCubic,
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.all(8),
          color: Colors.amber,
          height: 50,
          child: const Text('A custom snackbar'),
        );
      }),
    ).show(context);
  }
}
