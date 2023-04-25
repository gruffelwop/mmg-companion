import 'package:flutter/cupertino.dart';
import 'package:mmg_companion/views/plan_view.dart';
import 'package:mmg_companion/views/settings_view.dart';
import 'package:mmg_companion/views/statistics_view.dart';

Map<int, String> siteIndexMappedToSiteString = {
  0: "statistics",
  1: "plan",
  2: "settings",
};

Map<String, int> siteStringMappedToSiteIndex = {
  "statistics": 0,
  "plan": 1,
  "settings": 2,
};

Map<int, Widget> siteIndexMappedToSiteWidget = {
  0: const StatisticsView(),
  1: const PlanView(),
  2: const SettingsView(),
};
