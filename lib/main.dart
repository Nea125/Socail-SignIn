import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:social_sigin/const/app_name.dart';
import 'package:social_sigin/const/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_sigin/river_pod/router_pod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(AppConstant.oneSignalId);
  OneSignal.Notifications.requestPermission(true);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(appRouterProvider);

    OneSignal.Notifications.addClickListener((event) {
      final data = event.notification.additionalData;
      final orderId = data?['order_id'];
      final ticketType = data?['ticket_type'];
      final ticket = data?['ticket'];
      router.pushNamed(AppName.ORDER_DETAIL, pathParameters: {
        "order_id": orderId ?? "",
        "ticket_type": ticketType ?? "",
        "ticket":ticket
      });
    });
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
