import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IcebreakSlide extends FlutterDeckSlideWidget {
  const IcebreakSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(route: '/icebreak'),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.image(
      imageBuilder: (context) => Image.asset(
        'assets/images/icebreak.jpg',
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
