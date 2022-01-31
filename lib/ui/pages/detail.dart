part of 'pages.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
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
        body: SafeArea(child: _buildBody()));
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/longsor.png',
                height: 200,
                width: 200,
                color: orangeColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tanah Longsor',
                      style: onBoardStyle.copyWith(color: orangeColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      text: 'Cara mencegah penularan Virus Covid ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Column(
                  children: const [
                    Text(
                        '1. Keluar rumah jika ada keperluan saja.\n2. Menjaga jarak 1-2 meter jika keluar rumah dan menghindari kerumunan.\n3. Jangan berjabat tangan.\n4. Memakai masker sesuai dengan ketentuan Kementrian Kesehatan.'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      text: 'Dan juga terapkan hidup sehat, dengan cara :',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: Column(
                  children: const [
                    Text(
                        '1. Mencuci tangan menggunakan sabun dan air mengalir sesering mungkin, dan sebelum makan.\n2. Mandi dan mengganti pakaian setelah bepergian.\n3. Mengkonsumsi makanan yang bergizi seimbang.\n4. Olahraga yang teratur.\n5. Serta menciptakan lingkungan yang sehat.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
