part of 'pages.dart';

class RawanBencanaPage extends StatefulWidget {
  RawanBencanaPage({Key? key}) : super(key: key);

  @override
  State<RawanBencanaPage> createState() => _RawanBencanaPageState();
}

class _RawanBencanaPageState extends State<RawanBencanaPage> {
  SizeConfig sizeConfig = SizeConfig();
  bool banjir = false;
  bool gempaBumi = false;
  bool longsor = false;
  bool anginBeliung = false;
  bool gerakanTanah = false;
  bool gunungApi = false;
  bool kecepatanAngin = false;
  bool kebakaranHutan = false;
  bool likuifaksi = false;

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Rawan Bencana",
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.white,
        ),
        body: SizedBox(
            height: SizeConfig.blockSizeVertical * 100,
            child: ListView(children: [
              Column(
                children: [
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          banjir = !banjir;
                        });
                      },
                      title: Text('BANJIR',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  banjir == true
                      ? Column(
                          children: [
                            Container(
                              // color: Colors.black,
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/BANJIR.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          gempaBumi = !gempaBumi;
                        });
                      },
                      title: Text('GEMPA BUMI',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  gempaBumi == true
                      ? Column(
                          children: [
                            Container(
                              // color: Colors.black,
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/GEMPA_BUMI.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          longsor = !longsor;
                        });
                      },
                      title: Text('TANAH LONGSOR',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  longsor == true
                      ? Column(
                          children: [
                            Container(
                              // color: Colors.black,
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/TANAH_LONGSOR.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          anginBeliung = !anginBeliung;
                        });
                      },
                      title: Text('ANGIN PUTING BELIUNG',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  anginBeliung == true
                      ? Column(
                          children: [
                            Container(
                              // color: Colors.black,
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/ANGIN_PUTING_BELIUNG.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          gerakanTanah = !gerakanTanah;
                        });
                      },
                      title: Text('GERAKAN TANAH',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  gerakanTanah == true
                      ? Column(
                          children: [
                            SizedBox(
                              // color: Colors.black,
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/GERAKAN_TANAH.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          kecepatanAngin = !kecepatanAngin;
                        });
                      },
                      title: Text('KECEPATAN ANGIN',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  kecepatanAngin == true
                      ? Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/KECEPATAN_ANGIN.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          gunungApi = !gunungApi;
                        });
                      },
                      title: Text('GUNUNG API',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  gunungApi == true
                      ? Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/GUNUNG_API.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 3,
                    color: orangeColor,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          kebakaranHutan = !kebakaranHutan;
                        });
                      },
                      title: Text('KEBAKARAN HUTAN',
                          style: onBoardStyle.copyWith(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  kebakaranHutan == true
                      ? Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 30,
                              width: SizeConfig.blockSizeHorizontal * 110,
                              child: Image.asset(
                                  'assets/images/peta/KEBAKARAN_HUTAN.png',
                                  width: SizeConfig.blockSizeHorizontal * 100,
                                  height: SizeConfig.blockSizeVertical * 50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.blockSizeHorizontal * 9),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {}, child: Text('Download')),
                              ),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            ])));
  }
}