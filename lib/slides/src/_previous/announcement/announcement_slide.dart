import 'dart:html' as html if (dart.library.html) 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementSlide extends FlutterDeckSlideWidget {
  const AnnouncementSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/announcement',
          title: '告知',
          header: FlutterDeckHeaderConfiguration(title: '告知！'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _AnnouncementSlideContent(),
    );
  }
}

class _AnnouncementSlideContent extends StatelessWidget {
  const _AnnouncementSlideContent();

  Future<void> _openUrl() async {
    final urlString = 'https://okayama-dot-flutter.connpass.com/event/378340/';
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
                      child: Text(
                        '第1回は3月7日(土)',
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
                        'セッション（ & 懇親会？）',
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
                        '場所は調整中（倉敷の可能性が高い？）',
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
                        'assets/images/connpass.webp',
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
