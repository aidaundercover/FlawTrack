import 'package:flawtrack/services/auth_service.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final AuthService auth;
  final db;
  final colors;

  Provider({required key, required Widget child, required this.auth, this.db, this.colors}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider);
}
