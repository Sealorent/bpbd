part of 'pages.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  final myController = TextEditingController();

  Berita? berita;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
    );
    _initBerita();
  }

  _initBerita() {
    Network.getListBerita().then((response) {
      setState(() {
        berita = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Berita Terbaru",
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.white,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: const Offset(1, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: myController,
                    onChanged: (text) {
                      print(text);
                      Network.searchBerita(text).then((response) {
                        var res = response;
                        print(res);

                        if (response.data != null) {
                          print('berita ditemukan');
                          setState(() {
                            // berita = response;
                            berita!.data!.clear();
                          });
                        } else {
                          print('berita tidak ditemukan');
                          if (berita!.data!.isNotEmpty) {
                            print('berita di clear');
                            setState(() => berita!.data!.clear());
                          }
                        }
                      });
                    },
                    decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Cari Berita',
                        // contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 1),
            SizedBox(
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                labelColor: orangeColor,
                controller: _controller,
                tabs: [
                  Tab(
                    child: Text(
                      'Semua',
                      style: defaultStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Banjir',
                      style: defaultStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Tanah Longsor',
                      style: defaultStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Gempa Bumi',
                      style: defaultStyle.copyWith(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 72,
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  berita != null
                      ? ListView.builder(
                          itemCount: berita!.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                              elevation: 2,
                              borderOnForeground: true,
                              shadowColor: Colors.black.withOpacity(0.9),
                              child: ListTile(
                                  onTap: () {},
                                  leading: Container(
                                    color: Colors.blue,
                                    height: SizeConfig.blockSizeVertical * 8,
                                    width: SizeConfig.blockSizeVertical * 8,
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text((berita!.data![index].title)
                                          .toString()),
                                      Text(
                                          berita!.data![index].updatedAt
                                              .toString(),
                                          style: onBoardStyle.copyWith(
                                              fontSize: 12)),
                                    ],
                                  )),
                            );
                          })
                      : Container()
                ],
              ),
            ),
          ],
        ));
  }
}
