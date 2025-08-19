// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_sigin/service/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
