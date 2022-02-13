part of 'pages.dart';

class DetailMitigasi extends StatelessWidget {
  final id, name, icon, mitigasi;
  DetailMitigasi({Key? key, this.id, this.name, this.icon, this.mitigasi})
      : super(key: key);

  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Mitigasi " + '$name',
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
    return FutureBuilder(
        future: Network.getListKategoriId(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) return Text('Error');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Column(
                          children: [
                            Image.network(
                              'http://192.168.1.2:8000/upload/kategori/' +
                                  '$icon',
                              height: 200,
                              width: 200,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data.data[index].name,
                                      style: onBoardStyle.copyWith(
                                          color: orangeColor, fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Html(data: snapshot.data.data[index].mitigasi),
                          ],
                        ),
                      );
                    });
              }
          }
          return Container();
        });
  }
}
