import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/core/routing/app_router.dart';

import 'core/routing/routers.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Doc App',
        theme: ThemeData(
            primaryColor: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routers.onBordingScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
