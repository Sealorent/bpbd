part of 'pages.dart';

class Mitigasi extends StatefulWidget {
  const Mitigasi({Key? key}) : super(key: key);

  @override
  _MitigasiState createState() => _MitigasiState();
}

class _MitigasiState extends State<Mitigasi> {
  SizeConfig sizeConfig = SizeConfig();
  String? _token;

  // Future<Kategori>? _dataKategori;

  // @override
  // void initState() {
  //   _dataKategori = Network.getListKategori();
  // }

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
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Berikut informasi yang harus dipersiapkan sebelum terjadinya bencana disekitar anda',
                    style: onBoardStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pilih bencananya untuk melihat rekomendasi mitigasinya.',
                    style: onBoardStyle.copyWith(
                      fontSize: 18,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: SizeConfig.blockSizeVertical * 60,
                    child: FutureBuilder(
                      future: Network.getListKategori(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) return Text('Error');
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.active:
                          case ConnectionState.done:
                            if (snapshot.hasData) {
                              return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 3 / 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount: snapshot.data.data.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailMitigasi(
                                                      id: snapshot
                                                          .data.data[index].id,
                                                      name: snapshot.data
                                                          .data[index].name,
                                                      icon: snapshot.data
                                                          .data[index].icon,
                                                    )));
                                      },
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Image.network(
                                                    'https://bsorumahinspirasi.com/public/upload/kategori/' +
                                                        snapshot.data
                                                            .data[index].icon,
                                                    color: Colors.amber
                                                    // snapshot
                                                    //     .data.data![index].icon
                                                    //     .toString(),
                                                    ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data.data![index].name,
                                                    style:
                                                        onBoardStyle.copyWith(
                                                            color: Colors.white,
                                                            fontSize: 16),
                                                  ),
                                                  const Icon(
                                                    Icons.chevron_right_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        // const Text("hai"),
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    );
                                  });
                            }
                        }
                        return const Center(
                          child: Text(
                            "Loading ...",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 30.0),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
