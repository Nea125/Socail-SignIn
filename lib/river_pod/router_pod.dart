import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:social_sigin/const/app_name.dart';
import 'package:social_sigin/const/app_path.dart';
import 'package:social_sigin/home_screen.dart';
import 'package:social_sigin/login_screen.dart';
import 'package:social_sigin/utils/order_detail.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> sectionNavigatorKey =
    GlobalKey(debugLabel: 'navbar');
final appRouterProvider = Provider((ref) {
  return GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: AppPath.HOME,
          name: AppName.HOME,
          pageBuilder: (context, state) {
            return const MaterialPage(child: HomeScreen());
          },
        ),
        GoRoute(
          path: AppPath.ORDER_DETAIL,
          name: AppName.ORDER_DETAIL,
          pageBuilder: (context, state) {
            final orderId = state.pathParameters["order_id"];
            final ticketType = state.pathParameters["ticket_type"];
            final ticket = state.pathParameters['ticket'];
            return MaterialPage(
                child: OrderDetailScreen(
              orderId: orderId,
              ticketType: ticketType,
              ticket: ticket,
            ));
          },
        ),
        GoRoute(
          path: AppPath.LOGIN,
          name: AppName.LOGIN,
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginScreen());
          },
        )
      ]);
});
