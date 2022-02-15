import 'package:flawtrack/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProviderMain extends InheritedWidget {
  final AuthService auth;
  final db;

  ProviderMain({key, required Widget child, required this.auth, this.db}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static ProviderMain of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<ProviderMain>() as ProviderMain);
}
