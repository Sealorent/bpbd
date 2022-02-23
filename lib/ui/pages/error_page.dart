part of 'pages.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  final splashDelay = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}