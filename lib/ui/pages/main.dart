part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SizeConfig sizeConfig = SizeConfig();
  int index = 1;
  Color enableColor = Colors.white;
  Color disableColor = Colors.transparent;
  Color enableIconColor = orangeColor;
  int selectedIndex = 1;
  // var _token;
  DateTime pre_backpress = DateTime.now();
  // _get() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   _token = jsonDecode((localStorage.getString('token')).toString());
  // }

  final _listPage = <Widget>[
    const PilihanMenu(),
    const GoogleMapsPage(),
    const AkunPage()
  ];
  // GlobalKey<NavigatorState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // _get();
    // print(_token);
    sizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async {
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);
        pre_backpress = DateTime.now();
        if (cantExit) {
          //show snackbar
          const snack = SnackBar(
            content: Text('Tekan sekali lagi untuk keluar'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: SizeConfig.blockSizeVertical * 10,
            backgroundColor: orangeColor,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: index == 0 ? enableColor : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        index = 0;
                        selectedIndex = 0;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/menu-boxed.svg',
                          height: 29,
                          color: index == 0 ? enableIconColor : Colors.black,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        Text(
                          'Menu',
                          style: onBoardStyle.copyWith(
                            fontSize: 20,
                            color: index == 0 ? enableIconColor : Colors.black,
                          ),
                        ),
                      ],
                    )),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: index == 1 ? enableColor : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        index = 1;
                        selectedIndex = 1;
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/home.svg',
                          height: 29,
                          color: index == 1 ? enableIconColor : Colors.black,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        Text(
                          'Beranda',
                          style: onBoardStyle.copyWith(
                            fontSize: 18,
                            color: index == 1 ? enableIconColor : Colors.black,
                          ),
                        ),
                      ],
                    )),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: index == 2 ? enableColor : disableColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        index = 2;
                        selectedIndex = 2;
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/person.svg',
                          height: 29,
                          color: index == 2 ? enableIconColor : Colors.black,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        Text(
                          'Akun',
                          style: onBoardStyle.copyWith(
                              fontSize: 18,
                              color:
                                  index == 2 ? enableIconColor : Colors.black),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          body: _listPage[selectedIndex]),
    );
  }
}
