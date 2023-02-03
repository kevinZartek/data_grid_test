import 'package:data_grid_test/features/home/models/column_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentFieldListStateProvider = StateNotifierProvider<
    CurrentFieldListStateModel,
    List<ColumnItem>>((ref) {
  return CurrentFieldListStateModel(reader: ref.read);
});

class CurrentFieldListStateModel extends StateNotifier<List<ColumnItem>> {

  CurrentFieldListStateModel({required this.reader, String? text}) : super([]);
  final Reader reader;

  void updateFields(List<ColumnItem> fieldList) {
    if (fieldList.isNotEmpty) {
      state = fieldList;
    }
  }
}