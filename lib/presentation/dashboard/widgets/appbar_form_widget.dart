import 'package:flutter/material.dart';
import 'package:zamanix/config/app_theme.dart';

class AppBarForm extends StatelessWidget {
  const AppBarForm({
    super.key,
    required this.isEditEnabled,
    required this.isDataEmpty,
    this.onAdd,
    this.onSave,
    required this.title,
  });

  final String title;
  final bool isEditEnabled;
  final bool isDataEmpty;
  final Function? onAdd;
  final Function? onSave;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.accent,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Text(title, style: AppTextStyle.h5),
          isEditEnabled
              ? InkWell(
                  onTap: () {
                    if (isDataEmpty) {
                      onAdd != null ? onAdd!() : null;
                    } else {
                      onSave != null ? onSave!() : null;
                    }
                  },
                  child: Text(
                    isDataEmpty ? '  Add' : 'Save',
                    style: AppTextStyle.body2,
                  ),
                )
              : const SizedBox(width: 40),
        ],
      ),
    );
  }
}
