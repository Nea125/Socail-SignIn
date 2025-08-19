  import 'package:flutter/material.dart';
class AppUtil{


// Base function (still reusable)
static void showSnackBar({
  required BuildContext context,
  required String message,
  bool isSuccess = true,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Presets
static void showLoginSuccess(BuildContext context) {
  showSnackBar(
    context: context,
    message: "Login success!",
    isSuccess: true,
  );
}

static void showLoginFail(BuildContext context) {
  showSnackBar(
    context: context,
    message: "Login failed!",
    isSuccess: false,
  );
}

static void showLogoutSuccess(BuildContext context) {
  showSnackBar(
    context: context,
    message: "Logout success!",
    isSuccess: true,
  );
}

static void showLogoutFail(BuildContext context) {
  showSnackBar(
    context: context,
    message: "Logout failed!",
    isSuccess: false,
  );
}



}