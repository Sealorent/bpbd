part of 'pages.dart';

class Laporkan extends StatefulWidget {
  const Laporkan({Key? key}) : super(key: key);

  @override
  _LaporkanState createState() => _LaporkanState();
}

class _LaporkanState extends State<Laporkan> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var judul, alamat, pesan;
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // bool _secureText = true;
  SizeConfig sizeConfig = SizeConfig();
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
                            ListTile(
                              leading: Container(
                                width: SizeConfig.blockSizeHorizontal * 15,
                                height: SizeConfig.blockSizeVertical * 15,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              title: Text(
                                'Masukkan foto kejadian',
                                style:
                                    onBoardStyle.copyWith(color: orangeColor),
                              ),
                            ),
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

    var data = {'title': judul, 'alamat': alamat, 'desc': pesan};
    var res = await Network().auth(data, '/laporan-bencana');
    var body = json.decode(res.body);
    if (body['success']) {
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', json.encode(body['token']));
      // localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PilihanMenu()),
      );
    } else {
      // _showMsg(body['message']);
      print('object');
    }

    setState(() {
      _isLoading = false;
    });
  }
}
