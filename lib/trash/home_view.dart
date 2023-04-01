// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:mmg_companion/services/local_storage_service.dart';
// import 'package:mmg_companion/services/vertretungsplan_service.dart';
// import 'package:mmg_companion/utilities/widgets/custom_appbar_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_page_scaffold_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_progress_indicator_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';
// import 'package:mmg_companion/utilities/widgets/custom_vertretungsplan_column_widget.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   bool _connectionState = true;

//   @override
//   void initState() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor: Color(0xff1b1b1b),
//     ));
//     if (LocalStorage.getIsRegistered() == null) {
//       LocalStorage.setIsRegistered(true);
//     }
//     _getConnectionState();
//     Timer.periodic(const Duration(seconds: 10), (timer) {
//       _getConnectionState();
//     });
//     super.initState();
//   }

//   Future<void> _getConnectionState() async {
//     bool connectionStatus = await getConnectionState();
//     setState(() {
//       _connectionState = connectionStatus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPageScaffold(
//       child: _connectionState
//           ? Column(
//               children: const [
//                 // maybe a RefreshIndicator() here,
//                 // weekday + xx.xx (appbar)
//                 CustomAppBar(),

//                 // Margin (bottom) of 40px to seperate the appbar from "today"
//                 CustomMargin(amount: 40),

//                 // The SizedBox() throws an assertion, but is providing a vertical
//                 // constraint of 296px + 10px. Exactly what I was looking for.
//                 // SizedBox(

//                 Expanded(
//                   child: CustomVertretungsplanColumn(isToday: true),
//                 ),

//                 // Margin (bottom) of 40px to seperate "today" and "tomorrow"
//                 CustomMargin(amount: 40),

//                 Expanded(
//                   child: CustomVertretungsplanColumn(isToday: false),
//                 ),

//                 // Margin (bottom) of 40px to not have any weird artifacts in the ListTiles
//                 // however: The fact that the two lists are scrollable isn't as obvious for the user
//                 CustomMargin(amount: 40 - 16),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: CustomSmallText(content: "swipe left for settings"),
//                 ),
//               ],
//             )
//           : const CustomProgressIndicator(),
//     );
//   }
// }
