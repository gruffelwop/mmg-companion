// import 'package:flutter/material.dart';

// import 'package:mmg_companion/constants/colors.dart';

// class CustomScaffoldWithBottomAppBar extends StatelessWidget {
//   final Widget bottomNavBar;
//   final Widget child;
//   const CustomScaffoldWithBottomAppBar({
//     super.key,
//     required this.child,
//     required this.bottomNavBar,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: backgroundColor,
//       // backgroundColor: Colors.amber,
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               // padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
//               // padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
//               padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: child,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Container(
//           //   height: 60,
//           //   width: double.infinity,
//           //   decoration: const BoxDecoration(
//           //     color: Color(0xff343434), // Isn't actually quite the right color.
//           //     borderRadius: BorderRadius.vertical(
//           //       top: Radius.circular(10 * 2),
//           //     ),
//           //   ),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //     crossAxisAlignment: CrossAxisAlignment.center,
//           //     children: [
//           //       IconButton(
//           //         onPressed: () {
//           //           pageController.jumpToPage(0);
//           //         },
//           //         icon: Icon(
//           //           Icons.add_chart_rounded,
//           //           color:
//           //               // pageController.page == 0 ? Colors.amber : primaryColor,
//           //               primaryColor,
//           //           size: 32,
//           //         ),
//           //       ),
//           //       IconButton(
//           //         onPressed: () {
//           //           pageController.jumpToPage(1);
//           //         },
//           //         icon: Icon(
//           //           Icons.wysiwyg_rounded,
//           //           color:
//           //               // pageController.page == 1 ? Colors.amber : primaryColor,
//           //               primaryColor,
//           //           size: 32,
//           //         ),
//           //       ),
//           //       // Icon(
//           //       //   Icons.graphic_eq,
//           //       //   color: primaryColor,
//           //       //   size: 32,
//           //       // ),
//           //       IconButton(
//           //         onPressed: () {
//           //           pageController.jumpToPage(2);
//           //         },
//           //         icon: Icon(
//           //           Icons.settings_suggest_rounded,
//           //           color:
//           //               // pageController.page == 2 ? Colors.amber : primaryColor,
//           //               primaryColor,
//           //           size: 32,
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           bottomNavBar,
//         ],
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     resizeToAvoidBottomInset: false,
//   //     backgroundColor: backgroundColor,
//   //     body: Padding(
//   //       padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
//   //       // padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
//   //       // padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
//   //       child: child,
//   //     ),
//   //     bottomNavigationBar: BottomAppBar(
//   //       color: const Color(0xff343434),
//   //       shape: const CircularNotchedRectangle(),
//   //       child: Row(
//   //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //         crossAxisAlignment: CrossAxisAlignment.center,
//   //         children: [
//   //           Icon(
//   //             Icons.wysiwyg_rounded,
//   //             color: primaryColor,
//   //             size: 32,
//   //           ),
//   //           Icon(
//   //             Icons.settings_rounded,
//   //             color: primaryColor,
//   //             size: 32,
//   //           ),
//   //           Icon(
//   //             Icons.graphic_eq,
//   //             color: primaryColor,
//   //             size: 32,
//   //           ),
//   //           IconButton(
//   //             onPressed: () {},
//   //             icon: Icon(
//   //               Icons.settings_suggest_rounded,
//   //               color: primaryColor,
//   //               size: 32,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }

// class CustomScaffoldWithBottomAppBar2 extends StatelessWidget {
//   final Widget bottomNavBar;
//   final Widget child;
//   const CustomScaffoldWithBottomAppBar2({
//     super.key,
//     required this.child,
//     required this.bottomNavBar,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: backgroundColor,
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
//         child: child,
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(10 * 2),
//         ),
//         child: BottomNavigationBar(
//           backgroundColor:
//               const Color(0xff343434), // Isn't actually quite the right color.
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.add_chart_rounded,
//                 color: Colors.amber,
//                 size: 32,
//               ),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.add_chart_rounded,
//                 color: Colors.amber,
//                 size: 32,
//               ),
//               label: "",
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     resizeToAvoidBottomInset: false,
//   //     backgroundColor: backgroundColor,
//   //     body: Padding(
//   //       padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
//   //       // padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
//   //       // padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
//   //       child: child,
//   //     ),
//   //     bottomNavigationBar: BottomAppBar(
//   //       color: const Color(0xff343434),
//   //       shape: const CircularNotchedRectangle(),
//   //       child: Row(
//   //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //         crossAxisAlignment: CrossAxisAlignment.center,
//   //         children: [
//   //           Icon(
//   //             Icons.wysiwyg_rounded,
//   //             color: primaryColor,
//   //             size: 32,
//   //           ),
//   //           Icon(
//   //             Icons.settings_rounded,
//   //             color: primaryColor,
//   //             size: 32,
//   //           ),
//   //           Icon(
//   //             Icons.graphic_eq,
//   //             color: primaryColor,
//   //             size: 32,
//   //           ),
//   //           IconButton(
//   //             onPressed: () {},
//   //             icon: Icon(
//   //               Icons.settings_suggest_rounded,
//   //               color: primaryColor,
//   //               size: 32,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
