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
  Kategori? kategori;

  @override
  void initState() {
    super.initState();
    _initBerita();
    _initKategori();
  }

  _initBerita() {
    Network.getListBerita().then((response) {
      setState(() {
        berita = response;
      });
    });
  }

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

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                        if (response.data != null) {
                          print('berita ditemukan');
                          setState(() {
                            berita!.data!.clear();
                            berita = response;
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
                  for (var item in kategori!.data!)
                    Tab(
                      child: Text(
                        item.name.toString(),
                        style: defaultStyle.copyWith(fontSize: 16),
                      ),
                    ),
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
                          itemCount: 1,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                              elevation: 2,
                              borderOnForeground: true,
                              shadowColor: Colors.black.withOpacity(0.9),
                              child: ListTile(
                                  onTap: () {
                                    if (berita!.data![index].link_artikel !=
                                        null) {
                                      _launchURL(
                                          berita!.data![index].link_artikel!);
                                    } else {
                                      print('url kosong');
                                      Fluttertoast.showToast(
                                          msg: "Artikel tidak tersedia",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  },
                                  leading: Container(
                                      height: SizeConfig.blockSizeVertical * 8,
                                      width: SizeConfig.blockSizeVertical * 8,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                        Network.IMG_PATH +
                                            berita!.data![index].cover!,
                                        fit: BoxFit.contain,
                                      )),
                                  title: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text((berita!.data![index].title)
                                            .toString()),
                                        Text(
                                            berita!.data![index].createdAt
                                                .toString(),
                                            style: onBoardStyle.copyWith(
                                                fontSize: 12)),
                                      ],
                                    ),
                                  )),
                            );
                          })
                      : const Center(
                          child: Text(
                            "Loading ...",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 30.0),
                          ),
                        ),
                  for (var item in kategori!.data!)
                    FutureBuilder(
                        future: myController.text.isNotEmpty
                            ? Network.getListBeritaKategoriTitle(
                                item.id.toString(), myController.text)
                            : Network.getListBeritaKategori(item.id.toString()),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return const Center(child: Text("can't connect"));
                          }
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.active:
                            case ConnectionState.done:
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return Card(
                                        elevation: 2,
                                        borderOnForeground: true,
                                        shadowColor:
                                            Colors.black.withOpacity(0.9),
                                        child: ListTile(
                                            leading: Container(
                                                height: SizeConfig
                                                        .blockSizeVertical *
                                                    8,
                                                width: SizeConfig
                                                        .blockSizeVertical *
                                                    8,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.network(
                                                  Network.IMG_PATH +
                                                      snapshot.data.data[index]
                                                          .cover,
                                                  fit: BoxFit.contain,
                                                )),
                                            onTap: () {
                                              if (snapshot.data.data[index]
                                                      .link_artikel !=
                                                  null) {
                                                _launchURL(snapshot.data
                                                    .data[index].link_artikel);
                                              } else {
                                                print('url kosong');
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Artikel tidak tersedia",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            },
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(snapshot
                                                      .data.data[index].title),
                                                  Text(
                                                      snapshot.data.data[index]
                                                          .createdAt,
                                                      style:
                                                          onBoardStyle.copyWith(
                                                              fontSize: 12)),
                                                ],
                                              ),
                                            )),
                                      );
                                    });
                              } else {
                                return const Center(
                                  child: Text(
                                    "Data tidak ada...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30.0),
                                  ),
                                );
                              }
                          }
                        }),
                ],
              ),
            ),
          ],
        ));
  }
}
