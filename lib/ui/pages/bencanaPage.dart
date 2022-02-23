part of 'pages.dart';

class BencanaPage extends StatefulWidget {
  const BencanaPage({Key? key}) : super(key: key);

  @override
  State<BencanaPage> createState() => _BencanaPageState();
}

class _BencanaPageState extends State<BencanaPage> {
  ReceivePort _port = ReceivePort();
  bool _isDownloading = false;
  double _downloadProgress = 0.0;

  Future download(String url) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      // await FlutterDownloader.enqueue(
      //   url: url,
      //   savedDir: baseStorage!.path,
      //   showNotification:
      //       true, // show download progress in status bar (for Android)
      //   openFileFromNotification:
      //       true, // click on notification to open downloaded file (for Android)
      // );
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );

      FlutterDownloader.open(taskId: taskId!);
    }
  }

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      if (status == DownloadTaskStatus.complete) {
        print('Download Complete');
        // setState(() {
        //   _isDownloading = false;
        //   _downloadProgress = 0.0;
        // });
      }
      if (status == DownloadTaskStatus.canceled) {
        print('Download Canceled');
        // setState(() {
        //   _isDownloading = false;
        //   _downloadProgress = 0.0;
        // });
      }
      if (status == DownloadTaskStatus.enqueued) {
        print('Download Enqueued');
        // setState(() {
        //   _isDownloading = true;
        // });
      }
      if (status == DownloadTaskStatus.failed) {
        print('Download Failed');
        FlutterDownloader.retry(taskId: id);
        // setState(() {
        //   _isDownloading = false;
        //   _downloadProgress = 0.0;
        // });
      }
      if (status == DownloadTaskStatus.paused) {
        print('Download Paused');
        FlutterDownloader.retry(taskId: id);
      }
      if (status == DownloadTaskStatus.running) {
        print('Download Running');
        // setState(() {
        //   _isDownloading = true;
        // });
      }
      if (status == DownloadTaskStatus.undefined) {
        print('Download Undefined');
        // setState(() {
        //   _isDownloading = false;
        //   _downloadProgress = 0.0;
        // });
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
    // var s = d;
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kejadian Bencana",
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
                    title: Text('Kejadian Bencana',
                        style: onBoardStyle.copyWith(
                            color: Colors.white, fontSize: 18)),
                    subtitle: Text('2021',
                        style: onBoardStyle.copyWith(
                            color: Colors.white, fontSize: 18)),
                    trailing: !_isDownloading
                        ? InkWell(
                            onTap: () async {
                              download(
                                  'https://bpbd.bsorumahinspirasi.com/public/upload/kategori/21-09-598JvJFPETA%20KRB%20GERAKAN%20TANAH%20BONDOWOSO.png');
                            },
                            child: const Icon(
                              Icons.file_download,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        : CircularProgressIndicator(
                            value: _downloadProgress,
                            backgroundColor: Colors.white,
                            color: Colors.red,
                          ))),
          ],
        ),
      ),
    );
  }
}
