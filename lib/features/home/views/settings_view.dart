import 'package:data_grid_test/core/config/app_colors.dart';
import 'package:data_grid_test/core/config/app_text_styles.dart';
import 'package:data_grid_test/features/home/models/column_item.dart';
import 'package:data_grid_test/core/utils/size_config.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:data_grid_test/features/home/view_models/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class SettingsBottomSheet extends ConsumerWidget {
  const SettingsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final allFieldListState = ref.watch(currentFieldListStateProvider);
    final currentState = ref.watch(settingsControllerProvider);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
            child: Container(
          // color: AppColors.darkAccentColor,
          width: 100.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Settings',
                style: AppTextStyles.h4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkAccentColor),
              ),
              vsBox1,
              Row(
                children: [
                  Text(
                    'Title',
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.6),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ColumnItem>(
                            isExpanded: false,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.darkAccentColor,
                            ),
                            items: allFieldListState.map((ColumnItem item) {
                              return DropdownMenuItem<ColumnItem>(
                                value: item,
                                child: Text(
                                  item.label!,
                                  style: AppTextStyles.bodySm,
                                ),
                              );
                            }).toList(),
                            value: currentState.titleField,
                            onChanged: (ColumnItem? val) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              ref
                                  .read(settingsControllerProvider.notifier)
                                  .changeTitle(val);
                            },
                            hint: const Text(
                              'Choose title',
                              style: AppTextStyles.bodyLg,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Subtitle',
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kDefaultPadding),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.6),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ColumnItem>(
                            isExpanded: false,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.darkAccentColor,
                            ),
                            items: allFieldListState.map((ColumnItem item) {
                              return DropdownMenuItem<ColumnItem>(
                                value: item,
                                child: Text(
                                  item.label!,
                                  style: AppTextStyles.bodySm,
                                ),
                              );
                            }).toList(),
                            value: currentState.subtitleField,
                            onChanged: (ColumnItem? val) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              ref
                                  .read(settingsControllerProvider.notifier)
                                  .changeSubtitle(val);
                            },
                            hint: const Text(
                              'Choose subtitle',
                              style: AppTextStyles.bodyLg,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              vsBox2,
            ],
          ),
        )),
      ),
    );
  }
}
