class DataItem {
  final Map<dynamic, dynamic> data;

  DataItem(this.data);

  factory DataItem.fromJson(dynamic json) {
    assert(json is Map);
    return DataItem(json);
  }
}