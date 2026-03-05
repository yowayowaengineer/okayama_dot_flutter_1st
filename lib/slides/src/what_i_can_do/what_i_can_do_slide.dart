import 'dart:html' as html if (dart.library.html) 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatICanDoSlide extends FlutterDeckSlideWidget {
  const WhatICanDoSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/what-i-can-do',
            title: '自分ができること',
            header: FlutterDeckHeaderConfiguration(title: '💪 自分ができること'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _WhatICanDoSlideContent(),
    );
  }
}

class _WhatICanDoSlideContent extends StatefulWidget {
  const _WhatICanDoSlideContent();

  @override
  State<_WhatICanDoSlideContent> createState() =>
      _WhatICanDoSlideContentState();
}

class _WhatICanDoSlideContentState extends State<_WhatICanDoSlideContent> {
  bool _showPunchline = false;
  bool _textCompleted = false;

  static const _qiitaUrl =
      'https://qiita.com/yowayowaengineer/items/0a25ee643119d4984d28';

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
                  '技術は……そこまででもない\nじゃあ、できるのは――',
                  textStyle: textStyle,
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              isRepeatingAnimation: false,
              totalRepeatCount: 1,
              onFinished: () {
                // 間を置いてから「イベントを盛り上げること！」を強調表示
                Future.delayed(const Duration(milliseconds: 600), () {
                  if (mounted) {
                    setState(() => _showPunchline = true);
                    // その後に画像を表示
                    Future.delayed(const Duration(milliseconds: 500), () {
                      if (mounted) setState(() => _textCompleted = true);
                    });
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          AnimatedOpacity(
            opacity: _showPunchline ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Text(
              'イベントを盛り上げること！',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ) ?? const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
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
                        'assets/images/Flutterアプリコンテストを実施してみて.png',
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
