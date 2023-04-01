// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/dialogs/error_dialog.dart';

class ClassInputView extends StatefulWidget {
  final String step;
  final String fieldName;
  final String previousRoute;
  final String nextRoute;
  final String punctuation;
  final String hintText;

  const ClassInputView({
    super.key,
    required this.step,
    required this.fieldName,
    required this.previousRoute,
    required this.nextRoute,
    required this.punctuation,
    required this.hintText,
  });

  @override
  State<ClassInputView> createState() => _ClassInputViewState();
}

class _ClassInputViewState extends State<ClassInputView> {
  String className = "";
  List<String> validChar = ["1", "2", "3", "t"];

  final double iconSize = 24;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff1b1b1b),
    ));
    className = LocalStorage.getClass() ?? "";
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
                style: const TextStyle(
                  color: Color(0x80ffffff),
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
                    await LocalStorage.setClass(className);
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
                    // Not working!
                    if (className.length == 2 || className.length == 3) {
                      String x = className.toLowerCase().characters.last;
                      bool valid = true;
                      for (int i = 0; i < x.length; i++) {
                        if (!validChar.contains(x[i])) {
                          valid = false;
                        }
                      }
                      // if (valid == true) {
                      //   className.toLowerCase().characters.;
                      // }
                      if (valid == true) {
                        await LocalStorage.setClass(className);
                        Navigator.of(context).pushNamed(widget.nextRoute);
                      } else {
                        showErrorDialog(
                          context,
                          "Please enter a valid class.\nExample: 10B",
                        );
                      }
                      // This needs to be reworked.
                      // The class cannot be shorter than 2 and longer than 3 characters.
                      // The last character has to be in the alphabet.
                      // The two characters in front of that have to be between 5 and 11. (G9)
                    } else {
                      showErrorDialog(
                        context,
                        "Please enter a valid class.\nExample: 10B",
                      );
                    }
                  },
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
                  initialValue: className,
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
                      className = changedUsername;
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
