// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/dialogs/error_dialog.dart';
import 'package:mmg_companion/utilities/widgets/custom_page_scaffold_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';
import 'package:mmg_companion/utilities/widgets/custom_navigation_button_widgets.dart';

class BooleanStringInputViewIdea extends StatefulWidget {
  final String step;
  final String fieldName;
  final String fieldKey;
  final String previousRoute;
  final String nextRoute;
  final String hintText;
  final String errorMessage;

  const BooleanStringInputViewIdea({
    super.key,
    required this.step,
    required this.fieldName,
    required this.fieldKey,
    required this.previousRoute,
    required this.nextRoute,
    required this.hintText,
    required this.errorMessage,
  });

  @override
  State<BooleanStringInputViewIdea> createState() =>
      _BooleanStringInputViewIdeaState();
}

class _BooleanStringInputViewIdeaState
    extends State<BooleanStringInputViewIdea> {
  String value = "";

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xff1b1b1b),
    ));
    value = LocalStorage.getString(widget.fieldKey) ?? "";
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
                      await LocalStorage.setString(widget.fieldKey, value);
                      Navigator.of(context).pushNamed(widget.previousRoute);
                    }),
              widget.nextRoute == ""
                  ? const SizedBox(width: 24)
                  : ForwardButton(
                      onTap: () async {
                        if (value.isNotEmpty) {
                          await LocalStorage.setString(widget.fieldKey, value);
                          Navigator.of(context).pushNamed(widget.nextRoute);
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
