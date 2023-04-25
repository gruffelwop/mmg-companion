import 'package:flutter/material.dart';

import 'package:html/dom.dart' as dom;

import 'package:mmg_companion/services/data_fetching_layer.dart';
import 'package:mmg_companion/services/data_processing_layer.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/views/home_view.dart';
import 'package:mmg_companion/views/login/login_view.dart';

Widget start() {
  if (LocalStorage.getIsRegistered() == true) {
    return const HomeView();
  } else {
    return const LoginView();
  }
}

Future<void> applyDefaultSettings() async {
  await LocalStorage.setIsRegistered(false);
  await LocalStorage.setIsTeacher(false);
  await LocalStorage.setIsOberstufe(false);
  await LocalStorage.setAutomaticCourseEnrollment(false);
  await LocalStorage.setCourses("");
  await LocalStorage.setClasses("");
  await LocalStorage.setStartPage("plan");
}

Future fillLocalStorage() async {
  if (LocalStorage.getIsRegistered() == true) {
    dom.Document? pageTodayOrLastSchoolDay;
    dom.Document? pageNextSchoolDay;
    dom.Document? pageSchoolDayAfterNextSchoolDay;

    // TodayOrLastSchoolDay

    try {
      pageTodayOrLastSchoolDay = await getPageTodayOrLastSchoolDay();

      // Plan Date

      await LocalStorage.setDateTodayOrLastSchoolDay(
        getPlanDate(pageTodayOrLastSchoolDay),
      );

      // Plan

      await LocalStorage.setPlanTodayOrLastSchoolDay(
        getPlan(pageTodayOrLastSchoolDay),
      );

      // Last Updated

      await LocalStorage.setLastUpdatedTodayOrLastSchoolDay(
        getPlanLastUpdated(pageTodayOrLastSchoolDay),
      );

      // Individual Plan

      await LocalStorage.setIndividualPlanTodayOrLastSchoolDay(
        getIndividualPlan(LocalStorage.getPlanTodayOrLastSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }

    // NextSchoolDay

    try {
      pageNextSchoolDay = await getPageNextSchoolDay();

      // Plan Date

      await LocalStorage.setDateNextSchoolDay(
        getPlanDate(pageNextSchoolDay),
      );

      // Plan

      await LocalStorage.setPlanNextSchoolDay(
        getPlan(pageNextSchoolDay),
      );

      // Last Updated

      await LocalStorage.setLastUpdatedNextSchoolDay(
        getPlanLastUpdated(pageNextSchoolDay),
      );

      // Individual Plan

      await LocalStorage.setIndividualPlanNextSchoolDay(
        getIndividualPlan(LocalStorage.getPlanNextSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }

    // SchoolDayAfterNextSchoolDay

    try {
      pageSchoolDayAfterNextSchoolDay =
          await getPageSchoolDayAfterNextSchoolDay();

      // Plan Date

      await LocalStorage.setDateSchoolDayAfterNextSchoolDay(
        getPlanDate(pageSchoolDayAfterNextSchoolDay),
      );

      // Plan

      await LocalStorage.setPlanSchoolDayAfterNextSchoolDay(
        getPlan(pageSchoolDayAfterNextSchoolDay),
      );

      // Last Updated

      await LocalStorage.setLastUpdatedSchoolDayAfterNextSchoolDay(
        getPlanLastUpdated(pageSchoolDayAfterNextSchoolDay),
      );

      // Individual Plan

      await LocalStorage.setIndividualPlanSchoolDayAfterNextSchoolDay(
        getIndividualPlan(LocalStorage.getPlanSchoolDayAfterNextSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }
  }
}

Future fillLocalStorageSmallTimeout() async {
  fillLocalStorage().timeout(const Duration());
  if (LocalStorage.getIsRegistered() == true) {
    try {
      await LocalStorage.setDateTodayOrLastSchoolDay(
        getPlanDate(await getPageTodayOrLastSchoolDaySmallTimeout()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setDateNextSchoolDay(
        getPlanDate(await getPageNextSchoolDaySmallTimeout()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setDateSchoolDayAfterNextSchoolDay(
        getPlanDate(await getPageSchoolDayAfterNextSchoolDaySmallTimeout()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setPlanTodayOrLastSchoolDay(
        getPlan(await getPageTodayOrLastSchoolDaySmallTimeout()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setPlanNextSchoolDay(
        getPlan(await getPageNextSchoolDaySmallTimeout()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setPlanSchoolDayAfterNextSchoolDay(
        getPlan(await getPageSchoolDayAfterNextSchoolDaySmallTimeout()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setIndividualPlanTodayOrLastSchoolDay(
        getIndividualPlan(LocalStorage.getPlanTodayOrLastSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setIndividualPlanNextSchoolDay(
        getIndividualPlan(LocalStorage.getPlanNextSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }
    try {
      await LocalStorage.setIndividualPlanSchoolDayAfterNextSchoolDay(
        getIndividualPlan(LocalStorage.getPlanSchoolDayAfterNextSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }
  }
}

Future fillIndividualLocalStorage() async {
  if (LocalStorage.getIsRegistered() == true) {
    try {
      await LocalStorage.setIndividualPlanTodayOrLastSchoolDay(
        getIndividualPlan(LocalStorage.getPlanTodayOrLastSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }

    try {
      await LocalStorage.setIndividualPlanNextSchoolDay(
        getIndividualPlan(LocalStorage.getPlanNextSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }

    try {
      await LocalStorage.setIndividualPlanSchoolDayAfterNextSchoolDay(
        getIndividualPlan(LocalStorage.getPlanSchoolDayAfterNextSchoolDay()),
      );
    } on Exception {
      DoNothingAction;
    }
  }
}
