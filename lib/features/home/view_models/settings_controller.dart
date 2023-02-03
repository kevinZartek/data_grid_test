import 'package:data_grid_test/core/models/column_item.dart';
import 'package:data_grid_test/features/home/state/list_header_state.dart';
import 'package:data_grid_test/features/home/view_models/current_field_list_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final listHeaderControllerProvider =
    StateNotifierProvider.autoDispose<ListHeaderController, ListHeaderState>(
        (ref) {
  final columnListState = ref.watch(currentFieldListStateProvider);
  return ListHeaderController(columnListState);
});

class ListHeaderController extends StateNotifier<ListHeaderState> {
  ListHeaderController(this.columnListState)
      : super(ListHeaderState.initial()) {
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
    // if (state.selectedNoFilter) return;
    state = state.copyWith(titleField: titleItem);
  }

  void changeSubtitle(subTitleItem) {
    state = state.copyWith(subtitleField: subTitleItem);
  }

  // void markFilterSubItem(FilterSubItem filterSubItem, bool? _selected) {
  //   if (_selected != null && _selected) {
  //     state = state.copyWith(
  //       selected: _selected,
  //       status: TaskFilterStatus.intermediate,
  //       selectedFilters: [...state.selectedFilters, filterSubItem],
  //     );
  //   } else {
  //     state = state.copyWith(
  //       selected: _selected,
  //       status: TaskFilterStatus.intermediate,
  //       selectedFilters: state.selectedFilters..remove(filterSubItem),
  //     );
  //   }
  // }

  void reset() {
    state = ListHeaderState.initial();
  }
}
