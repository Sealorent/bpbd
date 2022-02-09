part of 'pages.dart';

class RawanBencanaPage extends StatefulWidget {
  RawanBencanaPage({Key? key}) : super(key: key);

  @override
  State<RawanBencanaPage> createState() => _RawanBencanaPageState();
}

class _RawanBencanaPageState extends State<RawanBencanaPage> {
  SizeConfig sizeConfig = SizeConfig();
  bool banjir = false;

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
          height: SizeConfig.blockSizeVertical * 80,
          child: ListView(
            children: [
              Column(
                children: [
                  Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          banjir = !banjir;
                        });
                      },
                      title: Text('Banjir'),
                    ),
                  ),
                  banjir == true
                      ? Container(
                          color: Colors.black,
                          height: SizeConfig.blockSizeVertical * 10,
                          width: SizeConfig.blockSizeHorizontal * 100,
                        )
                      : Container(),
                ],
              )
            ],
          ),
        ));
  }
}
