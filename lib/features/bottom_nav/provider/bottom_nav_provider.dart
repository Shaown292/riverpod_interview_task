import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controls the index of the bottom navigation bar
final bottomNavProvider = StateProvider<int>((ref) => 0);