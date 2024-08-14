import 'package:flutter/material.dart';
import 'package:zamanix/presentation/dashboard/widgets/appbar_form_widget.dart';
import 'package:zamanix/utils/maintenance.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarForm(
          isEditEnabled: true,
          isDataEmpty: true,
          title: 'Edit Profile',
        ),
      ),
      body: Maintenance().buildMaintenanceScreen(),
    );
  }
}
