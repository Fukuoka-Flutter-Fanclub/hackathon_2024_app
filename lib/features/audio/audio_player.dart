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

  Future<void> play() async {
    await _audioPlayer.play(AssetSource("audio/fire.mp3"));
  }

  void pause() {
    _audioPlayer.pause();
  }
}
