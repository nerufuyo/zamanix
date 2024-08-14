import 'package:flutter/material.dart';
import 'package:zamanix/config/app_asset.dart';
import 'package:zamanix/config/app_theme.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
    required this.isMale,
  });
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      radius: 60,
      onTap: () {},
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.accent.withOpacity(.25),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(60),
          image: DecorationImage(
            image: AssetImage(isMale
                ? AppImage.appMaleProfilePicture
                : AppImage.appFemaleProfilePicture),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(400),
                    bottomRight: Radius.circular(400),
                  ),
                  color: AppColor.accent.withOpacity(.15),
                ),
                child: Center(
                  child: Image.asset(
                    AppImage.appCameraLogo,
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
