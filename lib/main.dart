import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mmg_companion/constants/colors.dart';

import 'package:mmg_companion/constants/routes.dart';
import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_scroll_behavior.dart';
import 'package:mmg_companion/views/home_view.dart';
import 'package:mmg_companion/views/plan_view.dart';
import 'package:mmg_companion/views/settings_view.dart';
import 'package:mmg_companion/views/statistics_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await fillLocalStorage();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: fakePrimaryColor,
  ));

  runApp(
    MaterialApp(
      title: 'mmg companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.primaryColor,
        primaryColor: primaryColor,
        fontFamily: 'Inter',
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        );
      },
      home: start(),
      routes: {
        homeRoute: (context) => const HomeView(),
        statisticsRoute: ((context) => const StatisticsView()),
        planRoute: ((context) => const PlanView()),
        settingsRoute: ((context) => const SettingsView()),
      },
    ),
  );
}
