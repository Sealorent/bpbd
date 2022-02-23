part of 'pages.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  static late SharedPreferences isLogin;

  bool logIn = false;

  final int _numpages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numpages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 10.0,
      width: isActive ? 30 : 10,
      decoration: BoxDecoration(
        color: isActive ? orangeColor : const Color(0xFFC4C4C4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  static Future init() async {
    isLogin = await SharedPreferences.getInstance();
  }

  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeHorizontal * 4),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      right: SizeConfig.blockSizeHorizontal * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          save();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GuestPage()),
                              (route) => false);
                        },
                        child: Text(
                          _currentPage == _numpages - 1 ? '' : 'Skip',
                          style: onBoardStyle.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: const Color(0xFFC4C4C4)),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                        height: SizeConfig.safeBlockVertical * 80,
                        child: PageView(
                          physics: const ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 10),
                              child: SizedBox(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 4,
                                    ),
                                    SvgPicture.asset('assets/images/ilus.svg'),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 4,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // textDirection: TextDirection.ltr,
                                        children: [
                                          Text(
                                            'Kami Siap Untuk',
                                            style: onBoardStyle.copyWith(
                                                fontSize: 25),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: onBoardStyle.copyWith(
                                                  fontSize: 25),
                                              children: [
                                                TextSpan(
                                                    text: 'Membantu',
                                                    style:
                                                        onBoardStyle.copyWith(
                                                            color:
                                                                orangeColor)),
                                                const TextSpan(text: ' '),
                                                const TextSpan(
                                                    text: 'di Sekitar Anda'),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    2,
                                          ),
                                          Text(
                                              'Aplikasi ini dibuat untuk menampilkan informasi Bencana Alam yang berada di sekitar',
                                              style: onBoardStyle.copyWith(
                                                color: const Color(0xFFC4C4C4),
                                                fontSize: 14,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal * 10),
                              child: SizedBox(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 10,
                                    ),
                                    SvgPicture.asset('assets/images/ilust.svg'),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 8,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // textDirection: TextDirection.ltr,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: onBoardStyle.copyWith(
                                                  fontSize: 23),
                                              children: [
                                                TextSpan(
                                                    text: 'Jagalah',
                                                    style:
                                                        onBoardStyle.copyWith(
                                                            color:
                                                                Colors.black)),
                                                const TextSpan(text: ' '),
                                                TextSpan(
                                                    text: 'Lingkunganmu',
                                                    style: TextStyle(
                                                        color: orangeColor)),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Untuk Kesehjateraan Bersama',
                                            style: onBoardStyle.copyWith(
                                                fontSize: 23),
                                          ),
                                          SizedBox(
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    2,
                                          ),
                                          Text(
                                              'Agar terciptanya lingkungan yang bersih, dan mengurangi resiko bencana alam',
                                              style: onBoardStyle.copyWith(
                                                color: const Color(0xFFC4C4C4),
                                                fontSize: 14,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 10,
                      right: SizeConfig.safeBlockHorizontal * 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: _buildPageIndicator(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonTheme(
                              height: SizeConfig.safeBlockVertical * 20,
                              child: TextButton(
                                onPressed: _currentPage == _numpages - 1
                                    ? () => Navigator.of(context)
                                            .pushReplacement(
                                                MaterialPageRoute(builder: (_) {
                                          save();
                                          return const GuestPage();
                                        }))
                                    : () => _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      _currentPage == _numpages - 1
                                          ? 'Mulai'
                                          : 'Next',
                                      textAlign: TextAlign.center,
                                      style:
                                          onBoardStyle.copyWith(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal * 2,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  save() async {
    await _OnBoardingState.init();
    isLogin.setBool('isLogin', true);
  }
}
