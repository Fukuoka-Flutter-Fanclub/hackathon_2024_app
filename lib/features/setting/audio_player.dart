import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player.g.dart';

@riverpod
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  late final AudioPlayer _audioPlayer;

  @override
  AudioPlayer build() {
    _audioPlayer = AudioPlayer();
    return _audioPlayer;
  }

  Future<void> playFire() async {
    await _audioPlayer.setSource(AssetSource("audio/fire.mp3"));
    await _audioPlayer.resume();
  }

  Future<void> playRain() async {
    await _audioPlayer.setSource(AssetSource("audio/rain.mp3"));
    await _audioPlayer.resume();
  }

  Future<void> playRipple() async {
    await _audioPlayer.setSource(AssetSource("audio/ripple.mp3"));
    await _audioPlayer.resume();
  }

  Future<void> playStream() async {
    await _audioPlayer.setSource(AssetSource("audio/stream.mp3"));
    await _audioPlayer.resume();
  }

  void pause() {
    _audioPlayer.pause();
  }
}
