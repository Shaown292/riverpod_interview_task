import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = StateProvider<int>((ref) => 0);
final selectedBottomIndexProvider = StateProvider<int>((ref) => 0);

