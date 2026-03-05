import 'dart:html' as html if (dart.library.html) 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDevSlide extends FlutterDeckSlideWidget {
  const AppDevSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/app-dev',
            title: 'アプリ開発は良いものだぞ',
            header: FlutterDeckHeaderConfiguration(title: '📱 アプリ開発は良いものだぞ'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _AppDevSlideContent(),
    );
  }
}

class _AppDevSlideContent extends StatefulWidget {
  const _AppDevSlideContent();

  @override
  State<_AppDevSlideContent> createState() => _AppDevSlideContentState();
}

class _AppDevSlideContentState extends State<_AppDevSlideContent> {
  bool _textCompleted = false;

  static const _qiitaUrl =
      'https://qiita.com/azukisiromochi/items/96310b42e8b7df2422f6';

  Future<void> _openUrl() async {
    if (kIsWeb) {
      html.window.open(_qiitaUrl, '_blank');
    } else {
      final url = Uri.parse(_qiitaUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 28,
          height: 1.5,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextStyle(
            style: textStyle ?? const TextStyle(),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  '個人開発をお勧めしたわけですが、その中でも特にアプリ開発をお勧めします。\nその理由は…',
                  textStyle: textStyle,
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              isRepeatingAnimation: false,
              totalRepeatCount: 1,
              onFinished: () {
                Future.delayed(const Duration(milliseconds: 400), () {
                  if (mounted) {
                    setState(() => _textCompleted = true);
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 40),
          AnimatedOpacity(
            opacity: _textCompleted ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: GestureDetector(
              onTap: _openUrl,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/アプリ名焼き鳥事件.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          width: 400,
                          height: 120,
                          child: Container(
                            color: Colors.grey.withOpacity(0.3),
                            child: const Icon(Icons.image, size: 48),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
