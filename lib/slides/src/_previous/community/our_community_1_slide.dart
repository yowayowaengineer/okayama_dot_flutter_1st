import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class OurCommunity1Slide extends FlutterDeckSlideWidget {
  const OurCommunity1Slide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/our-community-1',
          title: '今回紹介したいこと',
          header: FlutterDeckHeaderConfiguration(title: '今回紹介したいこと'),
        ),
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
