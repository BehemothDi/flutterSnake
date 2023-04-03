import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoundNotifier extends StateNotifier<AudioPlayer> {
  SoundNotifier() : super(AudioPlayer()..setVolume(0.5));
  bool _isPlaying = true;

  double _volume = 0.5;

  bool get isPlaying => _isPlaying;

  void playSoundEat() {
    if (_isPlaying) {
      state.play(AssetSource('eat.mp3'));
    }
    state.setVolume(_volume);
    state = state;
  }

  void playSoundDied() {
    if (_isPlaying) {
      state.play(AssetSource('died.mp3'));
    }
  }

  void toggle() {
    _isPlaying = !_isPlaying;
    state = state;
  }

  void setVolume(double value) {
    state.setVolume(value);
    _volume = value;
  }

  double get volume => _volume;

  void setSoundDied
      () {}
}

final soundProvider = StateNotifierProvider<SoundNotifier, AudioPlayer>((ref) {
  return SoundNotifier();
});
