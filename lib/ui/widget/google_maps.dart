part of '../pages/pages.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  SizeConfig sizeConfig = SizeConfig();

  double? _longitude;
  double? _latitude;
  Berita? berita;
  Kategori? kategori;
  int? jmlberita;
  bool? serviceEnabled;
  bool isActive = false;
  int? indexi;
  static const kGoogleApiKey = "AIzaSyDafHTY2k1B7_YV9hBOX7woxcS9DEDdWmk";
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  _initBerita() {
    Network.getListBerita().then((response) {
      setState(() {
        berita = response;
        jmlberita = berita!.data!.length;
      });
    });
  }

  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _initBerita();

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    setState(() {
      _latitude;
      _longitude;
    });
    String _listUrl =
        'https://www.google.com/maps/place/@$_latitude,$_longitude,15z';
    // 'https://www.google.com/maps/place/Blitar,8z';
    print("k : $_listUrl");
    return Scaffold(
      key: homeScaffoldKey,
      body: Stack(
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical * 120,
            child: WebView(
              // key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _listUrl,
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
              },
              onPageStarted: (String url) {
                print('Starting $url');
              },
              onPageFinished: (String url) {
                print('Starting $url');
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
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: whiteColor,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MitigasiKec()));
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
            width: SizeConfig.blockSizeHorizontal * 13,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotifikasiPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: whiteColor,
                            fixedSize: const Size(20, 48),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/alert.svg',
                            height: 30,
                            width: 30,
                          )),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 3,
                        height: SizeConfig.blockSizeVertical * 2,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          color: Colors.red,
                        ),
                        child: Center(
                            child: Text(jmlberita.toString(),
                                style: onBoardStyle.copyWith(
                                    color: Colors.white, fontSize: 10))),
                      ),
                    )
                  ],
                ),
              ],
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
                        width: SizeConfig.blockSizeHorizontal * 100,
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
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 20,
                                      width:
                                          SizeConfig.safeBlockHorizontal * 95,
                                      child: FutureBuilder(
                                        future: Network.getListKategori(),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (snapshot.hasError)
                                            return Text('Error');
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.none:
                                            case ConnectionState.waiting:
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            case ConnectionState.active:
                                            case ConnectionState.done:
                                              if (snapshot.hasData) {
                                                return ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: snapshot
                                                        .data.data.length,
                                                    itemBuilder:
                                                        (BuildContext ctx,
                                                            index) {
                                                      return Column(
                                                        children: [
                                                          RawMaterialButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  if (isActive ==
                                                                      true) {
                                                                    isActive =
                                                                        false;
                                                                  }
                                                                  _webViewController
                                                                      .loadUrl(
                                                                          _listUrl);
                                                                });
                                                              },
                                                              onLongPress: () {
                                                                setState(() {
                                                                  if (isActive ==
                                                                      false) {
                                                                    isActive =
                                                                        true;
                                                                  }
                                                                  _webViewController
                                                                      .loadUrl(snapshot
                                                                          .data
                                                                          .data[
                                                                              index]
                                                                          .linkEmbed);
                                                                });
                                                              },
                                                              fillColor:
                                                                  orangeColor,
                                                              shape:
                                                                  const CircleBorder(),
                                                              child:
                                                                  Image.network(
                                                                'https://bpbd.bsorumahinspirasi.com/public/upload/kategori/' +
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .icon,
                                                                height: 40,
                                                                width: 40,
                                                              )),
                                                          Text(
                                                            snapshot
                                                                .data
                                                                .data![index]
                                                                .name,
                                                            style: onBoardStyle.copyWith(
                                                                color: isActive ==
                                                                        true
                                                                    ? orangeColor
                                                                    : Colors
                                                                        .grey,
                                                                fontSize: 10),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              }
                                          }
                                          return const Center(
                                            child: Text(
                                              "Loading ...",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 30.0),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ]),
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
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _longitude = position.longitude;
        _latitude = position.latitude;
        print('long : $_longitude');
        print('lat : $_latitude');
      });
      var d = position;
      print("d :$d");
    }).catchError((e) {
      print('geolocation error : $e');
    });
  }
}
