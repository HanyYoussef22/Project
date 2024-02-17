import 'package:flutter/material.dart';
import 'package:project/core/routing/app_router.dart';

import 'core/di/depenaancy_injection.dart';
import 'doc_app.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}