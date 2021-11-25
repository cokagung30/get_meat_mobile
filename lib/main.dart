import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get_meat_apps/cubit/global_cubit.dart';
import 'package:get_meat_apps/injection.dart';
import 'package:get_meat_apps/routes/get_meat_routes.dart';
import 'package:get_meat_apps/routes/get_meat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return BlocProvider(
      create: (_) => GlobalCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: GetMeatScreen.splash,
          getPages: GetMeatRoutes.screen,
        ),
      ),
    );
  }
}
