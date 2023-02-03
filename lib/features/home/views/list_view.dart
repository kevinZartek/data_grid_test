import 'package:data_grid_test/core/utils/date_utils.dart';
import 'package:data_grid_test/core/widgets/text_field.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:data_grid_test/features/home/view_models/grid_model.dart';
import 'package:data_grid_test/features/home/view_models/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:data_grid_test/core/config/app_text_styles.dart';

class HomeListView extends ConsumerWidget {
  const HomeListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final dataAsync = ref.watch(gridDataProvider);
    final columnListState = ref.watch(currentFieldListStateProvider);
    final columnHeaderState = ref.watch(listHeaderControllerProvider);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: dataAsync.when(
          data: (list) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                String? title;
                String? subtitle;
                if (columnHeaderState.titleField?.type == 'date' ||
                    columnHeaderState.titleField?.type == 'Date') {
                  title = DateTime.tryParse(
                          list[index].data[columnHeaderState.titleField?.key])
                      .toString();
                } else {
                  title = list[index]
                      .data[columnHeaderState.titleField?.key]
                      .toString();
                }
                if (columnHeaderState.subtitleField?.type == 'date' ||
                    columnHeaderState.subtitleField?.type == 'Date') {
                  subtitle = DateTime.tryParse(list[index]
                          .data[columnHeaderState.subtitleField?.key])
                      .toString();
                } else {
                  subtitle = list[index]
                      .data[columnHeaderState.subtitleField?.key]
                      .toString();
                }
                return ListTile(
                  title: Text(
                    '${columnHeaderState.titleField?.label} : $title',
                    style: AppTextStyles.bodyLg,
                  ),
                  subtitle: columnListState.length > 1
                      ? Text(
                          '${columnHeaderState.subtitleField?.label} : $subtitle',
                          style: AppTextStyles.body)
                      : null,
                );
              },
            );
          },
          error: (Object error, StackTrace? stackTrace) {
            return const Center(
                child: Text("Error fetching", style: AppTextStyles.bodySm));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
