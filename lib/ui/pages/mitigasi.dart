part of 'pages.dart';

class Mitigasi extends StatefulWidget {
  const Mitigasi({Key? key}) : super(key: key);

  @override
  _MitigasiState createState() => _MitigasiState();
}

class _MitigasiState extends State<Mitigasi> {
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
      body: ListView(
        children: [
          SafeArea(
            child: SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 30, 20, 0),
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: const TextSpan(
                            text:
                                'Berikut informasi yang harus dipersiapkan sebelum terjadinya bencana disekitar anda',
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
                                'Pilih bencananya untuk melihat rekomendasi mitigasinya.',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 44,
                                height: SizeConfig.blockSizeVertical * 20,
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orangeColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawMaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Detail()));
                                        },
                                        fillColor: Colors.white,
                                        shape: const CircleBorder(),
                                        child: FaIcon(
                                          FontAwesomeIcons.virus,
                                          size: 18,
                                          color: orangeColor,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.blockSizeHorizontal *
                                                  5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Covid-19',
                                            style: onBoardStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: whiteColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 44,
                                height: SizeConfig.blockSizeVertical * 20,
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orangeColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawMaterialButton(
                                        onPressed: () {},
                                        fillColor: Colors.white,
                                        shape: const CircleBorder(),
                                        child: SvgPicture.asset(
                                          'assets/icons/banjir.svg',
                                          height: 18,
                                          width: 18,
                                          color: orangeColor,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.blockSizeHorizontal *
                                                  5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Banjir',
                                            style: onBoardStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: whiteColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 44,
                                height: SizeConfig.blockSizeVertical * 20,
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orangeColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawMaterialButton(
                                        onPressed: () {},
                                        fillColor: Colors.white,
                                        shape: const CircleBorder(),
                                        child: Image.asset(
                                          'assets/icons/gempa.png',
                                          height: 18,
                                          width: 18,
                                          color: orangeColor,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.blockSizeHorizontal *
                                                  5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Gempa Bumi',
                                            style: onBoardStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: whiteColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 44,
                                height: SizeConfig.blockSizeVertical * 20,
                                padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: orangeColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawMaterialButton(
                                        onPressed: () {},
                                        fillColor: Colors.white,
                                        shape: const CircleBorder(),
                                        child: Image.asset(
                                          'assets/icons/longsor.png',
                                          height: 18,
                                          width: 18,
                                          color: orangeColor,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.blockSizeHorizontal *
                                                  5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.fill,
                                            child: Text(
                                              'Tanah Longsor',
                                              style: onBoardStyle.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: whiteColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
