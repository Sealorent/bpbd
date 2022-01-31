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
<<<<<<< Updated upstream
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
=======
                'assets/images/logo.png',
                width: 141,
                height: 170,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 195, 0),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                  children: const [
                    Text(
                        '1. Keluar rumah jika ada keperluan saja.\n2. Menjaga jarak 1-2 meter jika keluar rumah dan menghindari kerumunan.\n3. Jangan berjabat tangan.\n4. Memakai masker sesuai dengan ketentuan Kementrian Kesehatan.'),
=======
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('1. Keluar rumah jika ada keperluan saja.'),
                    Text(
                        '2. Menjaga jarak 1-2 meter jika keluar rumah dan menghindari kerumunan.'),
                    Text('3. Jangan berjabat tangan.'),
                    Text(
                        '4. Memakai masker sesuai dengan ketentuan Kementrian Kesehatan.'),
>>>>>>> Stashed changes
                  ],
                ),
              ),
              Padding(
<<<<<<< Updated upstream
                padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      text: 'Dan juga terapkan hidup sehat, dengan cara :',
                      style: TextStyle(
                        color: Colors.black,
=======
                padding: const EdgeInsets.fromLTRB(10, 30, 50, 0),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      text: 'Tentang Aplikasi BPBD Bondowoso',
                      style: TextStyle(
                        color: Colors.orange,
>>>>>>> Stashed changes
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
<<<<<<< Updated upstream
                child: Column(
                  children: const [
                    Text(
                        '1. Mencuci tangan menggunakan sabun dan air mengalir sesering mungkin, dan sebelum makan.\n2. Mandi dan mengganti pakaian setelah bepergian.\n3. Mengkonsumsi makanan yang bergizi seimbang.\n4. Olahraga yang teratur.\n5. Serta menciptakan lingkungan yang sehat.'),
                  ],
                ),
=======
                child: RichText(
                    text: const TextSpan(
                  text:
                      'Aplikasi BPBD Bondowoso ini adalah Aplikasi yang berguna untuk masyarakat di Kabupaten Bondowoso dan masyarakat yang berkunjung di daerah Kabupaten Bondowoso, untuk membantu masyarakat dalam menerima Informasi Bencana Alam yang berada disekitar masyarakat.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )),
>>>>>>> Stashed changes
              ),
            ],
          ),
        ),
      ],
    );
  }
}
