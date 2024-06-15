import 'package:audioplayers/audioplayers.dart';

buttonAudio(String audioName) {
  final player = AudioPlayer();
  player.play(
    AssetSource(audioName),
  );
}
