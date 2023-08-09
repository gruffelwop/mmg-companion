import 'dart:io';

import 'package:flutter/material.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/constants/routes.dart';
import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/auth_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/dialogs/info_dialog.dart';
import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_scaffold_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool inputIsNotValid = false;

  String planUsername = "";
  String planPassword = "";
  bool isPasswordVisible = false;

  bool encounteredHttpException = false;
  bool encounteredSocketException = false;
  bool encounteredFormatException = false;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _applyDefaultSettings();
  }

  Future<void> _applyDefaultSettings() async {
    if (LocalStorage.getIsRegistered() != true) {
      await applyDefaultSettings();
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return KeyboardDismisser(
  //     gestures: const [
  //       GestureType.onTap,
  //     ],
  //     child: CustomPageScaffold(
  //       child: isLoading == false
  //           ? Stack(
  //               children: [
  //                 Align(
  //                   alignment: Alignment.topRight,
  //                   // child: CustomBodyText(content: "mmg companion"),
  //                   // child: CustomBodyText(content: "by gruffelwop"),
  //                   child: GestureDetector(
  //                     child: const CustomBodyText(content: "info"),
  //                     onTap: () {
  //                       showInfoDialog(
  //                         context,
  //                         "username for the student's plan."
  //                         "\n"
  //                         "&"
  //                         "\n"
  //                         "password for the student's plan",
  //                       );
  //                     },
  //                   ),
  //                 ),
  //                 Form(
  //                   key: formKey,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const CustomHeaderText(content: "mmg companion"),
  //                       const CustomMargin(amount: 40),
  //                       TextFormField(
  //                         // initialValue: "",
  //                         style: customBodyTextStyle,
  //                         validator: (value) {
  //                           if (value!.isEmpty) {
  //                             return "enter a username.";
  //                           } else if (encounteredHttpException) {
  //                             return "username or password is incorrect.";
  //                           } else if (encounteredSocketException) {
  //                             return "no internet connection.";
  //                           } else if (encounteredFormatException) {
  //                             return "encountered FormatException.";
  //                           } else {
  //                             return null;
  //                           }
  //                         },
  //                         decoration: InputDecoration(
  //                           labelText: "username",
  //                           labelStyle: customBodyTextStyle,
  //                           hintText: "username",
  //                           hintStyle: customBodyTextStyle,
  //                           contentPadding: const EdgeInsets.symmetric(
  //                             horizontal: 20,
  //                             vertical: 22,
  //                           ),
  //                           errorBorder: const OutlineInputBorder(
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: Colors.red),
  //                           ),
  //                           focusedErrorBorder: const OutlineInputBorder(
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: Colors.red),
  //                           ),
  //                           enabledBorder: OutlineInputBorder(
  //                             borderRadius:
  //                                 const BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: primaryColor),
  //                           ),
  //                           focusedBorder: OutlineInputBorder(
  //                             borderRadius:
  //                                 const BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: primaryColor),
  //                           ),
  //                         ),
  //                         keyboardType: TextInputType.name,
  //                         textInputAction: TextInputAction.next,
  //                         onChanged: (changedValue) {
  //                           planUsername = changedValue;
  //                         },
  //                       ),
  //                       const CustomMargin(amount: 15),
  //                       TextFormField(
  //                         obscureText: !isPasswordVisible,
  //                         // initialValue: "",
  //                         style: customBodyTextStyle,
  //                         validator: (value) {
  //                           if (value!.isEmpty) {
  //                             return "enter a password.";
  //                           } else if (encounteredHttpException) {
  //                             return "username or password is incorrect.";
  //                           } else if (encounteredSocketException) {
  //                             return "no internet connection.";
  //                           } else if (encounteredFormatException) {
  //                             return "encountered FormatException.";
  //                           } else {
  //                             return null;
  //                           }
  //                         },
  //                         decoration: InputDecoration(
  //                           labelText: "password",
  //                           // errorText: ,
  //                           // errorStyle: ,
  //                           labelStyle: customBodyTextStyle,
  //                           hintText: "password",
  //                           hintStyle: customBodyTextStyle,
  //                           suffixIcon: IconButton(
  //                             color: primaryColor,
  //                             splashColor: Colors.transparent,
  //                             highlightColor: Colors.transparent,
  //                             icon: isPasswordVisible
  //                                 ? const Icon(Icons.visibility_off)
  //                                 : const Icon(Icons.visibility),
  //                             onPressed: () {
  //                               if (mounted) {
  //                                 setState(() {
  //                                   isPasswordVisible = !isPasswordVisible;
  //                                 });
  //                               }
  //                             },
  //                           ),
  //                           contentPadding: const EdgeInsets.symmetric(
  //                             horizontal: 20,
  //                             vertical: 22,
  //                           ),
  //                           errorBorder: const OutlineInputBorder(
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: Colors.red),
  //                           ),
  //                           focusedErrorBorder: const OutlineInputBorder(
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: Colors.red),
  //                           ),
  //                           enabledBorder: OutlineInputBorder(
  //                             borderRadius:
  //                                 const BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: primaryColor),
  //                           ),
  //                           focusedBorder: OutlineInputBorder(
  //                             borderRadius:
  //                                 const BorderRadius.all(Radius.circular(10)),
  //                             borderSide: BorderSide(color: primaryColor),
  //                           ),
  //                         ),
  //                         keyboardType: TextInputType.visiblePassword,
  //                         textInputAction: TextInputAction.done,
  //                         onChanged: (changedValue) {
  //                           if (mounted) {
  //                             setState(() {
  //                               planPassword = changedValue;
  //                             });
  //                           }
  //                         },
  //                       ),
  //                       const CustomMargin(amount: 40),
  //                       GestureDetector(
  //                         onTap: () async {
  //                           if (planUsername.isNotEmpty &&
  //                               planPassword.isNotEmpty) {
  //                             try {
  //                               await checkUsernameAndPassword(
  //                                   username: planUsername,
  //                                   password: planPassword);
  //                               encounteredHttpException = false;
  //                               encounteredSocketException = false;
  //                               encounteredFormatException = false;
  //                               await LocalStorage.setPlanUsername(
  //                                   planUsername);
  //                               await LocalStorage.setPlanPassword(
  //                                   planPassword);
  //                             } on SocketException catch (_) {
  //                               if (mounted) {
  //                                 setState(() {
  //                                   encounteredSocketException = true;
  //                                 });
  //                               }
  //                             } on HttpException catch (_) {
  //                               if (mounted) {
  //                                 setState(() {
  //                                   encounteredHttpException = true;
  //                                 });
  //                               }
  //                             } on FormatException catch (_) {
  //                               if (mounted) {
  //                                 setState(() {
  //                                   encounteredFormatException = true;
  //                                 });
  //                               }
  //                             }
  //                           }
  //                           if (mounted) {
  //                             FocusScope.of(context).unfocus();
  //                           }
  //                           final isValid = formKey.currentState!.validate();
  //                           if (isValid) {
  //                             if (mounted) {
  //                               setState(() {
  //                                 isLoading = true;
  //                               });
  //                             }
  //                             await LocalStorage.setIsRegistered(true);
  //                             await fillLocalStorage();
  //                             await Future.delayed(const Duration(seconds: 1));
  //                             if (mounted) {
  //                               Navigator.of(context).pushNamed(homeRoute);
  //                             }
  //                             // if (mounted) {
  //                             //   setState(() {
  //                             //     isLoading = false;
  //                             //   });
  //                             // }
  //                           }
  //                         },
  //                         child: Container(
  //                           height: 60,
  //                           width: double.infinity,
  //                           decoration: BoxDecoration(
  //                             borderRadius:
  //                                 const BorderRadius.all(Radius.circular(10)),
  //                             color: primaryColor,
  //                           ),
  //                           child: Center(
  //                             child: CustomColoredBodyText(
  //                               content: "login",
  //                               color: backgroundColor,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             )
  //           : const Center(child: CircularProgressIndicator()),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
      ],
      child: CustomScaffold(
        child: isLoading == false
            ? Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      child: const CustomBodyText(content: "info"),
                      onPressed: () {
                        showInfoDialog(
                          context,
                          "username for the student's plan."
                          "\n"
                          "&"
                          "\n"
                          "password for the student's plan",
                        );
                      },
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomHeaderText(content: "mmg companion"),
                        const CustomMargin(amount: 40),

                        // Username

                        // CustomTextTextFormField(
                        //   initialValue: "",
                        //   labelText: "username",
                        //   hintText: "username",
                        //   onChanged: (changedValue) {
                        //     setState(() {
                        //       planUsername = changedValue;
                        //     });
                        //   },
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return "enter a username.";
                        //     } else if (encounteredHttpException) {
                        //       return "username or password is incorrect.";
                        //     } else if (encounteredSocketException) {
                        //       return "no internet connection.";
                        //     } else if (encounteredFormatException) {
                        //       return "encountered FormatException.";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   textInputType: TextInputType.name,
                        //   textInputAction: TextInputAction.next,
                        // ),
                        TextFormField(
                          // initialValue: "",
                          style: customBodyTextStyle,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter a username.";
                            } else if (encounteredHttpException) {
                              return "username or password is incorrect.";
                            } else if (encounteredSocketException) {
                              return "no internet connection.";
                            } else if (encounteredFormatException) {
                              return "encountered FormatException.";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "username",
                            labelStyle: customBodyTextStyle,
                            hintText: "username",
                            hintStyle: customBodyTextStyle,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 22,
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (changedValue) {
                            planUsername = changedValue;
                          },
                        ),
                        const CustomMargin(amount: 15),

                        // CustomConditionalTextFormField(
                        //   condition: true,
                        //   initialValue: "",
                        //   labelText: "username",
                        //   hintText: "username",
                        //   textInputType: TextInputType.text,
                        //   textInputAction: TextInputAction.done,
                        //   isInputNotValid: inputIsNotValid,
                        //   onChanged: (changedValue) {},
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return "enter a username.";
                        //     } else if (encounteredHttpException) {
                        //       return "username or password is incorrect.";
                        //     } else if (encounteredSocketException) {
                        //       return "no internet connection.";
                        //     } else if (encounteredFormatException) {
                        //       return "encountered FormatException.";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // const CustomMargin(amount: 15),

                        // Password

                        // CustomPasswordTextFormField(
                        //   initialValue: "",
                        //   onChanged: (changedValue) {
                        //     setState(() {
                        //       planUsername = changedValue;
                        //     });
                        //   },
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return "enter a username.";
                        //     } else if (encounteredHttpException) {
                        //       return "username or password is incorrect.";
                        //     } else if (encounteredSocketException) {
                        //       return "no internet connection.";
                        //     } else if (encounteredFormatException) {
                        //       return "encountered FormatException.";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   textInputAction: TextInputAction.done,
                        //   isPasswordVisible: isPasswordVisible,
                        //   iconButtonOnPressed: () {
                        //     if (mounted) {
                        //       setState(() {
                        //         isPasswordVisible = !isPasswordVisible;
                        //       });
                        //     }
                        //   },
                        // ),
                        TextFormField(
                          obscureText: !isPasswordVisible,
                          // initialValue: "",
                          style: customBodyTextStyle,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter a password.";
                            } else if (encounteredHttpException) {
                              return "username or password is incorrect.";
                            } else if (encounteredSocketException) {
                              return "no internet connection.";
                            } else if (encounteredFormatException) {
                              return "encountered FormatException.";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "password",
                            // errorText: ,
                            // errorStyle: ,
                            labelStyle: customBodyTextStyle,
                            hintText: "password",
                            hintStyle: customBodyTextStyle,
                            suffixIcon: IconButton(
                              color: primaryColor,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                }
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 22,
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          onChanged: (changedValue) {
                            if (mounted) {
                              setState(() {
                                planPassword = changedValue;
                              });
                            }
                          },
                        ),
                        const CustomMargin(amount: 40),
                        // GestureDetector(
                        //   onTap: () async {
                        //     if (planUsername.isNotEmpty &&
                        //         planPassword.isNotEmpty) {
                        //       try {
                        //         await checkUsernameAndPassword(
                        //             username: planUsername,
                        //             password: planPassword);
                        //         encounteredHttpException = false;
                        //         encounteredSocketException = false;
                        //         encounteredFormatException = false;
                        //         await LocalStorage.setPlanUsername(
                        //             planUsername);
                        //         await LocalStorage.setPlanPassword(
                        //             planPassword);
                        //       } on SocketException catch (_) {
                        //         if (mounted) {
                        //           setState(() {
                        //             encounteredSocketException = true;
                        //           });
                        //         }
                        //       } on HttpException catch (_) {
                        //         if (mounted) {
                        //           setState(() {
                        //             encounteredHttpException = true;
                        //           });
                        //         }
                        //       } on FormatException catch (_) {
                        //         if (mounted) {
                        //           setState(() {
                        //             encounteredFormatException = true;
                        //           });
                        //         }
                        //       }
                        //     }
                        //     if (mounted) {
                        //       FocusScope.of(context).unfocus();
                        //     }
                        //     final isValid = formKey.currentState!.validate();
                        //     if (isValid) {
                        //       if (mounted) {
                        //         setState(() {
                        //           isLoading = true;
                        //         });
                        //       }
                        //       await LocalStorage.setIsRegistered(true);
                        //       await fillLocalStorage();
                        //       await Future.delayed(const Duration(seconds: 1));
                        //       if (mounted) {
                        //         Navigator.of(context).pushNamed(homeRoute);
                        //       }
                        //     }
                        //   },
                        //   child: Container(
                        //     height: 60,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       borderRadius:
                        //           const BorderRadius.all(Radius.circular(10)),
                        //       color: primaryColor,
                        //     ),
                        //     child: Center(
                        //       child: CustomColoredBodyText(
                        //         content: "login",
                        //         color: backgroundColor,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const CustomMargin(amount: 10),
                        TextButton(
                          onPressed: () async {
                            if (planUsername.isNotEmpty &&
                                planPassword.isNotEmpty) {
                              try {
                                await checkUsernameAndPassword(
                                    username: planUsername,
                                    password: planPassword);
                                encounteredHttpException = false;
                                encounteredSocketException = false;
                                encounteredFormatException = false;
                                await LocalStorage.setPlanUsername(
                                    planUsername);
                                await LocalStorage.setPlanPassword(
                                    planPassword);
                              } on SocketException catch (_) {
                                if (mounted) {
                                  setState(() {
                                    encounteredSocketException = true;
                                  });
                                }
                              } on HttpException catch (_) {
                                if (mounted) {
                                  setState(() {
                                    encounteredHttpException = true;
                                  });
                                }
                              } on FormatException catch (_) {
                                if (mounted) {
                                  setState(() {
                                    encounteredFormatException = true;
                                  });
                                }
                              }
                            }
                            if (mounted) {
                              FocusScope.of(context).unfocus();
                            }
                            final isValid = formKey.currentState!.validate();
                            if (!isValid) {
                              setState(() {
                                inputIsNotValid = true;
                              });
                            }
                            if (isValid) {
                              if (mounted) {
                                setState(() {
                                  isLoading = true;
                                });
                              }
                              await LocalStorage.setIsRegistered(true);
                              await fillLocalStorage();
                              await Future.delayed(const Duration(seconds: 1));
                              if (mounted) {
                                Navigator.of(context).pushNamed(homeRoute);
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            elevation: 0,
                            backgroundColor: primaryColor,
                            maximumSize: const Size.fromHeight(60),
                            minimumSize: const Size.fromHeight(60),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Center(
                            child: CustomColoredBodyText(
                              content: "login",
                              color: backgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
