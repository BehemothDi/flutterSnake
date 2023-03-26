import 'package:flutter_riverpod/flutter_riverpod.dart';

class TickerNotifier extends StateNotifier<bool> {
  TickerNotifier() : super(false);

  set isTurnedAlready(bool value) => state = value;
}

final tickerProvider = StateNotifierProvider<TickerNotifier, bool>((ref) {
  return TickerNotifier();
});
