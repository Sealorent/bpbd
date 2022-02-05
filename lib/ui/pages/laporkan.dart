part of 'pages.dart';

class Laporkan extends StatefulWidget {
  const Laporkan({Key? key}) : super(key: key);

  @override
  _LaporkanState createState() => _LaporkanState();
}

class _LaporkanState extends State<Laporkan> {
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Laporkan Bencana",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: ListView(
        children: [
          SafeArea(
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
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide())),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {},
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey),
                          height: SizeConfig.blockSizeVertical * 20,
                          width: SizeConfig.blockSizeHorizontal * 15,
                          child: Icon(Icons.add_a_photo),
                        ),
                        title: Text(
                          'Masukkan Foto Kejadian',
                          style: onBoardStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: orangeColor),
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
                      Container(
                        height: SizeConfig.safeBlockVertical * 25,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Isi deskripsi tentang kejadian',
                              // hintStyle: onBoardStyle.copyWith(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide())),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 5,
                          onFieldSubmitted: (_) {},
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 7,
                        width: SizeConfig.blockSizeHorizontal * 100,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: orangeColor))),
                              backgroundColor:
                                  MaterialStateProperty.all(orangeColor),
                            ),
                            child: Text(
                              'Kirim',
                              style: onBoardStyle.copyWith(fontSize: 20),
                            )),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
