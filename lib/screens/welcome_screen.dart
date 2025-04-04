import 'package:flutter/material.dart';

import 'custom_scaffold.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text:  TextSpan(
                      children: [
                        TextSpan(
                            text:
                                '\n\nHey Sastraites!!!!Great Fe(a)st awaits.....\n',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white
                            )),
                        TextSpan(
                            text:
                                '\n\n Embrace the Beat, Ignite the Spirit: Unleash Your Potential at THETA 2K25!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                                color: Colors.white
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          const Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: welcomeButton(
                      buttontext: 'Log in',
                      onTap: SignInScreen(),
                      color: Colors.redAccent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: welcomeButton(
                      buttontext: 'Sign up',
                      onTap: SignUpScreen(),
                      color: Colors.white,
                      textColor: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
