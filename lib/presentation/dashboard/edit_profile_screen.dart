import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/dashboard/bloc/user/user_bloc.dart';
import 'package:zamanix/presentation/dashboard/widgets/appbar_form_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUser());
  }

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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          bool userLoaded = state is UserSuccess;
          final userModel = userLoaded ? (state).userModel : null;

          if (state is UserFailure) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyle.body1.copyWith(color: AppColor.error),
              ),
            );
          }

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        errorStyle: AppTextStyle.body3.copyWith(color: AppColor.error),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.accent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.error),
        ),
      ),
      validator: validator,
    );
  }
}
