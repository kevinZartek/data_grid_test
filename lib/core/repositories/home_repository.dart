import '../../features/home/models/data_item.dart';

/// Home repository interface
abstract class HomeRepository {
  String get path;


  String get apiKey;

  Future<List<DataItem>> getDetails(
    String url, {
    bool forceRefresh = false,
  });
}
