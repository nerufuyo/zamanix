import 'package:flutter/material.dart';
import 'package:zamanix/utils/maintenance.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Maintenance().buildMaintenanceScreen();
  }
}
