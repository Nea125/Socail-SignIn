 import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
  import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_sigin/localDB/auth_pref.dart';

class AuthService {




final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

Future<bool> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();

    if (account != null) {
      final GoogleSignInAuthentication auth = await account.authentication;
     

      final String? idToken = auth.idToken;
      final String? accessToken = auth.accessToken;

      print("Google ID Token: $idToken");
      print("Google Access Token: $accessToken");

      print("User Info:");
      print("Name: ${account.displayName}");
      print("Email: ${account.email}");
      print("Photo: ${account.photoUrl}");
      await onSaveUserInfor(account: account,auth: auth);

      
      return true;
    }else{
      print("login with google fail");
      return false;
    }
  } catch (error) {
    print("Google Sign-In Error: $error");
    return false;
  }
}
Future<void> onSaveUserInfor({required  auth, required account}) async{

     await UserPrefs.init();

      // Save values
      await UserPrefs.setIdToken(auth.idToken ?? "");
      await UserPrefs.setAccessToken(auth.accessToken ?? "");
      await UserPrefs.setName(account.displayName ?? "");
      await UserPrefs.setEmail(account.email);
      await UserPrefs.setPhoto(account.photoUrl ?? "");
}
Future<bool> googleSignOut() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  
  try {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();
    
    // Sign out from Google account
    await googleSignIn.signOut();
    
    UserPrefs.clear();
    
    print("User signed out successfully.");
    return true;
  } catch (e) {
    print("Error signing out: $e");
    return false;
  }
}
  

Future<bool> signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      print("Facebook Access Token: ${accessToken.tokenString}");

      // Get user data
      final userData = await FacebookAuth.instance.getUserData(
        fields: "name,email,picture.width(200)",
      );

      final name = userData['name'] ?? '';
      final email = userData['email'] ?? '';
      final photo = userData['picture']?['data']?['url'] ?? '';

      print("User Info:");
      print("Name: $name");
      print("Email: $email");
      print("Photo: $photo");

      // Save in SharedPreferences
      await UserPrefs.setName(name);
      await UserPrefs.setEmail(email);
      await UserPrefs.setPhoto(photo);

      return true;
    } else {
      print("Facebook login failed: ${result.message}");
      return false;
    }
  } catch (error) {
    print("Facebook Sign-In Error: $error");
    return false;
  }
}

}