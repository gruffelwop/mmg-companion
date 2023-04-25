import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mmg_companion/constants/app_constant.dart';
import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_conditional_switch_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_section_header_widget.dart';

class PushNotificationsSettings extends StatefulWidget {
  const PushNotificationsSettings({super.key});

  @override
  State<PushNotificationsSettings> createState() =>
      _PushNotificationsSettingsState();
}

class _PushNotificationsSettingsState extends State<PushNotificationsSettings> {
  String? startPage;

  bool isLoading = false;

  @override
  void initState() {
    startPage = LocalStorage.getStartPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        const CustomSectionHeader(name: "push notifications"),

        // Turn Push Notifications Off
        CustomConditionalSwitch(
          condition: true,
          initialValue:
              startPage == siteIndexMappedToSiteString[0] ? true : false,
          name: siteIndexMappedToSiteString[0]!,
          margin: true,
          experimental: false,
          onChanged: (changedValue) async {
            if (changedValue == true) {
              if (mounted) {
                setState(() {
                  isLoading = true;
                });
              }
              if (mounted) {
                setState(() {
                  startPage = siteIndexMappedToSiteString[0];
                });
              }
              await LocalStorage.setStartPage(siteIndexMappedToSiteString[0]!);
              await fillIndividualLocalStorage();
              await Future.delayed(const Duration(seconds: 1));
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          },
        ),

        // Plan Switch
        CustomConditionalSwitch(
          condition: true,
          initialValue:
              startPage == siteIndexMappedToSiteString[1] ? true : false,
          name: siteIndexMappedToSiteString[1]!,
          margin: true,
          experimental: false,
          onChanged: (changedValue) async {
            if (changedValue == true) {
              if (mounted) {
                setState(() {
                  isLoading = true;
                });
              }
              if (mounted) {
                setState(() {
                  startPage = siteIndexMappedToSiteString[1];
                });
              }
              await LocalStorage.setStartPage(siteIndexMappedToSiteString[1]!);
              await fillIndividualLocalStorage();
              await Future.delayed(const Duration(seconds: 1));
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          },
        ),

        // Settings Switch
        CustomConditionalSwitch(
          condition: true,
          initialValue:
              startPage == siteIndexMappedToSiteString[2] ? true : false,
          name: siteIndexMappedToSiteString[2]!,
          margin: false,
          experimental: false,
          onChanged: (changedValue) async {
            if (changedValue == true) {
              if (mounted) {
                setState(() {
                  isLoading = true;
                });
              }
              if (mounted) {
                setState(() {
                  startPage = siteIndexMappedToSiteString[2];
                });
              }
              await LocalStorage.setStartPage(siteIndexMappedToSiteString[2]!);
              await fillIndividualLocalStorage();
              await Future.delayed(const Duration(seconds: 1));
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          },
        ),
      ],
    );
  }
}
