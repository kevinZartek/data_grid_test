import 'package:data_grid_test/core/config/app_colors.dart';
import 'package:data_grid_test/core/config/app_text_styles.dart';
import 'package:data_grid_test/core/utils/size_config.dart';
import 'package:data_grid_test/core/widgets/bottom_sheet.dart';
import 'package:data_grid_test/features/home/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        AppBottomSheet.barBottomSheet(
            context: context, body: const SettingsBottomSheet());
      },
      backgroundColor: AppColors.secondary,
      child: const Icon(Icons.settings, color: AppColors.darkAccentColor),
    );
  }
}
