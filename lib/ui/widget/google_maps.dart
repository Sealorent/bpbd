part of '../pages/pages.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  SizeConfig sizeConfig = SizeConfig();
  bool onLocation = true;
  bool onSearching = true;
  bool defaultMaps = true;
  bool covid = true;
  bool banjir = true;
  bool gempa = true;
  bool longsor = true;
  bool search = false;
  int selectedIndex = 0;
  int inT = 0;
  double _longitude = -8.094825;
  double _latitude = 112.1477463;
  static const kGoogleApiKey = "AIzaSyDafHTY2k1B7_YV9hBOX7woxcS9DEDdWmk";
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  // final _key = GlobalKey<WebViewController>();
  Position? _position;

  final _controller = TextEditingController();
  late WebViewController _webViewController;

  var _listUrl = <String>[
    'https://www.google.com/maps/place/Nangkaan,+Kec.+Bondowoso,+Kabupaten+Bondowoso,+Jawa+Timur/@-7.9284984,113.8035192,15z/data=!3m1!4b1!4m5!3m4!1s0x2dd6dcd5e994cba5:0x6e9f5452ef10f836!8m2!3d-7.9290528!4d113.8093931', // Default Home
    'https://www.google.com/maps/d/u/0/embed?mid=1AUHQPrCXVX-wVTuTVg1VsbfbAachLttD&usp=sharing', // Gempa Bumi
    'https://www.google.com/maps/d/u/0/embed?mid=14rJkIe3l_rvXgTr5-UBRvnP7N0xxuQH4&usp=sharing', // Tanah Longsor
    'https://www.google.com/maps/d/u/0/embed?mid=1FEV8WUN82ov_ug6wiEVpwvxZsuW05cv9&usp=sharing', // Gunung Api
    'https://www.google.com/maps/d/u/0/embed?mid=1djBME9l-eJS5c35YLOw8rHrv-qXwwAMv&usp=sharing', // Angin Puting Beliung
    'https://www.google.com/maps/d/u/0/embed?mid=1Ltx2B1SUL7o0zT9XcGTiN7LjQOhD9Gab&usp=sharing', // Kebakaran Hutan
    'https://www.google.com/maps/d/u/0/embed?mid=1H6S2GO3DTeymvPY2ipgCOJjkG-c-Q36Z&usp=sharing', // Likuifaksi
    'https://www.google.com/maps/d/u/0/embed?mid=1INe8PyPTth40NGjYloGLGpgx9kUee1ud&usp=sharing', // Banjir
  ];

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      key: homeScaffoldKey,
      body: Stack(
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical * 120,
            child: WebView(
              // key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'https://www.google.com/maps/place/@$_longitude,$_latitude,15z',
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
              },
            ),
          ),
          Positioned(
              height: SizeConfig.safeBlockVertical * 11,
              bottom: 0,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: Container(
                // color: orangeColor,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: orangeColor,
                ),
              )),
          Positioned(
            height: SizeConfig.safeBlockVertical * 4.5,
            top: 70,
            right: 10,
            width: SizeConfig.blockSizeHorizontal * 20,
            child: Container(
              // color: orangeColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: whiteColor,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Mitigasi()));
                },
                child: Center(
                  child: Text(
                    'Info Bahaya',
                    textAlign: TextAlign.center,
                    style:
                        defaultStyle.copyWith(fontSize: 10, color: blackColor),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            height: SizeConfig.safeBlockVertical * 4,
            top: 105,
            right: 10,
            width: SizeConfig.blockSizeHorizontal * 20,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotifikasiPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: whiteColor,
                    fixedSize: Size(20, 48),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/alert.svg',
                    height: 20,
                    width: 20,
                  )),
            ),
          ),
          Positioned(
              height: SizeConfig.safeBlockVertical * 17,
              bottom: 10,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 5),
                child: Container(
                  // color: orangeColor,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 10,
                        child: const Divider(
                          thickness: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 90,
                        height: SizeConfig.blockSizeVertical * 12,
                        color: Colors.white,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.,
                                // mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    children: [
                                      RawMaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              if (covid == true) {
                                                _webViewController
                                                    .loadUrl(_listUrl[1]);
                                                covid = false;
                                                banjir = true;
                                                gempa = true;
                                                longsor = true;
                                              } else {
                                                _webViewController
                                                    .loadUrl(_listUrl[0]);
                                                covid = true;
                                                banjir = true;
                                                gempa = true;
                                                longsor = true;
                                              }
                                            });
                                          },
                                          fillColor: covid == true
                                              ? Colors.grey
                                              : orangeColor,
                                          shape: const CircleBorder(),
                                          child: const FaIcon(
                                            FontAwesomeIcons.virus,
                                            size: 18,
                                            color: Colors.white,
                                          )),
                                      Text(
                                        'Covid-19',
                                        style: onBoardStyle.copyWith(
                                            color: covid == true
                                                ? Colors.grey
                                                : orangeColor,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      RawMaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              if (banjir == true) {
                                                _webViewController
                                                    .loadUrl(_listUrl[2]);
                                                covid = true;
                                                banjir = false;
                                                gempa = true;
                                                longsor = true;
                                              } else {
                                                _webViewController
                                                    .loadUrl(_listUrl[0]);
                                                covid = true;
                                                banjir = true;
                                                gempa = true;
                                                longsor = true;
                                              }
                                            });
                                          },
                                          fillColor: banjir == true
                                              ? Colors.grey
                                              : orangeColor,
                                          shape: const CircleBorder(),
                                          child: SvgPicture.asset(
                                            'assets/icons/banjir.svg',
                                            height: 18,
                                            width: 18,
                                          )),
                                      Text(
                                        'Banjir',
                                        style: onBoardStyle.copyWith(
                                            color: banjir == true
                                                ? Colors.grey
                                                : orangeColor,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      RawMaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              if (gempa == true) {
                                                _webViewController
                                                    .loadUrl(_listUrl[3]);
                                                covid = true;
                                                banjir = true;
                                                gempa = false;
                                                longsor = true;
                                              } else {
                                                _webViewController
                                                    .loadUrl(_listUrl[0]);
                                                covid = true;
                                                banjir = true;
                                                gempa = true;
                                                longsor = true;
                                              }
                                            });
                                          },
                                          fillColor: gempa == true
                                              ? Colors.grey
                                              : orangeColor,
                                          shape: const CircleBorder(),
                                          child: Image.asset(
                                            'assets/icons/gempa.png',
                                            height: 18,
                                            width: 18,
                                          )),
                                      Text(
                                        'Gempa',
                                        style: onBoardStyle.copyWith(
                                            color: gempa == true
                                                ? Colors.grey
                                                : orangeColor,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      RawMaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              if (longsor == true) {
                                                _webViewController
                                                    .loadUrl(_listUrl[4]);
                                                covid = true;
                                                banjir = true;
                                                gempa = true;
                                                longsor = false;
                                              } else {
                                                _webViewController
                                                    .loadUrl(_listUrl[0]);
                                                covid = true;
                                                banjir = true;
                                                gempa = true;
                                                longsor = true;
                                              }
                                            });
                                          },
                                          fillColor: longsor == true
                                              ? Colors.grey
                                              : orangeColor,
                                          shape: const CircleBorder(),
                                          child: Image.asset(
                                            'assets/icons/longsor.png',
                                            height: 18,
                                            width: 18,
                                          )),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Longsor',
                                          style: onBoardStyle.copyWith(
                                              color: longsor == true
                                                  ? Colors.grey
                                                  : orangeColor,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _longitude = position.longitude;
        _latitude = position.latitude;
      });
      var d = position;
      print('long : $_longitude');
      print('lat : $_latitude');
    }).catchError((e) {
      print('geolocation error : $e');
    });
  }
}
