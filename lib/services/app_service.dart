// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/routes.dart';
import 'package:mmg_companion/services/data_fetching_layer.dart';
import 'package:mmg_companion/services/data_processing_layer.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/views/home_view.dart';
import 'package:mmg_companion/views/home_view_exp.dart';
import 'package:mmg_companion/views/settings/plan_username_input.dart';

Widget start() {
  if (LocalStorage.getIsRegistered() == true) {
    return const HomeViewExp();
  } else {
    return const PlanUsernameInputView(
      step: "1",
      fieldName: "plan username",
      previousRoute: "",
      nextRoute: planPasswordRoute,
      punctuation: ".",
      hintText: "plan username",
    );
  }
}

Future fillLocalStorage() async {
  if (LocalStorage.getIsRegistered() == true) {
    try {
      await LocalStorage.setDateTodayOrLastSchoolDay(
        getPlanDate(await getPageTodayOrLastSchoolDay()),
      );
    } on SocketException {
      DoNothingAction;
    }

    try {
      await LocalStorage.setDateNextSchoolDay(
        getPlanDate(await getPageNextSchoolDay()),
      );
    } on SocketException {
      DoNothingAction;
    }

    try {
      await LocalStorage.setDateSchoolDayAfterNextSchoolDay(
        getPlanDate(await getPageSchoolDayAfterNextSchoolDay()),
      );
    } on SocketException {
      DoNothingAction;
    }

    try {
      await LocalStorage.setPlanTodayOrLastSchoolDay(
        getPlan(await getPageTodayOrLastSchoolDay()),
      );
    } on SocketException {
      DoNothingAction;
    }

    try {
      await LocalStorage.setPlanNextSchoolDay(
        getPlan(await getPageNextSchoolDay()),
      );
    } on SocketException {
      DoNothingAction;
    }

    try {
      await LocalStorage.setPlanSchoolDayAfterNextSchoolDay(
        getPlan(await getPageSchoolDayAfterNextSchoolDay()),
      );
    } on SocketException {
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
