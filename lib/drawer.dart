
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_sigin/localDB/auth_pref.dart';
import 'package:social_sigin/login_screen.dart';
import 'package:social_sigin/river_pod/auth_pod.dart';
import 'package:social_sigin/utils/dialog.dart';


class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  String? name;
  String? email;
  String? photo;

  @override
  void initState() {
    super.initState();
    _loadUserPrefs();
  }

  Future<void> _loadUserPrefs() async {
    await UserPrefs.init();
    setState(() {
      name = UserPrefs.name;
      email = UserPrefs.email;
      photo = UserPrefs.photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = ref.read(authServiceProvider);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name ?? "Guest"),
            accountEmail: Text(email ?? "admin@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: photo != null
                  ? NetworkImage(photo!)
                  : const AssetImage("assets/images/avatar.webp") as ImageProvider,
            ),
            decoration: const BoxDecoration(color: Colors.grey),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context); // close drawer
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () async {
              final isLogOut = await authService.googleSignOut();
              await UserPrefs.clear();

              if (isLogOut) {
                AppUtil.showLogoutSuccess(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } else {
                AppUtil.showLogoutFail(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
