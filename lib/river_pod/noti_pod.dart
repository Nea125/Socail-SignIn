// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_sigin/service/notification_service.dart';

final notificationProvider = Provider<NotificationService>((ref) => NotificationService());
