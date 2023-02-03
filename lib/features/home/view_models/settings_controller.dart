import 'package:data_grid_test/features/home/models/column_item.dart';
import 'package:data_grid_test/features/home/state/list_header_state.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsControllerProvider =
    StateNotifierProvider.autoDispose<SettingsController, ListHeaderState>(
        (ref) {
  final columnListState = ref.watch(currentFieldListStateProvider);
  return SettingsController(columnListState);
});

class SettingsController extends StateNotifier<ListHeaderState> {
  SettingsController(this.columnListState) : super(ListHeaderState.initial()) {
    initState();
  }

  final List<ColumnItem> columnListState;

  void initState() {
    state = state.copyWith(
        titleField: columnListState.isNotEmpty ? columnListState[0] : null,
        subtitleField: columnListState.length > 1 ? columnListState[1] : null,
        status: ListHeaderStatus.loaded);
  }

  void changeTitle(titleItem) {
    state = state.copyWith(titleField: titleItem);
  }

  void changeSubtitle(subTitleItem) {
    state = state.copyWith(subtitleField: subTitleItem);
  }

  void reset() {
    state = ListHeaderState.initial();
  }
}
