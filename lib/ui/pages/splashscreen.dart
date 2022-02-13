part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool ifLogin = false;

  @override
  void initState() {
    goHomePage();
    super.initState();
    _isLogin();
  }

  void _isLogin() async {
    final logIn = await SharedPreferences.getInstance();
    setState(() {
      ifLogin = (logIn.getBool('isLogin') ?? false);
    });
    // final logIn = isLogin.getBool('isLogin');
  }

  goHomePage() {
    Timer(const Duration(seconds: 5), () {
      ifLogin == false
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OnBoarding()))
          : Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GuestPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return _splash(context);
  }
}
