import 'dart:html' as html if (dart.library.html) 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterAppContestSlide extends FlutterDeckSlideWidget {
  const FlutterAppContestSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-app-contest',
            title: 'Flutterアプリコンテスト',
            header: FlutterDeckHeaderConfiguration(title: 'Flutterアプリコンテスト'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _FlutterAppContestSlideContent(),
    );
  }
}

class _FlutterAppContestSlideContent extends StatelessWidget {
  const _FlutterAppContestSlideContent();

  Future<void> _openUrl() async {
    final urlString = 'https://qiita.com/yowayowaengineer/items/0a25ee643119d4984d28';
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
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '実施したのは2019年12月～ （Flutter1.0公開の1年後）',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '会社内で参加者をつのり開催',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '翌2020年の新入社員を審査員として採用',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '表彰式は2020年の全体会議（全社員が集まる会議）で実施',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '入賞者には賞金も出した',
                        style: TextStyle(fontSize: 24),
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
                      'assets/images/flutter_contest.webp',
                      fit: BoxFit.contain,
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
