import 'package:flutter/material.dart';

class MyElevatedButotn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  const MyElevatedButotn({
    super.key,
    required this.child,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.yellow.shade600,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child,
      ),
    );
  }
}
