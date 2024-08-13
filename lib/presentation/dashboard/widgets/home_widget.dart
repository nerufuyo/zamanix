import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/presentation/dashboard/bloc/timezone/timezone_bloc.dart';
import 'package:zamanix/presentation/dashboard/widgets/header_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/home/attendance_button_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/home/attendance_status_hour_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/home/time_shift_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/home/time_widget.dart';
import 'package:zamanix/utils/spacing_list.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isClockIn = false;
  bool isNotificationFilled = false;

  @override
  void initState() {
    super.initState();
    context
        .read<TimezoneBloc>()
        .add(const GetTimezone(country: AppConfig.appRegion));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * 0.07,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderWidget(
            isNotificationFilled: isNotificationFilled,
            isNotificationAction: () => setState(
              () => isNotificationFilled = !isNotificationFilled,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TimeWidget(),
              const TimeShiftWidget(),
              AttendanceButtonWidget(
                isClockIn: isClockIn,
                isClockInAction: () => setState(
                  () {
                    isClockIn = !isClockIn;
                    AppRoute.navigateTo(
                      context,
                      AppRoute.attendanceVerification,
                    );
                  },
                ),
              ),
            ].withSpacing(24),
          ),
          const AttendanceHourStatusWidget(),
        ].withSpacing(24),
      ),
    );
  }
}
