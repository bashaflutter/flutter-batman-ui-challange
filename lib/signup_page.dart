import 'package:batman_ui_challange/batmanbtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginpage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController1;
  late Animation<double> _animatiologoin;
  late Animation<double> _animatiologomoveup;
  late Animation<double> _animatiobatmanin;
  late Animation<double> _animatiobtnsin;
  late Animation<double> _animatiobtnlogout;
  late Animation<double> _animatiobatmanup;
  late Animation<double> _animatiobatmancity;

  void firstanimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    super.initState();
    _animatiologoin = Tween(begin: 30.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.25)));
    _animatiologomoveup = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.30, 0.50));
    _animatiobatmanin = Tween(begin: 5.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.65, 0.9, curve: Curves.decelerate)));
    _animatiobtnsin = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.65, 0.9));
    _animationController.forward();
  }

  void secondanimation() {
    _animationController1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    _animatiobtnlogout = CurvedAnimation(
        parent: _animationController1, curve: const Interval(0.0, 0.15));
    _animatiobatmanup = CurvedAnimation(
        parent: _animationController1, curve: const Interval(0.30, 0.50));
    _animatiobatmancity = CurvedAnimation(
        parent: _animationController1, curve: const Interval(0.60, 0.75));
  }

  void signup() {
    _animationController1.forward(from: 0.0);
    Get.to(() => const LoginPage(),
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 800));
  }

  @override
  void initState() {
    firstanimation();
    secondanimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
        _animationController1.reset();
      },
      child: AnimatedBuilder(
          animation:
              Listenable.merge([_animationController, _animationController1]),
          builder: (context, _) {
            return Scaffold(
              backgroundColor: const Color(0xFF100F0B),
              body: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/batman_background.png',
                        fit: BoxFit.contain,
                      )),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Transform.translate(
                        offset: Offset(
                            0.0,
                            60 * _animatiobtnlogout.value +
                                -_animatiobatmanup.value * 60),
                        child: Transform.scale(
                          scale: _animatiobatmanin.value,
                          child: Image.asset(
                            'assets/images/batman_alone.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Opacity(
                              opacity: _animatiologomoveup.value,
                              child: Column(
                                children: const [
                                  Text(
                                    'WELCOME TO',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'BASHA CITY',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Opacity(
                              opacity: _animatiobtnsin.value,
                              child: Transform.translate(
                                offset: Offset(
                                    0.0, 100 * (1 - _animatiobtnsin.value)),
                                child: Column(
                                  children: [
                                    BatmaBtn(
                                      onTap: signup,
                                      text: 'LOGIN',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    BatmaBtn(
                                      onTap: signup,
                                      text: 'SIGNUP',
                                      left: false,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 2.2 -
                          65 * _animatiologomoveup.value,
                      height: 50,
                      left: 0,
                      right: 0,
                      child: Transform.scale(
                        scale: _animatiologoin.value,
                        child: Image.asset(
                          'assets/images/batman_logo.png',
                          fit: BoxFit.contain,
                        ),
                      )),
                ],
              ),
            );
          }),
    );
  }
}
