import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:social_sigin/const/app_name.dart';
import 'package:social_sigin/home_screen.dart';
import 'package:social_sigin/river_pod/auth_pod.dart';
import 'package:social_sigin/utils/dialog.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = ref.read(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("LOGIN SCREEN"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login With Social Media".toUpperCase()),
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  print("google signIn :: ");
                  bool isLogin = await authService.signInWithGoogle();
                  print("isLogin :: $isLogin");
                  if (isLogin) {
                    context.pushNamed(AppName.HOME);
                    AppUtil.showLoginSuccess(context);
                  } else {
                    AppUtil.showLoginFail(context);
                  }
                },
                child: SizedBox(
                  width: 60,
                  child: Image.asset('assets/images/google.png',
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () async {
                  print("facebook signIn :: ");
                  bool isLogin = await authService.signInWithFacebook();
                  if (isLogin) {
                    context.pushNamed(AppName.HOME);
                  }
                },
                child: SizedBox(
                  width: 60,
                  child: Image.asset('assets/images/facebook.webp',
                      fit: BoxFit.cover),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
