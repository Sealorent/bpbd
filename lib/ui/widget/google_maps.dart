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
  static const kGoogleApiKey = "AIzaSyDafHTY2k1B7_YV9hBOX7woxcS9DEDdWmk";
  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return (applicationBloc.currentLocation == null)
        ? Center(
            child: const CircularProgressIndicator(),
          )
        : Scaffold(
            key: homeScaffoldKey,
            body: Stack(
              children: [
                Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      compassEnabled: true,
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.blockSizeVertical * 28,
                          right: SizeConfig.blockSizeHorizontal * 4),
                      initialCameraPosition: CameraPosition(
                        target: LatLng(applicationBloc.currentLocation.latitude,
                            applicationBloc.currentLocation.longitude),
                        zoom: 14.0,
                      ),
                    ),
                    Positioned(
                        height: SizeConfig.safeBlockVertical * 8,
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
                        bottom: 12,
                        width: SizeConfig.blockSizeHorizontal * 100,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 5),
                          child: Container(
                            // color: orangeColor,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                                                    style:
                                                        onBoardStyle.copyWith(
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
                    Positioned(
                      bottom: SizeConfig.blockSizeVertical * 16,
                      right: 0,
                      // width: SizeConfig.blockSizeHorizontal * ,
                      child: Column(
                        children: [
                          RawMaterialButton(
                            fillColor: onLocation ? Colors.grey : orangeColor,
                            shape: const CircleBorder(
                                side: BorderSide(
                              color: Colors.white,
                            )),
                            // elevation: 0.0,
                            child: onLocation
                                ? const Icon(
                                    Icons.location_off,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                            onPressed: () {
                              setState(() {
                                onLocation = !onLocation;
                              });
                            },
                          ),
                          RawMaterialButton(
                            fillColor: onSearching ? Colors.grey : orangeColor,
                            shape: const CircleBorder(
                                side: BorderSide(
                              color: Colors.white,
                            )),
                            // elevation: 0.0,
                            child: onSearching
                                ? const Icon(
                                    Icons.location_searching,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.my_location,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                            onPressed: () {
                              setState(() {
                                onSearching = !onSearching;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 10,
                  // left: 20,
                  width: SizeConfig.safeBlockHorizontal * 100,
                  // padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 70,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(
                                    1, 2), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 4),
                            child: TextField(
                                readOnly: true,
                                onTap: () {
                                  _handlePressButton();
                                },
                                enabled: true,
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.search),
                                    hintText: 'Cari Daerah',
                                    // contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none),
                                onChanged: (value) {}),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 4,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotifikasiPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            primary: Colors.white,
                            fixedSize: const Size(20, 48),
                          ),
                          child: SvgPicture.asset('assets/icons/alert.svg'))
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      // onError: onError,
      mode: Mode.overlay,
      language: "id",
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, "id")],
    );

    displayPrediction(p, homeScaffoldKey.currentState!);
  }

  Future<void> displayPrediction(Prediction? p, ScaffoldState scaffold) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
    }
  }
}
