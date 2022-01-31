part of '../pages/pages.dart';

// String JenisKelamin { "laki-laki", "jefferson" };
enum JenisKelamin { pria, wanita }

class AkunPage extends StatefulWidget {
  const AkunPage({Key? key}) : super(key: key);

  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  // GoogleSignInAccount _userObj;
  SizeConfig sizeConfig = SizeConfig();
  JenisKelamin? _kelamin = JenisKelamin.pria;

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: SizeConfig.safeBlockVertical * 100,
        width: SizeConfig.safeBlockHorizontal * 100,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 5),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 40,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      // banjir = !banjir;
                                    });
                                  },
                                  // fillColor: banjir ? Colors.grey : orangeColor,
                                  shape: const CircleBorder(
                                      side: BorderSide(
                                    color: Colors.white,
                                    width: 4,
                                  )),
                                  child: Image.asset(
                                    'assets/icons/photo.png',
                                    height: 120,
                                    width: 120,
                                  )),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 1,
                              ),
                              Text(
                                "Profil",
                                style: onBoardStyle.copyWith(
                                    color: Colors.grey, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          right: 0,
                          // height: 40,
                          // width: 200,
                          child: RawMaterialButton(
                              fillColor: orangeColor,
                              onPressed: () {
                                setState(() {
                                  // banjir = !banjir;
                                });
                              },
                              // fillColor: banjir ? Colors.grey : orangeColor,
                              shape: const CircleBorder(),
                              child: Icon(Icons.create, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nama Lengkap',
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
                        hintText: 'Masukkan Nama Lengkap',
                        suffixIcon: const Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide())),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
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
                        hintText: 'Masukkan Email',
                        // hintStyle: onBoardStyle.copyWith(fontSize: 14),
                        suffixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide())),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'No. Telepon ',
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
                        hintText: 'Masukkan Nomor Telepon',
                        suffixIcon: const Icon(
                          Icons.call,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide())),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {},
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jenis Kelamin',
                      textAlign: TextAlign.left,
                      style: onBoardStyle.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
                          color: const Color(0xFF444444)),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: JenisKelamin.pria,
                          groupValue: _kelamin,
                          onChanged: (JenisKelamin? value) {
                            setState(() {
                              _kelamin = value;
                            });
                          },
                        ),
<<<<<<< Updated upstream
                      ),
                      Positioned(
                        bottom: 25,
                        right: 0,
                        // height: 40,
                        // width: 200,
                        child: RawMaterialButton(
                            fillColor: orangeColor,
                            onPressed: () {
                              setState(() {
                                // banjir = !banjir;
                              });
                            },
                            // fillColor: banjir ? Colors.grey : orangeColor,
                            shape: const CircleBorder(),
                            child:
                                const Icon(Icons.create, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nama Lengkap',
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
                      hintText: 'Masukkan Nama Lengkap',
                      suffixIcon: const Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide())),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
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
                      hintText: 'Masukkan Email',
                      // hintStyle: onBoardStyle.copyWith(fontSize: 14),
                      suffixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide())),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'No. Telepon ',
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
                      hintText: 'Masukkan Nomor Telepon',
                      suffixIcon: const Icon(
                        Icons.call,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide())),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jenis Kelamin',
                    textAlign: TextAlign.left,
                    style: onBoardStyle.copyWith(
                        fontWeight: FontWeight.w200,
                        fontSize: 18,
                        color: const Color(0xFF444444)),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: JenisKelamin.pria,
                        groupValue: _kelamin,
                        onChanged: (JenisKelamin? value) {
                          setState(() {
                            _kelamin = value;
                          });
                        },
                      ),
                      const Text(
                        'Pria',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Radio(
                        value: JenisKelamin.wanita,
                        groupValue: _kelamin,
                        onChanged: (JenisKelamin? value) {
                          setState(() {
                            _kelamin = value;
                          });
                        },
                      ),
                      const Text(
                        'Wanita',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ]),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 7,
                  width: SizeConfig.blockSizeHorizontal * 100,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: orangeColor))),
                        backgroundColor: MaterialStateProperty.all(orangeColor),
                      ),
                      child: Text(
                        'Simpan',
                        style: onBoardStyle.copyWith(fontSize: 20),
                      )),
                ),
              ],
=======
                        const Text(
                          'Pria',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        Radio(
                          value: JenisKelamin.wanita,
                          groupValue: _kelamin,
                          onChanged: (JenisKelamin? value) {
                            setState(() {
                              _kelamin = value;
                            });
                          },
                        ),
                        const Text(
                          'Wanita',
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ]),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 7,
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: orangeColor))),
                          backgroundColor:
                              MaterialStateProperty.all(orangeColor),
                        ),
                        child: Text(
                          'Simpan',
                          style: onBoardStyle.copyWith(fontSize: 20),
                        )),
                  ),
                ],
              ),
>>>>>>> Stashed changes
            ),
          ],
        ),
      ),
    );
  }
}
