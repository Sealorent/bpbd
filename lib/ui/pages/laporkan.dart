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
    sizeConfig.init(context);
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
        body: SafeArea(child: _buildBody()));
  }

  Widget _buildBody() {
    return _buildContent();
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 60, 20.11, 0),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/ilustration.svg',
            height: 180,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: 'Laporkan ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Bencana ',
                          style: TextStyle(color: Colors.orange)),
                      TextSpan(text: 'yang Berada Disekitar Anda')
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: 'Kirimkan pesan anda kepada kami mengenai ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Bencana Alam ',
                          style: TextStyle(color: Colors.orange)),
                      TextSpan(
                          text:
                              'yang Berada Disekitar Anda, melalui WhatsApp dibawah')
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 25, 80, 0),
            child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/whatsapp.svg',
                        height: 25, color: Colors.white),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 2,
                    ),
                    Text(
                      'Hubungi Kami',
                      style: onBoardStyle.copyWith(
                          fontSize: 15, color: Colors.white),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
