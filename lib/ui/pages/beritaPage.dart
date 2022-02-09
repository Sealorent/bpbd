part of 'pages.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
    );
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
                    // readOnly: true,Binabi
                    // controller: controller,
                    onTap: () {
                      setState(() {});
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
                  FutureBuilder(
                      future: Network.getListBerita(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError)
                          return Center(child: Text("can't connect"));
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
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BeritaDetailPage()));
                                          },
                                          leading: Container(
                                            color: Colors.blue,
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    8,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    8,
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot
                                                  .data.data[index].title),
                                              Text(
                                                  snapshot.data.data[index]
                                                      .updatedAt
                                                      .toString(),
                                                  style: onBoardStyle.copyWith(
                                                      fontSize: 12)),
                                            ],
                                          )),
                                    );
                                  });
                            }
                            return const Center(
                              child: Text(
                                "Loading ...",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30.0),
                              ),
                            );
                        }
                      }),
                  FutureBuilder(
                      future: Network.getListBeritaKategori('banjir'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError)
                          return Center(child: Text("can't connect"));
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
                                      color: Colors.grey,
                                      shadowColor:
                                          Colors.black.withOpacity(0.9),
                                      child: ListTile(
                                          leading: Container(
                                            color: Colors.blue,
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    10,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    10,
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot
                                                  .data.data[index].title),
                                              Text(
                                                  snapshot.data.data[index]
                                                      .updatedAt
                                                      .toString(),
                                                  style: onBoardStyle.copyWith(
                                                      fontSize: 12)),
                                            ],
                                          )),
                                    );
                                  });
                            }
                            return const Center(
                              child: Text(
                                "Loading ...",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30.0),
                              ),
                            );
                        }
                      }),
                  FutureBuilder(
                      future: Network.getListBeritaKategori('Tanah Longsor'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError)
                          return Center(child: Text("can't connect"));
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
                                      color: Colors.grey,
                                      shadowColor:
                                          Colors.black.withOpacity(0.9),
                                      child: ListTile(
                                          leading: Container(
                                            color: Colors.blue,
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    10,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    10,
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot
                                                  .data.data[index].title),
                                              Text(
                                                  snapshot.data.data[index]
                                                      .updatedAt
                                                      .toString(),
                                                  style: onBoardStyle.copyWith(
                                                      fontSize: 12)),
                                            ],
                                          )),
                                    );
                                  });
                            }
                            return const Center(
                              child: Text(
                                "Loading ...",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30.0),
                              ),
                            );
                        }
                      }),
                  FutureBuilder(
                      future: Network.getListBeritaKategori('Gempa Bumi'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError)
                          return Center(child: Text("can't connect"));
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
                                      color: Colors.grey,
                                      shadowColor:
                                          Colors.black.withOpacity(0.9),
                                      child: ListTile(
                                          leading: Container(
                                            color: Colors.blue,
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    10,
                                            width:
                                                SizeConfig.blockSizeVertical *
                                                    10,
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot
                                                  .data.data[index].title),
                                              Text(
                                                  snapshot.data.data[index]
                                                      .updatedAt
                                                      .toString(),
                                                  style: onBoardStyle.copyWith(
                                                      fontSize: 12)),
                                            ],
                                          )),
                                    );
                                  });
                            }
                            return const Center(
                              child: Text(
                                "Loading ...",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30.0),
                              ),
                            );
                        }
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
