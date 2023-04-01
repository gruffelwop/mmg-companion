// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mmg_companion/services/auth_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/dialogs/error_dialog.dart';

class PlanPasswordInputView extends StatefulWidget {
  final String step;
  final String fieldName;
  final String previousRoute;
  final String nextRoute;
  final String punctuation;
  final String hintText;

  const PlanPasswordInputView({
    super.key,
    required this.step,
    required this.fieldName,
    required this.previousRoute,
    required this.nextRoute,
    required this.punctuation,
    required this.hintText,
  });

  @override
  State<PlanPasswordInputView> createState() => _PlanPasswordInputViewState();
}

class _PlanPasswordInputViewState extends State<PlanPasswordInputView> {
  String planPassword = "";

  final double iconSize = 24;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff1b1b1b),
    ));
    planPassword = LocalStorage.getPlanPassword() ?? "";
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
                    await LocalStorage.setPlanPassword(planPassword);
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
                    try {
                      if (planPassword.isNotEmpty == true) {
                        if (await checkUsernameAndPassword(
                            username: LocalStorage.getPlanUsername()!,
                            password: planPassword)) {
                          await LocalStorage.setPlanPassword(planPassword);
                          Navigator.of(context).pushNamed(widget.nextRoute);
                        }
                      }
                    } on SocketException {
                      showErrorDialog(
                        context,
                        "No internet connection.",
                      );
                    } on HttpException {
                      showErrorDialog(
                        context,
                        "Either the username or the password you provided is incorrect.",
                      );
                    } on FormatException {
                      showErrorDialog(
                        context,
                        "Encountered a Format Exception.",
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
                  initialValue: planPassword,
                  style: const TextStyle(
                    color: Color(0x80ffffff),
                    fontSize: 48 - 8,
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
                      planPassword = changedUsername;
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
