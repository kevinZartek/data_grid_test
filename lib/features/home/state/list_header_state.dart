import 'package:data_grid_test/core/models/column_item.dart';
import 'package:equatable/equatable.dart';

enum ListHeaderStatus { initial, loaded, error }

class ListHeaderState extends Equatable {
  final ColumnItem? titleField;
  final ColumnItem? subtitleField;
  final ListHeaderStatus status;

  // bool checkIfOnlineById(String userId) {
  //   return onlinePKs.contains(userId);
  // }

  const ListHeaderState(
      {required this.titleField,
      required this.subtitleField,
      required this.status});

  factory ListHeaderState.initial() {
    return const ListHeaderState(
        titleField: null,
        subtitleField: null,
        status: ListHeaderStatus.initial);
  }

  @override
  List<Object> get props => [
        titleField!,
        subtitleField!,
        status,
      ];

  ListHeaderState copyWith({
    ColumnItem? titleField,
    ColumnItem? subtitleField,
    ListHeaderStatus? status,
  }) {
    return ListHeaderState(
        titleField: titleField ?? this.titleField,
        subtitleField: subtitleField ?? this.subtitleField,
        status: status ?? this.status);
  }
}
