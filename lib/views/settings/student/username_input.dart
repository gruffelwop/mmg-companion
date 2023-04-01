// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mmg_companion/constants/routes.dart';
// import 'package:mmg_companion/services/user_preferences_service.dart';

// class UsernameInputView extends StatefulWidget {
//   const UsernameInputView({super.key});

//   @override
//   State<UsernameInputView> createState() => _UsernameInputViewState();
// }

// class _UsernameInputViewState extends State<UsernameInputView> {
//   String username = "";

//   final String step = "2"; // "2 / 3"
//   final String fieldName = "username";

//   final String previousRoute = isTeacherRoute;
//   final String nextRoute = genderRoute;

//   final double iconSize = 24;

//   @override
//   void initState() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor: Color(0xff1b1b1b),
//     ));
//     username = UserPreferences.getUsername() ?? "";
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff1b1b1b),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Step $step",
//                 style: const TextStyle(
//                   color: Color(0x80ffffff),
//                   fontSize: 16,
//                   height: 1.5,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     await UserPreferences.setUsername(username);
//                     Navigator.of(context).pushNamed(previousRoute);
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     color: const Color(0x80ffffff),
//                     size: iconSize,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     await UserPreferences.setUsername(username);
//                     Navigator.of(context).pushNamed(nextRoute);
//                   },
//                   child: Icon(
//                     Icons.arrow_forward_ios,
//                     color: const Color(0x80ffffff),
//                     size: iconSize,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "$fieldName.",
//                   style: const TextStyle(
//                     color: Color(0xffffffff),
//                     fontSize: 16,
//                     height: 1,
//                   ),
//                 ),
//                 TextFormField(
//                   initialValue: username,
//                   style: const TextStyle(
//                     color: Color(0x80ffffff),
//                     fontSize: 48,
//                     height: 1,
//                   ),
//                   cursorWidth: 0,
//                   keyboardType: TextInputType.name,
//                   keyboardAppearance: Brightness.dark,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                     hintText: fieldName,
//                     hintStyle: const TextStyle(
//                       color: Color(0x80ffffff),
//                       fontSize: 48,
//                       height: 1,
//                     ),
//                   ),
//                   onChanged: (changedUsername) {
//                     setState(() {
//                       username = changedUsername;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
