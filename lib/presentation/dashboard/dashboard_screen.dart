import 'package:flutter/material.dart';
import 'package:zamanix/presentation/dashboard/widgets/bottom_navigation_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/employee_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/home/attendance_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/home_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/profile_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/request_widget.dart';
import 'package:zamanix/utils/dot_background.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<Widget> widgetOptions = <Widget>[
    const HomeWidget(),
    const EmployeeWidget(),
    const RequestWidget(),
    const AttendanceWidget(),
    const ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            const DotBackground(),
            widgetOptions.elementAt(selectedIndex),
          ],
        ),
        bottomNavigationBar: BottomNavigationWidget(
          selectedIndex: selectedIndex,
          onItemTapped: (value) => setState(() => selectedIndex = value),
        ),
      ),
    );
  }
}
