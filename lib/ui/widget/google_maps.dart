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
  bool covid = true;
  bool banjir = true;
  bool gempa = true;
  bool longsor = true;
  bool search = false;
  static const kGoogleApiKey = "AIzaSyDafHTY2k1B7_YV9hBOX7woxcS9DEDdWmk";
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = TextEditingController();

  List _items = [];
  List _itemsResult = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/jsonkecamatan/kecamatan.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"];
    });
  }

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    sizeConfig.init(context);
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return (applicationBloc.currentLocation == null)
        ? Center(
            child: const CircularProgressIndicator(),
          )
        : Scaffold(
            key: homeScaffoldKey,
            body: Stack(children: [
              Stack(
                children: [
                  Container(
                    height: SizeConfig.blockSizeVertical * 120,
                    child: const WebView(
                      initialUrl:
                          'https://www.google.com/maps/place/Nangkaan,+Kec.+Bondowoso,+Kabupaten+Bondowoso,+Jawa+Timur/@-7.9284984,113.8035192,15z/data=!3m1!4b1!4m5!3m4!1s0x2dd6dcd5e994cba5:0x6e9f5452ef10f836!8m2!3d-7.9290528!4d113.8093931',
                      javascriptMode: JavascriptMode.unrestricted,
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
                      height: SizeConfig.safeBlockVertical * 14,
                      bottom: 15,
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
                                height: SizeConfig.blockSizeVertical * 10,
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
                                                      covid = !covid;
                                                    });
                                                  },
                                                  fillColor: covid
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
                                                    color: covid
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
                                                      banjir = !banjir;
                                                    });
                                                  },
                                                  fillColor: banjir
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
                                                    color: banjir
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
                                                      gempa = !gempa;
                                                    });
                                                  },
                                                  fillColor: gempa
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
                                                    color: gempa
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
                                                      longsor = !longsor;
                                                    });
                                                  },
                                                  fillColor: longsor
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
                                                      color: longsor
                                                          ? Colors.grey
                                                          : orangeColor,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              RawMaterialButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      covid = !covid;
                                                    });
                                                  },
                                                  fillColor: covid
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
                                                    color: covid
                                                        ? Colors.grey
                                                        : orangeColor,
                                                    fontSize: 12),
                                              )
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
            ]));
  }
}
