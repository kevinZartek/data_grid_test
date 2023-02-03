import 'package:flutter/material.dart';

enum ViewState {
  idle,
  busy,
  error,
}

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  bool _disposed = false;

  bool get isBusy => state == ViewState.busy;
  bool get isIdle => state == ViewState.idle;
  bool get isError => state == ViewState.error;

  ViewState get state => _viewState;

  void setState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_disposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}