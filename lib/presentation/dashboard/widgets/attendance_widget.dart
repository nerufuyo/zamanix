import 'package:flutter/material.dart';
import 'package:zamanix/utils/maintenance.dart';

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Maintenance().buildMaintenanceScreen();
  }
}
