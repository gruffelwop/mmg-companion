// return KeyboardDismisser(
//   gestures: const [
//     GestureType.onTap,
//   ],
//   child: CustomPageScaffold(
//     child: Stack(
//       children: [
//         Align(
//           alignment: Alignment.topRight,
//           child: GestureDetector(
//             child: const CustomBodyText(content: "info"),
//             onTap: () {
//               showInfoDialog(
//                 context,
//                 "username for the student's plan."
//                 "\n"
//                 "&"
//                 "\n"
//                 "password for the student's plan",
//               );
//             },
//           ),
//         ),
//         const Align(
//           alignment: Alignment.topLeft,
//           child: CustomBodyText(content: "mmg companion"),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // const CustomHeaderText(content: "mmg companion"),
//             // const CustomHeaderText(content: "welcome!"),
//             const CustomMargin(amount: 80),
//             SizedBox(
//               height: 60,
//               width: double.infinity,
//               child: TextFormField(
//                 // initialValue: "",
//                 style: customBodyTextStyle,
//                 decoration: InputDecoration(
//                   labelText: "username",
//                   labelStyle: customBodyTextStyle,
//                   hintText: "username",
//                   hintStyle: customBodyTextStyle,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 22,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                     borderSide: BorderSide(color: primaryColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                     borderSide: BorderSide(color: primaryColor),
//                   ),
//                 ),
//                 keyboardType: TextInputType.name,
//                 textInputAction: TextInputAction.next,
//                 onChanged: (changedValue) async {},
//               ),
//             ),
//             const CustomMargin(amount: 15),
//             SizedBox(
//               height: 60,
//               width: double.infinity,
//               child: TextFormField(
//                 obscureText: !isPasswordVisible,
//                 // initialValue: "",
//                 style: customBodyTextStyle,
//                 decoration: InputDecoration(
//                   labelText: "password",
//                   // errorText: ,
//                   // errorStyle: ,
//                   labelStyle: customBodyTextStyle,
//                   hintText: "password",
//                   hintStyle: customBodyTextStyle,
//                   suffixIcon: IconButton(
//                     color: primaryColor,
//                     splashColor: Colors.transparent,
//                     highlightColor: Colors.transparent,
//                     icon: isPasswordVisible
//                         ? const Icon(Icons.visibility_off)
//                         : const Icon(Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         isPasswordVisible = !isPasswordVisible;
//                       });
//                     },
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 22,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                     borderSide: BorderSide(color: primaryColor),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                     borderSide: BorderSide(color: primaryColor),
//                   ),
//                 ),
//                 keyboardType: TextInputType.name,
//                 textInputAction: TextInputAction.done,
//                 onChanged: (changedValue) async {},
//               ),
//             ),
//             const CustomMargin(amount: 40),
//             Container(
//               height: 60,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 color: primaryColor,
//               ),
//               child: Center(
//                   child: CustomColoredBodyText(
//                 content: "login",
//                 color: backgroundColor,
//               )),
//             ),
//           ],
//         ),
//         const Align(
//           alignment: Alignment.bottomCenter,
//           child: CustomSmallText(content: "made by gruffelwop"),
//         ),
//       ],
//     ),
//   ),
// );