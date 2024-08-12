import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/home/bloc/timezone/timezone_bloc.dart';
import 'package:zamanix/presentation/home/widgets/home/attendance_button_widget.dart';
import 'package:zamanix/presentation/home/widgets/home/attendance_status_hour_widget.dart';
import 'package:zamanix/presentation/home/widgets/dot_widget.dart';
import 'package:zamanix/presentation/home/widgets/header_widget.dart';
import 'package:zamanix/presentation/home/widgets/home/time_shift_widget.dart';
import 'package:zamanix/presentation/home/widgets/home/time_widget.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          DotWidget(
            width: 140,
            height: 140,
            bottom: MediaQuery.sizeOf(context).height * .8,
            right: MediaQuery.sizeOf(context).width * .8,
            color: AppColor.accent.withOpacity(.125),
          ),
          DotWidget(
            width: 140,
            height: 140,
            top: MediaQuery.sizeOf(context).height * .55,
            left: MediaQuery.sizeOf(context).width * .8,
            color: AppColor.accent.withOpacity(.125),
          ),
          DotWidget(
            width: 24,
            height: 24,
            top: MediaQuery.sizeOf(context).height * .5,
            left: MediaQuery.sizeOf(context).width * .1,
            color: AppColor.accent.withOpacity(.125),
          ),
          DotWidget(
            width: 20,
            height: 20,
            top: MediaQuery.sizeOf(context).height * .375,
            left: MediaQuery.sizeOf(context).width * .8,
            color: AppColor.accent.withOpacity(.125),
          ),
          DotWidget(
            width: 40,
            height: 40,
            top: MediaQuery.sizeOf(context).height * .25,
            left: MediaQuery.sizeOf(context).width * .1,
            color: AppColor.accent.withOpacity(.125),
          ),
          DotWidget(
            width: 16,
            height: 16,
            top: MediaQuery.sizeOf(context).height * .625,
            left: MediaQuery.sizeOf(context).width * .4,
            color: AppColor.accent.withOpacity(.125),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.075,
              left: 16,
              right: 16,
              bottom: 16,
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
          ),
        ],
      ),
    );
  }
}
