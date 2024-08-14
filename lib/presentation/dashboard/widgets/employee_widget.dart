import 'package:flutter/material.dart';
import 'package:zamanix/utils/maintenance.dart';

class EmployeeWidget extends StatelessWidget {
  const EmployeeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Maintenance().buildMaintenanceScreen();
  }
}
