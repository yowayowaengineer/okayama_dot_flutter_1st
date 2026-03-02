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
    )..repeat();

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

                if (_animation.value <= 0.5) {
                  final progress = _animation.value * 2.0;
                  position =
                      rightEndPosition -
                      (rightEndPosition - logoPosition + imageSize) * progress;
                } else {
                  final progress = (_animation.value - 0.5) * 2.0;
                  position =
                      logoPosition -
                      imageSize +
                      (rightEndPosition - logoPosition + imageSize) * progress;
                }

                return Positioned(
                  left: position,
                  top: footerTop - (screenHeight * 0.9),
                  child: Image.asset(
                    _imagePaths[_imageIndex],
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
