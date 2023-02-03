import 'package:hooks_riverpod/hooks_riverpod.dart';

final urlFieldStateProvider =
StateNotifierProvider<UrlFieldStateModel, String>((_) {
  return UrlFieldStateModel();
});



class UrlFieldStateModel extends StateNotifier<String> {
  UrlFieldStateModel() : super('https://us-central1-fir-apps-services.cloudfunctions.net/transactions');

  void updateField(String path) => state = path.trim();
}