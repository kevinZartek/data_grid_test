import 'package:data_grid_test/core/models/column_item.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addColumnListController = StateNotifierProvider.autoDispose<
    AddColumnListController, List<ColumnFieldControllers>>((ref) {
  return AddColumnListController(reader: ref.read);
});

class AddColumnListController
    extends StateNotifier<List<ColumnFieldControllers>> {
  final List<ColumnFieldControllers> _disposedList = [];

  AddColumnListController({required this.reader, String? text}) : super([]) {
    init();
  }

  final List<ColumnItem> _fieldList = [];
  final Reader reader;

  @override
  void dispose() {
    super.dispose();
    print("DISPOSE===========");
    for (final target in _disposedList) {
      target.labelController.dispose();
      target.keyController.dispose();
      target.typeController.dispose();
    }
  }

  void init() {
    state = [
      ColumnFieldControllers(
          TextEditingController(text: "Name"),
          TextEditingController(text: "name"),
          TextEditingController(text: 'string'))
    ];
  }

  void add({String? text}) {
    bool isEmptyField = false;
    if (state.length >= 4) return;
    for (int i = 0; i < state.length; i++) {
      if (state[i].labelController.text == '' ||
          state[i].typeController.text == '' ||
          state[i].keyController.text == '') isEmptyField = true;
    }
    if (isEmptyField) {
      // Alert.showToast("Please enter a  value");
    } else {
      state = [
        ...state,
        ColumnFieldControllers(
            TextEditingController(text: text),
            TextEditingController(text: text),
            TextEditingController(text: text))
      ];
    }
  }

  void remove(int index) {
    if (index < 0 || index >= state.length) {
      return;
    }
    final target = state[index];
    _disposedList.add(target);
    state.remove(target);
    state = [...state];
  }
  String? validateString(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Mandatory field";
    }
    return null;
  }
  void submit() {
    _fieldList.clear();
    for (int i = 0; i < state.length; i++) {
      ColumnItem item = ColumnItem(state[i].labelController.text,
          state[i].keyController.text, state[i].typeController.text);
      _fieldList.add(item);
    }
    reader(currentFieldListStateProvider.notifier).state = _fieldList;
  }
}
