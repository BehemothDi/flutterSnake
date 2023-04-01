import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoundNotifier extends StateNotifier<AudioPlayer> {
  SoundNotifier() : super(AudioPlayer());
  bool _isPlaying = true;

  double volume = 1;

  bool get isPlaying => _isPlaying;

  void setSoundEat() {
    state.play(AssetSource('eat.mp3'));
    state.setVolume(volume);
    _isPlaying = true;
  }

  void setVolume(double value) {
    state.setVolume(value);
    volume = value;
  }

  double get vol => volume;

  void pauseSoundEat() {
    state.pause();
    _isPlaying = false;
  }

  void setSoundDied() {
    state.play(AssetSource('died.mp3'));
    state.setVolume(volume);
    _isPlaying = true;
  }

  void pauseSoundDied() {
    state.pause();
    _isPlaying = false;
  }
}

final soundProvider = StateNotifierProvider<SoundNotifier, AudioPlayer>((ref) {
  return SoundNotifier();
});
