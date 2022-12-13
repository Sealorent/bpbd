part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool ifLogin = false;
  late bool isLogin = false;

  @override
  void initState() {
    super.initState();
    goHomePage();
    // _isLogin();
  }

  void _isLogin() async {
    final logIn = await SharedPreferences.getInstance();
    setState(() {
      ifLogin = (logIn.getBool('isLogin') ?? false);
      isLogin =
          logIn.getString('token') == null || logIn.getString('token') == null
              ? false
              : true;
    });
    // final logIn = isLogin.getBool('isLogin');
  }

  goHomePage() {
    _isLogin();
    Timer(const Duration(seconds: 5), () {
      ifLogin == false
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const OnBoarding()),
              (route) => false)
          : isLogin
              ? Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                  (route) => false)
              : Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const GuestPage()),
                  (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _splash(context);
  }
}
