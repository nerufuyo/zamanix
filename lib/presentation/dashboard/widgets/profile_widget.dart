import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:zamanix/presentation/dashboard/widgets/profile/profile_picture_widget.dart';
import 'package:zamanix/utils/spacing_list.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.07,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProfilePictureWidget(),
            Column(
              children: List.generate(
                2,
                (index) => Text(
                  index == 0 ? 'John Doe' : 'jihan@gmai.com',
                  style: index == 0 ? AppTextStyle.h3 : AppTextStyle.body2,
                ),
              ),
            ),
          ].withSpacing(20),
        ),
      ),
    );
  }
}
