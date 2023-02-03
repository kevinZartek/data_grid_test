import 'package:data_grid_test/core/models/base_view_model.dart';
import 'package:data_grid_test/core/repositories/home_repository.dart';
import 'package:data_grid_test/core/repositories/http_home_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectPageViewProvider =
    ChangeNotifierProvider<ConnectPageViewModel>((ref) {
  final homeRepo = ref.watch(homeRepositoryProvider);
  return ConnectPageViewModel(homeRepo, ref.read);
});

class ConnectPageViewModel extends BaseViewModel {
  ConnectPageViewModel(this.homeRepository, this.reader) {}

  final HomeRepository homeRepository;
  final Reader reader;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
// Future<HitchResponseModelData?> getData() async {
//   setState(ViewState.busy);
//     // Alert.showToast('Please agree to terms and conditions');
//     setState(ViewState.idle);
//     return null;
//   }
}
