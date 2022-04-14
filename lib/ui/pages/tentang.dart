part of 'pages.dart';

class Tentang extends StatefulWidget {
  const Tentang({Key? key}) : super(key: key);

  @override
  _TentangState createState() => _TentangState();
}

class _TentangState extends State<Tentang> {
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tentang Aplikasi",
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
                'assets/images/logo.png',
                width: 141,
                height: 170,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Tentang BPBD',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: RichText(
                    text: const TextSpan(
                  text:
                      'Badan Penanggulangan Bencana Daerah adalah Badan Penanggulangan Bencana Daerah Kabupaten Bondowoso yang dibentuk dalam rangka melaksanakan tugas dan fungsi untuk melaksanakan penanggulangan bencana. \n\n BPBD mempunyai tugas : \n1. menetapkan pedoman dan pengarahan terhadap usaha penanggulangan bencana yang mencakup pencegahan bencana, penanganan darurat, rehabilitasi serta rekonstruksi secara adil dan setara; \n2. menetapkan standarisasi serta kebutuhan penyelenggaraan penanggulangan bencana berdasarkan peraturan perundang-undangan; \n3. menyusun, menetapkan dan menginformasikan peta rawan bencana; \n4. menyusun dan menetapkan prosedur tetap penanganan bencana; \n5. melaporkan penyelenggaraan penanggulangan bencana kepada Bupati setiap bulan sekali dalam kondisi normal dan setiap saat dalam kondisi darurat bencana. \n\nBPBD dalam melaksanakan tugasnya mempunyai fungsi : \n1. perumusan dan penetapan kebijakan penanggulangan bencana dan penanganan pengungsi dengan bertindak cepat dan tepat, efektif dan efisien; dan \n2. pengkoordinasian pelaksanaan kegiatan penanggulangan bencana secara terencana, terpadu dan menyeluruh.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Tentang Aplikasi BPBD Bondowoso',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: RichText(
                    text: const TextSpan(
                  text:
                      'Aplikasi SIGABAN ini adalah sebuah aplikasi yang digunakan untuk media pelaporan dalam rangka penanganan bencana di Kabupaten Bondowoso Provinsi Jawa Timur. \nSelain itu, aplikasi ini juga berisikan peta rawan bencana banjir, kekeringan, gunung berapi, likuifaksi, angin puting beliung, kebakaran hutan dan lahan, gempa bumi dan tanah longsor yang bisa digunakan oleh seluruh masyarakat yang berada di wilayah kabupaten bondowoso untuk mengetahui ancaman bencana apa saja di wilayah mereka berada. \nAplikasi ini juga berisikan informasi penanganan bencana oleh BPBD Kabupaten Bondowoso serta informasi berbagai mitigasi bencana yang bisa dilakukan oleh masyarakat kabupaten bondowoso dalam mencegah terjadinya bencana. \nSemoga aplikasi ini bisa terus berkembang dan bermanfaat bagi masyarakat kabupaten bondowoso dan masyarakat yang akan berkunjung ke kabupaten bondowoso.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
