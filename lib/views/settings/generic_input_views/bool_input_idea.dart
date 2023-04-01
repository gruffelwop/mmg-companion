// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/dialogs/error_dialog.dart';
import 'package:mmg_companion/utilities/widgets/custom_page_scaffold_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';
import 'package:mmg_companion/utilities/widgets/custom_navigation_button_widgets.dart';

class BoolInputViewIdea extends StatefulWidget {
  final String step;
  final String fieldName;
  final String fieldKey;
  final String previousRoute;
  final String nextTrueRoute;
  final String nextFalseRoute;
  final String hintText;
  final String errorMessage;

  const BoolInputViewIdea({
    super.key,
    required this.step,
    required this.fieldName,
    required this.fieldKey,
    required this.previousRoute,
    required this.hintText,
    required this.errorMessage,
    required this.nextTrueRoute,
    required this.nextFalseRoute,
  });

  @override
  State<BoolInputViewIdea> createState() => _BoolInputViewIdeaState();
}

class _BoolInputViewIdeaState extends State<BoolInputViewIdea> {
  String value = "";

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff1b1b1b),
    ));
    value = LocalStorage.getBool(widget.fieldKey) == true ? "true" : "false";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      child: Stack(
        children: [
          // TODO: Align gets its own widget, settings_appbar_widget.dart
          Align(
            alignment: Alignment.topLeft,
            child: CustomSettingsBarText(
              content: "Step ${widget.step}",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.previousRoute == ""
                  ? Container()
                  : BackwardButton(onTap: () async {
                      if (value.toLowerCase() == "true") {
                        await LocalStorage.setBool(widget.fieldKey, true);
                        Navigator.of(context).pushNamed(widget.previousRoute);
                      } else if (value.toLowerCase() == "false") {
                        await LocalStorage.setBool(widget.fieldKey, false);
                        Navigator.of(context).pushNamed(widget.previousRoute);
                      } else {
                        Navigator.of(context).pushNamed(widget.previousRoute);
                      }
                    }),
              widget.nextTrueRoute == "" && widget.nextFalseRoute == ""
                  ? const SizedBox(width: 24)
                  : ForwardButton(
                      onTap: () async {
                        if (value.toLowerCase() == "true") {
                          await LocalStorage.setBool(widget.fieldKey, true);
                          Navigator.of(context).pushNamed(widget.nextTrueRoute);
                        } else if (value.toLowerCase() == "false") {
                          await LocalStorage.setBool(widget.fieldKey, false);
                          Navigator.of(context)
                              .pushNamed(widget.nextFalseRoute);
                        } else {
                          showErrorDialog(
                            context,
                            widget.errorMessage,
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
              CustomBodyText(content: "${widget.fieldName}."),
              TextFormField(
                initialValue: value,
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
                onChanged: (changedValue) {
                  setState(() {
                    value = changedValue;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
