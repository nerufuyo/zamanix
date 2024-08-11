import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_config.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/home/bloc/location/location_bloc.dart';
import 'package:zamanix/utils/spacing_list.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.isNotificationAction,
    required this.isNotificationFilled,
  });

  final void Function() isNotificationAction;
  final bool isNotificationFilled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.backgroundLight,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Column(
            children: [
              Text(
                AppConfig.appName,
                style: AppTextStyle.h2.copyWith(
                  color: AppColor.textLight,
                ),
              ),
              BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoaded) {
                    return Text(
                      "${state.city}, ${state.country}",
                      style: AppTextStyle.caption.copyWith(
                        color: AppColor.textLight,
                      ),
                    );
                  }

                  if (state is LocationError) {
                    return Text(
                      state.message,
                      style: AppTextStyle.caption.copyWith(
                        color: AppColor.error,
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ].withSpacing(4),
          ),
          IconButton(
            onPressed: () => isNotificationAction(),
            icon: Image.asset(
              isNotificationFilled
                  ? AppImage.appNotificationFillLogo
                  : AppImage.appNotificationLogo,
              width: 24,
              height: 24,
            ),
          ),
        ].withSpacing(8),
      ),
    );
  }
}
