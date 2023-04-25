import 'package:flutter/material.dart';

import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_conditional_switch_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_section_header_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_conditional_textformfield_widget.dart';

class PlanSettings extends StatefulWidget {
  const PlanSettings({super.key});

  @override
  State<PlanSettings> createState() => _PlanSettingsState();
}

class _PlanSettingsState extends State<PlanSettings> {
  bool? isTeacher;
  bool? isOberstufe;
  bool? automaticCourseEnrollment;

  String abbreviation = "";
  String courses = "";
  String classes = "";

  bool isLoading = false;

  RegExp classesRegex = RegExp(r'^\d{1,2}[a-zA-Z]*(,\s\d{1,2}[a-zA-Z]*)*$');
  RegExp coursesRegex = RegExp(r'^\d[a-zA-Z]*\d(,\s\d[a-zA-Z]*\d)*$');
  RegExp teacherRegex = RegExp(r'^[a-zA-Z]{4}$');
  RegExp emptyRegex = RegExp(r'^[a-zA-Z]{0}$');

  bool? classesInputIsNotValid = false;
  bool? coursesInputIsNotValid = false;
  bool? abbreviationInputIsNotValid = false;

  @override
  void initState() {
    isTeacher = LocalStorage.getIsTeacher() ?? false;
    isOberstufe = LocalStorage.getIsOberstufe() ?? false;
    automaticCourseEnrollment =
        LocalStorage.getAutomaticCourseEnrollment() ?? false;
    abbreviation = LocalStorage.getAbbreviation() ?? "";
    courses = LocalStorage.getCourses() ?? "";
    classes = LocalStorage.getClasses() ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        const CustomSectionHeader(name: "plan settings"),

        // Teacher Switch
        CustomConditionalSwitch(
          condition: true,
          initialValue: isTeacher!,
          name: "teacher",
          margin: true,
          experimental: false,
          onChanged: (changedValue) async {
            if (mounted) {
              setState(() {
                isLoading = true;
              });
            }
            if (mounted) {
              setState(() {
                isTeacher = changedValue;
              });
            }
            await LocalStorage.setIsTeacher(changedValue);
            await fillIndividualLocalStorage();
            await Future.delayed(const Duration(seconds: 1));
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
        ),

        // Oberstufe Switch
        CustomConditionalSwitch(
          condition: isTeacher == false,
          initialValue: isOberstufe!,
          name: "oberstufe",
          margin: true,
          experimental: false,
          onChanged: (changedValue) async {
            if (mounted) {
              setState(() {
                isLoading = true;
              });
            }
            if (mounted) {
              setState(() {
                isOberstufe = changedValue;
              });
            }
            await LocalStorage.setIsOberstufe(changedValue);
            await fillIndividualLocalStorage();
            await Future.delayed(const Duration(seconds: 1));
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
        ),

        // Automatic Courses Switch
        CustomConditionalSwitch(
            condition: isOberstufe == true && isTeacher == false,
            initialValue: automaticCourseEnrollment!,
            name: "automatic courses",
            margin: true,
            experimental: true,
            onChanged: (changedValue) async {
              if (mounted) {
                setState(() {
                  isLoading = true;
                });
              }
              if (mounted) {
                setState(() {
                  automaticCourseEnrollment = changedValue;
                });
              }
              await LocalStorage.setAutomaticCourseEnrollment(changedValue);
              await fillIndividualLocalStorage();
              await Future.delayed(const Duration(seconds: 1));
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }),

        // Abbreviation TextFormField
        Column(
          children: [
            // Teacher TextFormField
            CustomConditionalTextFormField(
              condition: isTeacher!,
              initialValue: abbreviation,
              labelText: "abbreviation",
              hintText: "XXXX",
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              isInputNotValid: abbreviationInputIsNotValid!,
              onChanged: (changedValue) async {
                if (teacherRegex.hasMatch(changedValue) ||
                    emptyRegex.hasMatch(changedValue)) {
                  if (mounted) {
                    setState(() {
                      abbreviationInputIsNotValid = false;
                    });
                  }
                } else {
                  if (mounted) {
                    setState(() {
                      abbreviationInputIsNotValid = true;
                    });
                  }
                }
                if (mounted) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (mounted) {
                  setState(() {
                    abbreviation = changedValue;
                  });
                }
                await LocalStorage.setAbbreviation(changedValue);
                await fillIndividualLocalStorage();
                await Future.delayed(const Duration(seconds: 1));
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            ),

            // Courses TextFormField
            CustomConditionalTextFormField(
              condition: isTeacher == false &&
                  isOberstufe == true &&
                  automaticCourseEnrollment == false,
              initialValue: courses,
              labelText: "courses",
              hintText: "1e1, 1e2",
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              isInputNotValid: coursesInputIsNotValid!,
              onChanged: (changedValue) async {
                if (coursesRegex.hasMatch(changedValue) ||
                    emptyRegex.hasMatch(changedValue)) {
                  if (mounted) {
                    setState(() {
                      coursesInputIsNotValid = false;
                    });
                  }
                } else {
                  if (mounted) {
                    setState(() {
                      coursesInputIsNotValid = true;
                    });
                  }
                }
                if (mounted) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (mounted) {
                  setState(() {
                    courses = changedValue;
                  });
                }
                await LocalStorage.setCourses(changedValue);
                await fillIndividualLocalStorage();
                await Future.delayed(const Duration(seconds: 1));
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            ),

            // Classes TextFormField
            CustomConditionalTextFormField(
              condition: isTeacher == false && isOberstufe == false,
              initialValue: classes,
              labelText: "classes",
              hintText: "5a, 5asm",
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              isInputNotValid: classesInputIsNotValid!,
              onChanged: (changedValue) async {
                if (classesRegex.hasMatch(changedValue) ||
                    emptyRegex.hasMatch(changedValue)) {
                  if (mounted) {
                    setState(() {
                      classesInputIsNotValid = false;
                    });
                  }
                } else {
                  if (mounted) {
                    setState(() {
                      classesInputIsNotValid = true;
                    });
                  }
                }
                if (mounted) {
                  setState(() {
                    isLoading = true;
                  });
                }
                if (mounted) {
                  setState(() {
                    classes = changedValue;
                  });
                }
                await LocalStorage.setClasses(changedValue);
                await fillIndividualLocalStorage();
                await Future.delayed(const Duration(seconds: 1));
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
