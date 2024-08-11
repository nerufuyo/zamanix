import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_route.dart';
import 'package:zamanix/presentation/authentication/bloc/authentication_bloc.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(SignOut());
            AppRoute.navigateTo(context, AppRoute.auth);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
