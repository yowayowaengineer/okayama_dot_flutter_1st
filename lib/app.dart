import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okayama_dot_flutter_1st/l10n/app_localizations.dart';
import 'package:okayama_dot_flutter_1st/slides/slides.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<_AnimatedFooterWidgetState> _footerWidgetKey =
      GlobalKey<_AnimatedFooterWidgetState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) => FlutterDeckApp(
        slides: slides,
        configuration: FlutterDeckConfiguration(
          controls: const FlutterDeckControlsConfiguration(
            presenterToolbarVisible: true,
            gestures: FlutterDeckGesturesConfiguration.mobileOnly(),
            shortcuts: FlutterDeckShortcutsConfiguration(
              enabled: true,
              nextSlide: SingleActivator(LogicalKeyboardKey.arrowRight),
              previousSlide: SingleActivator(LogicalKeyboardKey.arrowLeft),
              toggleMarker: SingleActivator(
                LogicalKeyboardKey.keyM,
                control: true,
                meta: true,
              ),
              toggleNavigationDrawer: SingleActivator(
                LogicalKeyboardKey.period,
                control: true,
                meta: true,
              ),
            ),
          ),
          transition: const FlutterDeckTransition.fade(),
          footer: FlutterDeckFooterConfiguration(
            showSlideNumbers: true,
            widget: _AnimatedFooterWidget(key: _footerWidgetKey),
          ),
        ),
        locale: const Locale('ja'),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
      ),
    );
  }
}

class _AnimatedFooterWidget extends StatefulWidget {
  const _AnimatedFooterWidget({super.key});

  @override
  State<_AnimatedFooterWidget> createState() => _AnimatedFooterWidgetState();
}

class _AnimatedFooterWidgetState extends State<_AnimatedFooterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isMovingRight = false;
  int _imageIndex = 0;
  bool _animationStarted = false;

  /// 停止中（1スライド目）に表示する画像。
  static const _idleImagePath = 'assets/images/player-idle.png';

  final List<String> _imagePaths = [
    'assets/images/player-walk-left.gif',
    'assets/images/player-walk-right.gif',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(minutes: 20),
      vsync: this,
    );
    // アニメーションはルートが /icebreak を離れたタイミングで startAnimation() により開始する

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.addListener(() {
      final previousDirection = _isMovingRight;
      _isMovingRight = _animation.value >= 0.5;

      if (previousDirection != _isMovingRight && mounted) {
        setState(() {
          _imageIndex = (_imageIndex + 1) % _imagePaths.length;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 2スライド目以降では context.flutterDeck.router で判定してアニメーション開始
    if (!_animationStarted && mounted) {
      final slideIndex = context.flutterDeck.router.currentSlideIndex;
      if (slideIndex >= 1) {
        _animationStarted = true;
        _controller.repeat();
        setState(() {}); // 停止中画像→歩行画像の切り替えを即反映
      }
    }
  }

  /// icebreak の次に進んだときに一度だけ呼び、フッターアニメーションを開始する
  void startAnimation() {
    if (_animationStarted || !mounted) return;
    _animationStarted = true;
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = 50.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final footerTop = screenHeight * 0.89;
    const logoWidth = 100.0;
    const logoPosition = logoWidth;
    const rightMargin = 100.0;
    final rightEndPosition = screenWidth - rightMargin;

    return UnconstrainedBox(
      constrainedAxis: Axis.horizontal,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo_512x512.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                double position;
                if (_animationStarted) {
                  if (_animation.value <= 0.5) {
                    final progress = _animation.value * 2.0;
                    position =
                        rightEndPosition -
                        (rightEndPosition - logoPosition + imageSize) *
                            progress;
                  } else {
                    final progress = (_animation.value - 0.5) * 2.0;
                    position =
                        logoPosition -
                        imageSize +
                        (rightEndPosition - logoPosition + imageSize) *
                            progress;
                  }
                } else {
                  // 停止中はアニメーション開始位置（右端）に表示し、動画へ自然に繋がるようにする
                  position = rightEndPosition;
                }

                final imagePath = _animationStarted
                    ? _imagePaths[_imageIndex]
                    : _idleImagePath;

                return Positioned(
                  left: position,
                  top: footerTop - (screenHeight * 0.9),
                  child: Image.asset(
                    imagePath,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        width: imageSize,
                        height: imageSize,
                        child: Container(
                          color: Colors.grey.withOpacity(0.3),
                          child: const Icon(Icons.image, size: 20),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
