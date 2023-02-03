import 'package:flutter/material.dart';

class ColumnItem {
  final String? label;
  final String? key;
  final String? type;

  ColumnItem(this.label, this.key, this.type);
}

class ColumnFieldControllers {
  final TextEditingController labelController;
  final TextEditingController keyController;
  final TextEditingController typeController;

  ColumnFieldControllers(this.labelController, this.keyController, this.typeController);
}