import 'package:flutter/material.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/home/widgets/header_widget.dart';
import 'package:zamanix/utils/spacing_list.dart';
import 'package:zamanix/utils/timezone.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isClockIn = false;
  bool isNotificationFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: HeaderWidget(
          isNotificationFilled: isNotificationFilled,
          isNotificationAction: () => setState(
            () => isNotificationFilled = !isNotificationFilled,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: List.generate(
                2,
                (index) => Text(
                  index == 0
                      ? Timezone.getRealTime('Jakarta')
                      : Timezone.getRealDate(),
                  style: index == 0 ? AppTextStyle.h1 : AppTextStyle.body1,
                ),
              ),
            ),
            IconButton(
              onPressed: () => setState(() => isClockIn = !isClockIn),
              splashRadius: MediaQuery.sizeOf(context).width * 0.325,
              iconSize: 240,
              icon: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: isClockIn
                          ? AppColor.error.withOpacity(.4)
                          : AppColor.success.withOpacity(.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0 - 4, 16),
                    ),
                  ],
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: !isClockIn
                        ? [
                            AppColor.success,
                            AppColor.success.withOpacity(.5),
                            AppColor.success.withOpacity(.75)
                          ]
                        : [
                            AppColor.error,
                            AppColor.error.withOpacity(.5),
                            AppColor.error.withOpacity(.75)
                          ],
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImage.appClockInLogo,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Text(
                      isClockIn ? 'Clock Out' : 'Clock In',
                      style: AppTextStyle.h3.copyWith(
                        color: AppColor.backgroundLight,
                      ),
                    ),
                  ].withSpacing(8),
                ),
              ),
            ),
          ].withSpacing(24),
        ),
      ),
    );
  }
}
