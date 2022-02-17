part of 'pages.dart';

class IKDPages extends StatefulWidget {
  IKDPages({Key? key}) : super(key: key);

  @override
  _IKDPagesState createState() => _IKDPagesState();
}

class _IKDPagesState extends State<IKDPages> {
  // Downloader? download;
  final imgUrl =
      "https://doc-0k-98-docs.googleusercontent.com/docs/securesc/jbb3cnd9go32utajqkg8v35a0mem8aav/0grvug2f60gghgnf56brmpgcu42b1ooi/1644952350000/04901838282526145756/06996246946561189336/1cFqMOuuEWHNitakrHPog_hpJDs0ABlNk?e=download&authuser=0";

  var dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Indeks Ketahanan Daerah",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              shadowColor: Colors.grey,
              elevation: 3,
              color: orangeColor,
              child: ListTile(
                  onTap: () {},
                  title: Text('Indeks Ketahanan Daerah',
                      style: onBoardStyle.copyWith(
                          color: Colors.white, fontSize: 18)),
                  subtitle: Text('2021',
                      style: onBoardStyle.copyWith(
                          color: Colors.white, fontSize: 18)),
                  trailing: InkWell(
                    onTap: () async {
                      // String path =
                      //     await ExtStorage.getExternalStoragePublicDirectory(
                      //         ExtStorage.DIRECTORY_DOWNLOADS);

                      // String fullPath = "$path/IKD.pdf";
                    },
                    child: const Icon(
                      Icons.file_download,
                      color: Colors.white,
                      size: 30,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getPermission();
  }

  void getPermission() async {
    await Permission.storage.request();
  }

  Future download2(Dio dio, String url, String savePath) async {
    //get pdf from link
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );

      //write in download folder
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print("error is");
      print(e);
    }
//progress bar
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
}
