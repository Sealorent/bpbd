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
                padding: const EdgeInsets.fromLTRB(10, 50, 195, 0),
                child: RichText(
                    textAlign: TextAlign.left,
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
                      'Badan Penanggulangan Bencana Daerah adalah lembaga pemerintah non-departemen yang melaksanakan tugas penanggulangan bencana di daerah baik Provinsi maupun Kabupaten/ Kota dengan berpedoman pada kebijakan yang ditetapkan oleh Badan Nasional Penanggulangan Bencana.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 50, 0),
                child: RichText(
                    textAlign: TextAlign.left,
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
                      'Aplikasi BPBD Bondowoso ini adalah Aplikasi yang berguna untuk masyarakat di Kabupaten Bondowoso dan masyarakat yang berkunjung di daerah Kabupaten Bondowoso, untuk membantu masyarakat dalam menerima Informasi Bencana Alam yang berada disekitar masyarakat.',
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
