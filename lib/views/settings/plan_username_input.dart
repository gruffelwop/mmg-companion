// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mmg_companion/constants/colors.dart';

import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/dialogs/error_dialog.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';
import 'package:mmg_companion/utilities/widgets/custom_navigation_button_widgets.dart';

class PlanUsernameInputView extends StatefulWidget {
  final String step;
  final String fieldName;
  final String previousRoute;
  final String nextRoute;
  final String punctuation;
  final String hintText;

  const PlanUsernameInputView({
    super.key,
    required this.step,
    required this.fieldName,
    required this.previousRoute,
    required this.nextRoute,
    required this.punctuation,
    required this.hintText,
  });

  @override
  State<PlanUsernameInputView> createState() => _PlanUsernameInputViewState();
}

class _PlanUsernameInputViewState extends State<PlanUsernameInputView> {
  String planUsername = "";

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff1b1b1b),
    ));
    planUsername = LocalStorage.getPlanUsername() ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: backgroundColor,
      //   foregroundColor: primaryColor,
      //   elevation: 0,
      //   child: const Center(
      //       child: Text(
      //     "?",
      //     style: TextStyle(fontSize: 24),
      //   )),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
        child: Stack(
          children: [
            // TODO: Align gets it's own widget, settings_appbar_widget.dart
            Align(
              alignment: Alignment.topLeft,
              child: CustomSettingsBarText(
                content: "Step ${widget.step}",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // displayBackButton(
                //   context: context,
                //   planUsername: planUsername,
                //   previousRoute: widget.previousRoute,
                // ),
                ForwardButton(
                  onTap: () async {
                    if (planUsername.isNotEmpty) {
                      await LocalStorage.setPlanUsername(planUsername);
                      Navigator.of(context).pushNamed(widget.nextRoute);
                    } else {
                      showErrorDialog(
                        context,
                        "Please enter the username for the plan. Hint: The school is pretty sus.",
                      );
                    }
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBodyText(content: widget.fieldName + widget.punctuation),
                TextFormField(
                  initialValue: planUsername,
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
                      planUsername = changedUsername;
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
