part of 'pages.dart';

class RawanBencanaPage extends StatefulWidget {
  RawanBencanaPage({Key? key}) : super(key: key);

  @override
  State<RawanBencanaPage> createState() => _RawanBencanaPageState();
}

class _RawanBencanaPageState extends State<RawanBencanaPage>
    with TickerProviderStateMixin {
  SizeConfig sizeConfig = SizeConfig();

  ReceivePort _port = ReceivePort();

  // Future download(String url) async {
  //   var status = await Permission.storage.request();
  //   if (status.isGranted) {
  //     final baseStorage = await getExternalStorageDirectory();
  //     final taskId = await FlutterDownloader.enqueue(
  //       url: url,
  //       savedDir: baseStorage!.path,
  //       // headers: {"auth": "test_for_sql_encoding"},
  //       saveInPublicStorage: true,
  //       requiresStorageNotLow: true,
  //       showNotification:
  //           true, // show download progress in status bar (for Android)
  //       openFileFromNotification:
  //           true, // click on notification to open downloaded file (for Android)
  //     );

  //     FlutterDownloader.open(taskId: taskId!);
  //   }
  // }

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState() {
    // IsolateNameServer.registerPortWithName(
    //     _port.sendPort, 'downloader_send_port');
    // _port.listen((dynamic data) {
    //   String id = data[0];
    //   DownloadTaskStatus status = data[1];
    //   int progress = data[2];

    //   if (status == DownloadTaskStatus.complete) {
    //     print('Download Complete');
    //   }
    //   if (status == DownloadTaskStatus.failed) {
    //     FlutterDownloader.retry(taskId: id);
    //   }
    //   setState(() {});
    // });

    // FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([id, status, progress]);
  // }

  // double progress = 0;

  // // Track if the PDF was downloaded here.
  // bool didDownloadPDF = false;

  // // Show the progress status to the user.
  // String progressString = 'File has not been downloaded yet.';

  // Future download(Dio dio, String url, String savePath) async {
  //   try {
  //     Response response = await dio.download(
  //       url,
  //       savePath,
  //       onReceiveProgress: updateProgress,
  //       options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }),
  //     );
  //     var file = File(savePath).openSync(mode: FileMode.write);
  //     file.writeFromSync(response.data);
  //     await file.close();

  //     // Here, you're catching an error and printing it. For production
  //     // apps, you should display the warning to the user and give them a
  //     // way to restart the download.
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void updateProgress(done, total) {
  //   progress = done / total;
  //   setState(() {
  //     if (progress >= 1) {
  //       progressString =
  //           '✅ File has finished downloading. Try opening the file.';
  //       didDownloadPDF = true;
  //     } else {
  //       progressString = 'Download progress: ' +
  //           (progress * 100).toStringAsFixed(0) +
  //           '% done.';
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Peta Rawan Bencana",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: SizedBox(
        height: SizeConfig.blockSizeVertical * 100,
        child: FutureBuilder(
            future: Network.getListKategori(),
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
                            shadowColor: Colors.grey,
                            elevation: 3,
                            color: orangeColor,
                            child: ListTile(
                              onTap: () async {
                                await showDialog(
                                    context: context,
                                    builder: (_) => dialog(
                                        snapshot.data.data[index].photos));
                              },
                              title: Text(
                                  snapshot.data.data[index].name.toString(),
                                  style: onBoardStyle.copyWith(
                                      color: Colors.white, fontSize: 18)),
                              trailing: IconButton(
                                  onPressed: () {
                                    _launchURL(
                                        'https://bpbd.bsorumahinspirasi.com/public/upload/kategori/' +
                                            snapshot.data.data[index].photos);
                                  },
                                  icon: const Icon(Icons.file_download),
                                  color: Colors.white),
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
              }
            }),
      ),
    );
  }

  Dialog dialog(String img) {
    return Dialog(
      child: SizedBox(
        width: SizeConfig.blockSizeHorizontal * 80,
        height: SizeConfig.blockSizeVertical * 35,
        child: Center(
          child: Image.network(
            'https://bpbd.bsorumahinspirasi.com/public/upload/kategori/$img',
            fit: BoxFit.fitWidth,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          // Text(
          //   progressString,
          // ),
        ),
      ),
    );
  }
}
