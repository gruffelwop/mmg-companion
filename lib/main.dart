import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/routes.dart';
import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_scroll_behavior.dart';
import 'package:mmg_companion/views/home_view.dart';
import 'package:mmg_companion/views/home_view_exp.dart';
import 'package:mmg_companion/views/settings/plan_password_input.dart';
import 'package:mmg_companion/views/settings/plan_username_input_exp01.dart';
import 'package:mmg_companion/views/settings/student/oberstufe/courses_input.dart';
import 'package:mmg_companion/views/settings/student/gender_input.dart';
import 'package:mmg_companion/views/settings/student/is_oberstufe_input_view.dart';
import 'package:mmg_companion/views/settings/student/unterstufe-mittelstufe/class_input_view.dart';
import 'package:mmg_companion/views/settings/teacher/abbreviation_input_view.dart';
import 'package:mmg_companion/views/settings/is_teacher_input.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await fillLocalStorage();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        planUsernameRoute: (context) => const PlanUsernameInputViewExp01(
              step: "1",
              fieldName: "plan username",
              previousRoute: "",
              nextRoute: planPasswordRoute,
              punctuation: ".",
              hintText: "plan username",
            ),
        planPasswordRoute: (context) => const PlanPasswordInputView(
              step: "2",
              fieldName: "plan password",
              previousRoute: planUsernameRoute,
              nextRoute: isTeacherRoute,
              punctuation: ".",
              hintText: "plan password",
            ),
        isTeacherRoute: (context) => const TeacherInputView(
              step: "3",
              fieldName: "teacher",
              previousRoute: planPasswordRoute,
              nextStudentRoute: genderRoute,
              nextTeacherRoute: abbreviationRoute,
              punctuation: "?",
              hintText: "true/false",
            ),
        // if (isTeacher == true)
        abbreviationRoute: (context) => const AbbreviationInputView(
              step: "4",
              fieldName: "abbreviation",
              previousRoute: isTeacherRoute,
              nextRoute: homeRoute,
              punctuation: ".",
              hintText: "XXXX",
            ),
        // if (isTeacher == false)
        genderRoute: (context) => const GenderInputView(
              step: "4",
              fieldName: "gender",
              previousRoute: isTeacherRoute,
              nextRoute: isOberstufeRoute,
              punctuation: ".",
              hintText: "male/female",
            ),
        isOberstufeRoute: (context) => const OberstufeInputView(
              step: "5",
              fieldName: "oberstufe",
              previousRoute: genderRoute,
              nextOberstufeRoute: coursesRoute,
              nextStudentRoute: classRoute,
              punctuation: "?",
              hintText: "true/false",
            ),
        // if (isOberstufe == true)
        coursesRoute: (context) => const CoursesInputView(
              step: "6",
              fieldName: "courses",
              previousRoute: isOberstufeRoute,
              nextRoute: homeRoute,
              punctuation: ".",
              hintText: "courses",
            ),
        // if (isOberstufe == false)
        classRoute: (context) => const ClassInputView(
              step: "6",
              fieldName: "class",
              previousRoute: isOberstufeRoute,
              nextRoute: homeRoute,
              punctuation: ".",
              hintText: "class",
            ),
        // home
        homeRoute: (context) => const HomeViewExp(),
      },
    ),
  );
}
