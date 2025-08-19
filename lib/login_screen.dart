import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          const Text("Login With Social Media"),
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  print("google signIn :: ");
                 bool isLogin = await authService.signInWithGoogle();
                 print("isLogin :: $isLogin");
                   if(isLogin){
                    
                    AppUtil.showLoginSuccess(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                  }else{
                     AppUtil.showLoginFail(context);
                  }
                },
                child: SizedBox(
                  width: 60,
                  child:
                      Image.asset('assets/images/google.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () async {
                  print("facebook signIn :: ");
                  bool isLogin= await authService.signInWithFacebook();
                  if(isLogin){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
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
