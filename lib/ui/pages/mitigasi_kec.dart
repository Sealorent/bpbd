part of 'pages.dart';

class MitigasiKec extends StatefulWidget {
  const MitigasiKec({Key? key}) : super(key: key);

  @override
  _MitigasiKecState createState() => _MitigasiKecState();
}

class _MitigasiKecState extends State<MitigasiKec> {
  SizeConfig sizeConfig = SizeConfig();
  String? _token;
  Position? _position;
  double _longitude = 0.0;
  double _latitude = 0.0;
  String _kecamatan = '';
  MitigasiKategori? mitigasi;

  // Future<Kategori>? _dataKategori;

  @override
  void initState() {
    super.initState();

    _getAddress();
  }

  _initBencana(String kec) {
    Network.getListBencanaKec(kec).then((response) {
      print('Initial Bencana');
      setState(() {
        mitigasi = response;
        print(mitigasi);
      });
    });
  }

  Future<String> _getAddress() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _position = position;
        _kecamatan = place.locality!.replaceAll('Kecamatan ', '');
      });

      _initBencana(place.locality!.replaceAll('Kecamatan ', ''));

      return place.locality!.replaceAll('Kecamatan ', '');
    } catch (e) {
      print(e);
      return 'alamat tidak ditemukan';
    }
  }

  @override
  Widget build(BuildContext context) {
    print("lat : $_latitude");
    sizeConfig.init(context);
    if (mitigasi == null) {
      print('mitigasi tersedia');
    } else {
      print('mitigasi tidak tersedia');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mitigasi Kec $_kecamatan",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Berikut informasi yang harus dipersiapkan sebelum terjadinya bencana disekitar anda',
                    style: onBoardStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pilih bencananya untuk melihat rekomendasi Mitigasi Kecamatan nya.',
                    style: onBoardStyle.copyWith(
                      fontSize: 18,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: SizeConfig.blockSizeVertical * 60,
                    child: mitigasi != null
                        ? mitigasi!.data!.isNotEmpty
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20),
                                itemCount: mitigasi!.data!.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailMitigasi(
                                                    id: mitigasi!.data![index]
                                                        .id_kategori_bencana,
                                                    name: mitigasi!
                                                        .data![index].name,
                                                    icon: mitigasi!
                                                        .data![index].icon,
                                                  )));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: RawMaterialButton(
                                                  onPressed: () {},
                                                  fillColor: orangeColor,
                                                  shape: const CircleBorder(),
                                                  child: Image.network(
                                                    'https://bpbd.bsorumahinspirasi.com/public/upload/kategori/' +
                                                        mitigasi!
                                                            .data![index].icon!,
                                                    height: 35,
                                                    width: 35,
                                                  )),
                                            ),
                                            // Container(
                                            //   width: 40,
                                            //   height: 40,
                                            //   decoration: BoxDecoration(
                                            //       color: Colors.white,
                                            //       borderRadius:
                                            //           BorderRadius.circular(20)),
                                            //   child: Image.network(
                                            //       'https://bpbd.bsorumahinspirasi.com/public/upload/kategori/' +
                                            //           mitigasi!.data![index].icon!,
                                            //       color: Colors.amber
                                            //       // snapshot
                                            //       //     .data.data![index].icon
                                            //       //     .toString(),
                                            //       ),
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal *
                                                      30,
                                                  child: Text(
                                                    mitigasi!
                                                        .data![index].name!,
                                                    style:
                                                        onBoardStyle.copyWith(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.chevron_right_sharp,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // const Text("hai"),
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  );
                                })
                            : const Center(
                                child: Text('Mitigasi tidak tersedia'))
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
