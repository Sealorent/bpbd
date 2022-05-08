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

  // _initBerita() {
  //   Network.getListKategori().then((response) {
  //     setState(() {
  //       berita = response;
  //     });
  //   });
  // }

  _initKategori() {
    Network.getListKategori().then((response) {
      setState(() {
        kategori = response;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _initBerita();
    _initKategori();
  }

  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shadowColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              title: Text('Notifikasi',
                    style: onBoardStyle.copyWith(
                        fontSize: 20, color: Colors.black)),
            ),
            // for (var item in kategori!.data!)
            body: FutureBuilder(
                future: Network.getListBerita(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) return Text('selamat');
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  title: Text(snapshot.data.data[index].name),
                                  subtitle: Text(snapshot
                                      .data.data[index].createdAt
                                      .toString()),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text(
                            "Data tidak ada...",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 30.0),
                          ),
                        );
                      }
                    default:
                      return Center(child: Text('Error: ${snapshot.error}'));
                  }
                })));
  }
}
