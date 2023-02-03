import 'package:data_grid_test/core/repositories/http_home_repository.dart';
import 'package:data_grid_test/features/home/models/data_item.dart';
import 'package:data_grid_test/features/home/view_models/url_field_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final gridDataProvider = FutureProvider<List<DataItem>>(
  (ref) async {
    final homeRepo = ref.watch(homeRepositoryProvider);
    final url = ref.watch(urlFieldStateProvider);
    return homeRepo.getDetails(url);
  },
);
