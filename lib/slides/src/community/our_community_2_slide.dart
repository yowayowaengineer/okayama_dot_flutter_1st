import 'dart:html' as html if (dart.library.html) 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class OurCommunity2Slide extends FlutterDeckSlideWidget {
  const OurCommunity2Slide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/our-community-2',
          title: 'コミュニティ概要',
          header: FlutterDeckHeaderConfiguration(title: 'コミュニティ概要（開催サイクル）'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _OurCommunity2SlideContent(),
    );
  }
}

class _OurCommunity2SlideContent extends StatelessWidget {
  const _OurCommunity2SlideContent();

  Future<void> _openConnpassUrl() async {
    final urlString = 'https://okayama-dot-flutter.connpass.com/';
    if (kIsWeb) {
      html.window.open(urlString, '_blank');
    } else {
      final url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 48.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 左側: テキスト
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text('毎月開催', style: TextStyle(fontSize: 32)),
                    ),
                  ],
                ),
                const Gap(40),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '3カ月に1回はセッションイベント（懇親会もしたい）',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ],
                ),
                const Gap(40),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'それ以外は、もくもく会やLTをゆるく',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          // 右側: 画像（クリック可能）
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: _openConnpassUrl,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 500,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/logo_word_512x512.webp',
                        fit: BoxFit.contain,
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
