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
      body: SafeArea(
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
                Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: GridView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              "Home",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              "Home",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              "Home",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              "Home",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
