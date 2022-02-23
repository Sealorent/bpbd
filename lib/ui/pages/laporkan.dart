part of 'pages.dart';

class Laporkan extends StatefulWidget {
  const Laporkan({Key? key}) : super(key: key);

  @override
  _LaporkanState createState() => _LaporkanState();
}

class _LaporkanState extends State<Laporkan> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  var judul, alamat, pesan, _image;
  String? _img64;
  var _token;
  SizeConfig sizeConfig = SizeConfig();
  double _longitude = 0.0;
  double _latitude = 0.0;

  _imgFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      final bytes = File(_image.path).readAsBytesSync();
      _img64 = "data:image/png;base64," + base64Encode(bytes);
    });
  }

  _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      final bytes = File(_image.path).readAsBytesSync();
      _img64 = "data:image/png;base64," + base64Encode(bytes);
    });
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    _token = jsonDecode((localStorage.getString('token')).toString());
    if (_token == null) {
      Fluttertoast.showToast(
          msg: "Harap masuk menggunakan akun yang sudah terdaftar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    } else {
      _token = _token['token'];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mitigasi Bencana",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SafeArea(
              child: SizedBox(
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 30, 20, 0),
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              text:
                                  'Berikan pesan kepada kami mengenai Bencana Alam yang berada di sekitar anda.',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.5,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 25, 0),
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              text:
                                  'Isi sesuai dengan kejadian yang ada di sekitar anda.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Judul',
                                textAlign: TextAlign.left,
                                style: onBoardStyle.copyWith(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    color: const Color(0xFF444444)),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Apa yang terjadi ?',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide())),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {},
                                validator: (judulValue) {
                                  if (judulValue!.isEmpty) {
                                    return 'Please enter your tittle';
                                  }
                                  judul = judulValue;
                                  return null;
                                }),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Alamat',
                                textAlign: TextAlign.left,
                                style: onBoardStyle.copyWith(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    color: const Color(0xFF444444)),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Dimana kejadian bencana itu ?',
                                    // hintStyle: onBoardStyle.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide())),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {},
                                validator: (alamatValue) {
                                  if (alamatValue!.isEmpty) {
                                    return 'Please enter your address';
                                  }
                                  alamat = alamatValue;
                                  return null;
                                }),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Pesan',
                                textAlign: TextAlign.left,
                                style: onBoardStyle.copyWith(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    color: const Color(0xFF444444)),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Isi deskripsi tentang kejadian',
                                    // hintStyle: onBoardStyle.copyWith(fontSize: 14),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide())),
                                keyboardType: TextInputType.text,
                                maxLines: 4,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {},
                                validator: (pesanValue) {
                                  if (pesanValue!.isEmpty) {
                                    return 'Please enter your description';
                                  }
                                  pesan = pesanValue;
                                  return null;
                                }),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ),
                            ListTile(
                              leading: Container(
                                width: SizeConfig.blockSizeHorizontal * 15,
                                height: SizeConfig.blockSizeVertical * 15,
                                child: _image == null
                                    ? const Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          File(_image.path),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return SafeArea(
                                        child: Wrap(
                                          children: <Widget>[
                                            ListTile(
                                                leading: const Icon(
                                                    Icons.photo_library),
                                                title:
                                                    const Text('Photo Library'),
                                                onTap: () {
                                                  _imgFromGallery();
                                                  Navigator.of(context).pop();
                                                }),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.photo_camera),
                                              title: const Text('Camera'),
                                              onTap: () {
                                                _imgFromCamera();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              title: Text(
                                'Masukkan foto kejadian',
                                style:
                                    onBoardStyle.copyWith(color: orangeColor),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 5,
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 7,
                              width: SizeConfig.blockSizeHorizontal * 100,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _laporkan();
                                    }
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: orangeColor))),
                                    backgroundColor:
                                        MaterialStateProperty.all(orangeColor),
                                  ),
                                  child: Text(
                                    'Kirim',
                                    style: onBoardStyle.copyWith(fontSize: 20),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _laporkan() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'title': judul,
      'alamat': alamat,
      'desc': pesan,
      'longitude': _longitude.toString(),
      'latitude': _latitude.toString(),
      'img': _image.name,
      'base64': _img64,
    };

    Network.sendLaporan(data, _token).then((response) {
      print(_token);
      if (response.success!) {
        Fluttertoast.showToast(
            msg: "Berhasil mengirim laporan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);
      } else {
        Fluttertoast.showToast(
            msg: "Gagal mengirim laporan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);
      }
      Navigator.pop(context);
    });

    setState(() {
      _isLoading = false;
    });
  }

  _getCurrentLocation() async {
    await Geolocator.isLocationServiceEnabled();
    await Geolocator.requestPermission();
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
