import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  var isPlaying = false.obs;
  late ConfettiController confettiController;

  @override
  void onInit() {
    confettiController = ConfettiController();
    super.onInit();
  }

  @override
  void onReady() {
    startConfettiAnimation();
    super.onReady();
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }

  startConfettiAnimation() {
    if (confettiController.state == ConfettiControllerState.playing) {
      isPlaying.value = false;
      confettiController.stop();
    } else {
      isPlaying.value = true;
      confettiController.play();
    }
  }
}
