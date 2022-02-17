part of 'pages.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  Berita? berita;
  Kategori? kategori;

  _initKategori() {
    Network.getListKategori().then((response) {
      setState(() {
        kategori = response;
        _controller = TabController(
          length: (1 + response.data!.length),
          vsync: this,
        );
      });
    });
  }

  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.white,
          elevation: 0.0,
          // centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 20),
            child: Text('Notifikasi',
                style:
                    onBoardStyle.copyWith(fontSize: 20, color: Colors.black)),
          ),
          bottom: PreferredSize(
            child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                labelColor: orangeColor,
                controller: _controller,
                tabs: [
                  Tab(
                    child: Text(
                      'Terbaru',
                      style: defaultStyle.copyWith(fontSize: 18),
                    ),
                  ),
                  for (var item in kategori!.data!)
                    Tab(
                      child: Text(
                        item.name.toString(),
                        style: defaultStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  // Tab(
                  //   child: Text(
                  //     'Banjir',
                  //     style: defaultStyle.copyWith(fontSize: 18),
                  //   ),
                  // ),
                  // Tab(
                  //   child: Text(
                  //     'Gempa Bumi',
                  //     style: defaultStyle.copyWith(fontSize: 18),
                  //   ),
                  // ),
                  // Tab(
                  //   child: Text(
                  //     'Tanah Longsor',
                  //     style: defaultStyle.copyWith(fontSize: 18),
                  //   ),
                  // ),
                ]),
            preferredSize: Size.fromHeight(SizeConfig.blockSizeVertical * 6),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Terbaru(),
            Terbaru(),
            Terbaru(),
            Terbaru(),
          ],
        ),
      ),
    );
  }
}
