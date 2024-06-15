import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../theme/themes.dart';

class GetConfettiWidget extends StatelessWidget {
  const GetConfettiWidget({
    Key? key,
    required this.confettiController,
  }) : super(key: key);
  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: confettiController,
      gravity: 0.5,
      numberOfParticles: 10,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: true,
      colors: [Themes.iconColor, Themes.borderColor, Themes.darkGreenColor2],
    );
  }
}
