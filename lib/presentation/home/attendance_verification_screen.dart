import 'package:flutter/material.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_theme.dart';

class AttendanceVerificationScreen extends StatelessWidget {
  const AttendanceVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.accent,
        title: const Text(
          'Attendance Verification',
          style: AppTextStyle.h5,
        ),
        actions: [RotatingIconButton()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            color: Colors.grey,
            height: 1,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Attendance Verification Screen'),
          ],
        ),
      ),
    );
  }
}

class RotatingIconButton extends StatefulWidget {
  @override
  _RotatingIconButtonState createState() => _RotatingIconButtonState();
}

class _RotatingIconButtonState extends State<RotatingIconButton> {
  double _rotationAngle = 0;

  void _rotateImage() {
    setState(() {
      _rotationAngle += 1.0; // Rotate 1 turn (360 degrees)
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedRotation(
        turns: _rotationAngle,
        duration: Duration(milliseconds: 500),
        child: Image.asset(
          AppImage.appRefreshLogo,
          width: 24,
          height: 24,
        ),
      ),
      onPressed: _rotateImage,
    );
  }
}
