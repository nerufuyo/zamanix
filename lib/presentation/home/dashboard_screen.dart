import 'package:flutter/material.dart';
import 'package:zamanix/presentation/home/widgets/attendance_widget.dart';
import 'package:zamanix/presentation/home/widgets/bottom_navigation_widget.dart';
import 'package:zamanix/presentation/home/widgets/employee_widget.dart';
import 'package:zamanix/presentation/home/widgets/home_widget.dart';
import 'package:zamanix/presentation/home/widgets/profile_widget.dart';
import 'package:zamanix/presentation/home/widgets/request_widget.dart';

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
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationWidget(
          selectedIndex: selectedIndex,
          onItemTapped: (value) => setState(() => selectedIndex = value),
        ),
      ),
    );
  }
}
