part of '../pages/pages.dart';

Widget _splash(BuildContext context) {
  return Scaffold(
    backgroundColor: orangeColor,
    body: SafeArea(
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/background.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 140,
                // height: 170,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
