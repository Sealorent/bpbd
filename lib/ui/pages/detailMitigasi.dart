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
                            RawMaterialButton(
                                onPressed: () {},
                                fillColor: orangeColor,
                                shape: const CircleBorder(),
                                child: Image.network(
                                  'https://bpbdbondowoso.com/bpbd-admin/public/upload/kategori/$icon',
                                  height: 80,
                                  width: 80,
                                )),
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(50)),
                            //   child: Image.network(
                            //     'https://bpbdbondowoso.com/bpbd-admin/public/upload/kategori/$icon',
                            //     color: orangeColor,
                            //     fit: BoxFit.scaleDown,
                            //   ),
                            // ),
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
                            Html(
                              data: snapshot.data.data[index].mitigasi,
                              style: {"p": Style(textAlign: TextAlign.justify)},
                            ),
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
