import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_planetary/helpers/color_helper.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;
  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        LiquidSwipe(
          liquidController: controller,
          enableSideReveal: true,
          onPageChangeCallback: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          slideIconWidget: const Icon(
            Icons.arrow_back_ios_new,
            size: 10,
            color: Colors.white,
          ),
          pages: const [
            _mars(
              key: Key('mars'),
            ),
            _earth(
              key: Key('earth'),
            ),
            _venus(
              key: Key('venus'),
            )
          ],
        ),
        Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(page: 2);
                      },
                      child: Text(
                        controller.currentPage == 3 ? '' : 'Skip',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'CerebriSansPro-Regular',
                            fontSize: 8,
                            fontWeight: FontWeight.normal),
                      )),

                  //for the indicator
                  AnimatedSmoothIndicator(
                    activeIndex: controller.currentPage,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 10,
                      dotColor: Colors.black,
                      activeDotColor: Colors.white12,
                    ),
                    onDotClicked: (index) {
                      controller.animateToPage(page: index);
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        final page = controller.currentPage + 1;
                        controller.animateToPage(
                            page: page > 3 ? 0 : page, duration: 400);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CerebriSansPro-Regular',
                            fontSize: 8,
                            fontWeight: FontWeight.normal),
                      ))
                ],
              ),
            ))
      ],
    ));
  }
}

class _mars extends StatelessWidget {
  const _mars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.Tertiary_Color,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimateImageMars(),
            const SizedBox(
              height: 64,
            ),
            const Text('Mars',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 24,
            ),
            Container(
              // padding: const EdgeInsets.only(right: 32),
              child: const Text(
                  'The Solar System is the gravitationally bound system of the Sun and the objects that orbit it.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'CerebriSansPro-Regular',
                  )),
            )
          ]),
    );
  }
}

class AnimateImageMars extends StatefulWidget {
  AnimateImageMars({Key? key, e}) : super(key: key);

  @override
  State<AnimateImageMars> createState() => _AnimateImageMarsState();
}

class _AnimateImageMarsState extends State<AnimateImageMars>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0.05, 0),
  ).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset('assets/Mars.png'),
    );
  }
}

class _earth extends StatelessWidget {
  const _earth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.Secondary_Color,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimateImageEarth(),
            const SizedBox(
              height: 64,
            ),
            const Text('Mars',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 24,
            ),
            Container(
              // padding: const EdgeInsets.only(right: 32),
              child: const Text(
                  'The Solar System is the gravitationally bound system of the Sun and the objects that orbit it.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'CerebriSansPro-Regular',
                  )),
            )
          ]),
    );
  }
}

class AnimateImageEarth extends StatefulWidget {
  AnimateImageEarth({Key? key, e}) : super(key: key);

  @override
  State<AnimateImageEarth> createState() => _AnimateImageEarthState();
}

class _AnimateImageEarthState extends State<AnimateImageEarth>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0.05, 0),
  ).animate(_controller);

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset('assets/Earth.png'),
    );
  }
}

class _venus extends StatelessWidget {
  const _venus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.Primary_Color,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimateImageVenus(),
            const SizedBox(
              height: 64,
            ),
            const Text('Mars',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'CerebriSansPro-Regular',
                    fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 24,
            ),
            Container(
              // padding: const EdgeInsets.only(right: 32),
              child: const Text(
                  'The Solar System is the gravitationally bound system of the Sun and the objects that orbit it.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'CerebriSansPro-Regular',
                  )),
            )
          ]),
    );
  }
}

class AnimateImageVenus extends StatefulWidget {
  AnimateImageVenus({Key? key, e}) : super(key: key);

  @override
  State<AnimateImageVenus> createState() => _AnimateImageVenusState();
}

class _AnimateImageVenusState extends State<AnimateImageVenus>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0.05, 0),
  ).animate(_controller);

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset('assets/Venus.png'),
    );
  }
}
