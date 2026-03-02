import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class DoYouKnowFlutterSlide extends FlutterDeckSlideWidget {
  const DoYouKnowFlutterSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/do-you-know-flutter',
            title: 'Flutterを知っていますか？',
            header: FlutterDeckHeaderConfiguration(title: 'Flutterを知っていますか？'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _DoYouKnowFlutterSlideContent(),
    );
  }
}

class _DoYouKnowFlutterSlideContent extends StatefulWidget {
  const _DoYouKnowFlutterSlideContent();

  @override
  State<_DoYouKnowFlutterSlideContent> createState() =>
      _DoYouKnowFlutterSlideContentState();
}

class _DoYouKnowFlutterSlideContentState
    extends State<_DoYouKnowFlutterSlideContent> {
  int _currentIndex = 0; // 表示する画像の数（0, 1, 2, 3）

  void _onTap() {
    if (_currentIndex < 3) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const imageSize = 200.0;
    const padding = 80.0; // 固定の余白

    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          // 1つ目: FlutterLogo（左上）
          if (_currentIndex >= 1)
            Positioned(
              left: padding,
              top: padding,
              child: _buildImageContainer(
                child: FlutterLogo(size: imageSize),
                size: imageSize,
              ),
            ),
          // 2つ目: riverpod.png（中央）
          if (_currentIndex >= 2)
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: _buildImageContainer(
                  child: Image.asset(
                    'assets/images/riverpod.png',
                    fit: BoxFit.contain,
                    width: imageSize,
                    height: imageSize,
                  ),
                  size: imageSize,
                ),
              ),
            ),
          // 3つ目: dart.webp（右下）
          if (_currentIndex >= 3)
            Positioned(
              right: padding,
              bottom: padding,
              child: _buildImageContainer(
                child: Image.asset(
                  'assets/images/dart.webp',
                  fit: BoxFit.contain,
                  width: imageSize,
                  height: imageSize,
                ),
                size: imageSize,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageContainer({
    required Widget child,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
