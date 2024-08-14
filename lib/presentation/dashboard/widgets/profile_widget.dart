import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zamanix/config/app_theme.dart';
import 'package:zamanix/presentation/dashboard/bloc/user/user_bloc.dart';
import 'package:zamanix/presentation/dashboard/widgets/profile/menu_information_app_widget.dart.dart';
import 'package:zamanix/presentation/dashboard/widgets/profile/profile_picture_widget.dart';
import 'package:zamanix/presentation/dashboard/widgets/profile/profile_quick_info_widget.dart';
import 'package:zamanix/utils/constant.dart';
import 'package:zamanix/utils/spacing_list.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
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

        bool isMale = userModel?.gender == 'Male';

        return Skeletonizer(
          enabled: state is UserLoading || state is UserInitial,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.1,
              left: 16,
              right: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfilePictureWidget(isMale: isMale),
                  ProfileQuickInfoWidget(userModel: userModel),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemCount: profileItemMenus.length,
                    itemBuilder: (context, index) => ListTile(
                      dense: true,
                      tileColor: AppColor.textDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: Image.asset(
                        profileItemMenus[index]['icon'].toString(),
                        width: 20,
                      ),
                      title: Text(
                        profileItemMenus[index]['label'].toString(),
                        style: AppTextStyle.body2,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColor.accent,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    color: AppColor.accent.withOpacity(.25),
                    thickness: 2,
                  ),
                  const MenuInformationAppWidget()
                ].withSpacing(16),
              ),
            ),
          ),
        );
      },
    );
  }
}
