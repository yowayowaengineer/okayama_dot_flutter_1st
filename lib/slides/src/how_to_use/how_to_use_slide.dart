import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class HowToUseSlide extends FlutterDeckSlideWidget {
  const HowToUseSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/how-to-use',
            title: '岡山.Flutterの使い方',
            header: FlutterDeckHeaderConfiguration(title: '📢 岡山.Flutterの使い方'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _HowToUseSlideContent(),
    );
  }
}

class _HowToUseSlideContent extends StatelessWidget {
  const _HowToUseSlideContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 48.0),
      child: Center(
        child: Text(
          '（ここに内容を追加）',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
