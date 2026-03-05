import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:okayama_dot_flutter_1st/theme/app_colors.dart';

class EndingSlide extends FlutterDeckSlideWidget {
  const EndingSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/ending',
          title: '岡山でFlutterを盛り上げようぜ',
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _EndingSlideContent(),
    );
  }
}

class _EndingSlideContent extends StatefulWidget {
  const _EndingSlideContent();

  @override
  State<_EndingSlideContent> createState() => _EndingSlideContentState();
}

class _EndingSlideContentState extends State<_EndingSlideContent>
    with SingleTickerProviderStateMixin {
  bool _firstTextCompleted = false;
  bool _showRevengeLine = false;

  late final AnimationController _impactController;
  late final Animation<double> _impactScale;

  @override
  void initState() {
    super.initState();
    _impactController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _impactScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _impactController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _impactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle1 = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 200,
      fontWeight: FontWeight.bold,
      color: AppColors.blue,
      height: 1.2,
    );
    final textStyle2 = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 120,
      fontWeight: FontWeight.bold,
      color: AppColors.pink,
      height: 1.2,
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1行目（常に表示）
                DefaultTextStyle(
                  style: textStyle1 ?? const TextStyle(),
                  textAlign: TextAlign.center,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        '岡山でFlutterを盛り上げようぜ',
                        textStyle: textStyle1,
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                    onFinished: () {
                      // 1行目が完了したら、少し待ってから2行目を開始
                      Future.delayed(const Duration(milliseconds: 500), () {
                        if (mounted) {
                          setState(() {
                            _firstTextCompleted = true;
                          });
                        }
                      });
                    },
                  ),
                ),
                // 2行目（1行目が完了してから表示）
                if (_firstTextCompleted)
                  DefaultTextStyle(
                    style: textStyle2 ?? const TextStyle(),
                    textAlign: TextAlign.center,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'って話',
                          textStyle: textStyle2,
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      isRepeatingAnimation: false,
                      totalRepeatCount: 1,
                      onFinished: () {
                        Future.delayed(const Duration(milliseconds: 400), () {
                          if (mounted) {
                            setState(() => _showRevengeLine = true);
                            _impactController.forward();
                          }
                        });
                      },
                    ),
                  ),
                // 3行目：R.png（400×400・影なし・でーん！スケールエフェクト）
                if (_showRevengeLine) ...[
                  const SizedBox(height: 128),
                  Center(
                    child: ScaleTransition(
                      scale: _impactScale,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/R.png',
                          width: 600,
                          height: 600,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => SizedBox(
                            width: 600,
                            height: 600,
                            child: Container(
                              color: Colors.grey.withOpacity(0.2),
                              child: Icon(
                                Icons.image_outlined,
                                size: 48,
                                color: Colors.grey.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
