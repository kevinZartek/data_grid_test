import 'package:data_grid_test/core/utils/size_config.dart';
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
    final columnHeaderState = ref.watch(settingsControllerProvider);
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
                  // title = DateTime.tryParse(
                  //         list[index].data[columnHeaderState.titleField?.key])
                  //     .toString();
                  var date = DateTime.tryParse(
                      list[index].data[columnHeaderState.titleField?.key]);
                  if (date != null) {
                    title = DateFormat("yyyy-MM-dd hh:mm:ss").format(date);
                  } else {
                    title = list[index].data[columnHeaderState.titleField?.key];
                  }
                } else {
                  title = list[index]
                      .data[columnHeaderState.titleField?.key]
                      .toString();
                }
                if (columnHeaderState.subtitleField?.type == 'date' ||
                    columnHeaderState.subtitleField?.type == 'Date') {
                  var date = DateTime.tryParse(
                      list[index].data[columnHeaderState.subtitleField?.key]);
                  if (date != null) {
                    subtitle = DateFormat("yyyy-MM-dd hh:mm:ss").format(date);
                  } else {
                    subtitle = list[index]
                        .data[columnHeaderState.subtitleField?.key]
                        .toString();
                  }
                } else {
                  subtitle = list[index]
                      .data[columnHeaderState.subtitleField?.key]
                      .toString();
                }
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${columnHeaderState.titleField?.label}',
                          style: AppTextStyles.body),
                      hsBox1,
                      Expanded(
                        child: Text(
                          title ?? '',
                          style: AppTextStyles.bodyLg
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  subtitle: columnListState.length > 1
                      ? Row(
                          children: [
                            Text('${columnHeaderState.subtitleField?.label}  ',
                                style: AppTextStyles.body),
                            hsBox1,
                            Text(subtitle ?? '',
                                style: AppTextStyles.body
                                    .copyWith(fontWeight: FontWeight.w500)),
                          ],
                        )
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
