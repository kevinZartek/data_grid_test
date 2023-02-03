import 'package:data_grid_test/core/repositories/home_repository.dart';
import 'package:data_grid_test/core/services/dio/dio_service.dart';
import 'package:data_grid_test/core/services/dio/http_service.dart';
import 'package:data_grid_test/features/home/models/data_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) {
    final httpService = ref.watch(httpServiceProvider);

    return HttpHomeRepository(httpService);
  },
);

/// Http implementation of the [HomeRepository]
class HttpHomeRepository implements HomeRepository {
  HttpHomeRepository(this.httpService);

  /// Http service used to access an Http client and make calls
  final HttpService httpService;

  @override
  String get path => '';

  @override
  String get apiKey => "";

  @override
  Future<List<DataItem>> getDetails(
    String url, {
    bool forceRefresh = false,
  }) async {
    final responseData = await httpService.get(
      '$url',
      forceRefresh: forceRefresh,
    );

    return List<DataItem>.from(
      (responseData['data'] as List<dynamic>).map<DataItem>(
          (dynamic x) => DataItem.fromJson(x as Map<String, dynamic>)),
    );
  }
}
