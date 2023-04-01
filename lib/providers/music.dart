import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoundNotifierBack extends StateNotifier<AudioPlayer> {
  SoundNotifierBack() : super(AudioPlayer());
  bool _isPlaying = true;
  bool _isPlayingSound = true;

  double volume = 0.5;

  bool get isPlaying => _isPlaying;

  bool get isPlayingSound => _isPlayingSound;
  ReleaseMode mode = ReleaseMode.loop;

  void setMusic() {
    state.play(AssetSource('sound.mp3'));
    state.setReleaseMode(mode);
    state.setVolume(volume);
    _isPlaying = true;
  }

  void setVolume(double value) {
    state.setVolume(value);
    volume = value;
  }

  double get vol => volume;

  void pause() {
    state.pause();
    _isPlaying = false;
  }

}

final soundProviderBack = StateNotifierProvider<SoundNotifierBack, AudioPlayer>((ref) {
  return SoundNotifierBack();


});
