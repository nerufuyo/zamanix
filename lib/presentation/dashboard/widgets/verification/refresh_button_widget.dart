import 'package:flutter/material.dart';
import 'package:zamanix/config/app_asset.dart';

class RotatingIconButton extends StatefulWidget {
  const RotatingIconButton({super.key});

  @override
  State<RotatingIconButton> createState() => _RotatingIconButtonState();
}

class _RotatingIconButtonState extends State<RotatingIconButton> {
  double _rotationAngle = 0;

  void _rotateImage() {
    setState(() {
      _rotationAngle += 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedRotation(
        turns: _rotationAngle,
        duration: const Duration(milliseconds: 500),
        child: Image.asset(
          AppImage.appRefreshLogo,
          width: 20,
          height: 20,
        ),
      ),
      onPressed: _rotateImage,
    );
  }
}
