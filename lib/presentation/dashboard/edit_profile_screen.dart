import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/dashboard/bloc/user/user_bloc.dart';
import 'package:zamanix/presentation/dashboard/widgets/appbar_form_widget.dart';
import 'package:zamanix/repositories/models/user_model.dart';
import 'package:zamanix/utils/app_constant.dart';
import 'package:zamanix/utils/app_custom_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(
    editUserItems.length,
    (index) => TextEditingController(),
  );

  bool isEditEnabled = false;

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
        child: AppBarForm(title: 'Edit Profile'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          bool userLoaded = state is UserSuccess;
          final userModel = userLoaded ? (state).userModel : null;
          final controllerValues = [
            userModel?.fullname,
            userModel?.email,
            userModel?.mobilePhone,
            userModel?.gender,
            userModel?.birthOfDate,
            userModel?.bloodType,
            userModel?.maritalStatus,
            userModel?.address,
            userModel?.nik,
            userModel?.passport,
          ];

          if (userLoaded) {
            for (int i = 0; i < _controllers.length; i++) {
              _controllers[i].text = controllerValues[i] ?? '';
            }
          }

          if (state is UserFailure) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyle.body1.copyWith(color: AppColor.error),
              ),
            );
          }

          return Skeletonizer(
            enabled: !userLoaded,
            child: Form(
              key: _formKey,
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: 24,
                  bottom: MediaQuery.of(context).size.height / 8,
                  left: 16,
                  right: 16,
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: editUserItems.length,
                itemBuilder: (context, index) =>
                    AppCustomWidget().buildTextField(
                  controller: _controllers[index],
                  labelText: editUserItems[index],
                  enabled: isEditEnabled,
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            if (!isEditEnabled) {
              setState(() {
                isEditEnabled = true;
              });
            } else {
              if (_formKey.currentState!.validate()) {
                final user = UserModel(
                  fullname: _controllers[0].text,
                  email: _controllers[1].text,
                  mobilePhone: _controllers[2].text,
                  gender: _controllers[3].text,
                  birthOfDate: _controllers[4].text,
                  bloodType: _controllers[5].text,
                  maritalStatus: _controllers[6].text,
                  address: _controllers[7].text,
                  nik: _controllers[8].text,
                  passport: _controllers[9].text,
                );
                context.read<UserBloc>().add(UpdateUser(user));
                setState(() {
                  isEditEnabled = false;
                });
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              isEditEnabled ? 'Save' : 'Edit',
            ),
          ),
        ),
      ),
    );
  }
}
