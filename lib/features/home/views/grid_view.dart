import 'package:data_grid_test/core/config/app_text_styles.dart';
import 'package:data_grid_test/core/widgets/text_field.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:data_grid_test/features/home/view_models/grid_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeGridView extends ConsumerWidget {
  const HomeGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final dataAsync = ref.watch(gridDataProvider);
    final columnListState = ref.watch(currentFieldListStateProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: dataAsync.when(
            data: (dataList) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                  headingTextStyle: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontSize: 12.0),
                  dataRowHeight: 54.0,
                  showCheckboxColumn: false,
                  columns:
                      // DataColumn(label: Text('${listState[0].label}')),
                      // DataColumn(label: Text('${listState[0].label}')),
                      // DataColumn(label: Text('${listState[0].label}')),
                      // DataColumn(label: Text('${listState[0].label}')),
                      columnListState.map((columnItem) {
                    return DataColumn(label: Text('${columnItem.label}',style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),));
                  }).toList(),
                  rows: dataList.map((e) {
                    final textStyle = TextStyle(
                      color: Theme.of(context).iconTheme.color,
                    );
                    return DataRow(
                        cells:
                            // [
                            //   DataCell(
                            //     Text(e.data[columnListState[0].label].toString(),
                            //         style: textStyle),
                            //   ),
                            //   DataCell(
                            //     Text(e.data[columnListState[0].label].toString(),
                            //         style: textStyle),
                            //   ),
                            //   DataCell(
                            //     Text(e.data[columnListState[0].label].toString(),
                            //         style: textStyle),
                            //   ),
                            //   DataCell(
                            //     Text(e.data[columnListState[0].label].toString(),
                            //         style: textStyle),
                            //   ),
                            // ],
                            columnListState.map((item) {
                      return DataCell(Text(
                        e.data[item.key].toString(),
                        style: textStyle,
                      ));
                    }).toList()
                        // onSelectChanged: (_) =>
                        // context.read<CurrentTrackModel>().selectTrack(e),
                        );
                  }).toList(),
                ),
              );
            },
            error: (Object error, StackTrace? stackTrace) {
              return const Center(child: Text("Error fetching"));
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
