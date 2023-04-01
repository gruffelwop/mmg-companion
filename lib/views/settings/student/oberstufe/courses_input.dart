// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/dialogs/error_dialog.dart';

class CoursesInputView extends StatefulWidget {
  final String step;
  final String fieldName;
  final String previousRoute;
  final String nextRoute;
  final String punctuation;
  final String hintText;

  const CoursesInputView({
    super.key,
    required this.step,
    required this.fieldName,
    required this.previousRoute,
    required this.nextRoute,
    required this.punctuation,
    required this.hintText,
  });

  @override
  State<CoursesInputView> createState() => _CoursesInputViewState();
}

class _CoursesInputViewState extends State<CoursesInputView> {
  String courses = "";

  final double iconSize = 24;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff1b1b1b),
    ));
    courses = LocalStorage.getCourses() ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1b1b),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Step ${widget.step}",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    await LocalStorage.setCourses(courses);
                    Navigator.of(context).pushNamed(widget.previousRoute);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: const Color(0x80ffffff),
                    size: iconSize,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // TODO: Proper Exception Handling
                    if (courses.contains(" ") && !courses.contains(",")) {
                      showErrorDialog(
                        context,
                        "Your courses need to be seperated by a comma. Example: 1e1, 1e2",
                      );
                    } else {
                      await LocalStorage.setCourses(courses);
                      // // TODO: Exception Handling
                      Navigator.of(context).pushNamed(widget.nextRoute);
                      await fillIndividualLocalStorage();
                    }
                  },
                  // TODO: Icon gets it's own widget!
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: const Color(0x80ffffff),
                    size: iconSize,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.fieldName + widget.punctuation,
                  style: const TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                    height: 1,
                  ),
                ),
                TextFormField(
                  initialValue: courses,
                  style: const TextStyle(
                    color: Color(0x80ffffff),
                    fontSize: 48,
                    height: 1,
                  ),
                  cursorWidth: 0,
                  keyboardType: TextInputType.name,
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(
                      color: Color(0x80ffffff),
                      fontSize: 48,
                      height: 1,
                    ),
                  ),
                  onChanged: (changedUsername) {
                    setState(() {
                      courses = changedUsername;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
