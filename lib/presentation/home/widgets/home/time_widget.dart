import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/home/bloc/timezone/timezone_bloc.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimezoneBloc, TimezoneState>(
      builder: (context, state) {
        if (state is TimezoneLoaded) {
          return Column(
            children: List.generate(
              2,
              (index) => Text(
                index == 0 ? state.time : state.date,
                style: index == 0 ? AppTextStyle.h1 : AppTextStyle.body1,
              ),
            ),
          );
        }

        if (state is TimezoneError) {
          return Text(
            state.message,
            style: AppTextStyle.body1.copyWith(
              color: AppColor.error,
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
