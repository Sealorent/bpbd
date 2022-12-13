part of 'pages.dart';

class DataTahunan extends StatefulWidget {
  DataTahunan({Key? key}) : super(key: key);

  @override
  _DataTahunanState createState() => _DataTahunanState();
}

class _DataTahunanState extends State<DataTahunan> {
  // Laporan? laporan;

  var _token;
  Download? download;

  ReceivePort _port = ReceivePort();

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  // Future downloadPdf(String url) async {
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
    _getuser();
    _initLaporan();
    super.initState();
  }

  _getuser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      print('token : $token');
      setState(() => _token = token);
    }
  }

  _initLaporan() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    _token = jsonDecode((localStorage.getString('token')).toString());
    if (_token == null) {
      Fluttertoast.showToast(
          msg: "Harap masuk menggunakan akun yang sudah terdaftar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    } else {
      Network.getPdf(_token).then((response) {
        setState(() {
          download = response;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    // _getuser();
    print("tok : $_token");
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Data Tahunan",
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.white,
        ),
        body: ListView(
          children: [
            for (var item in download!.data!)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 3,
                  color: orangeColor,
                  child: ListTile(
                      title: Text(item.title.toString(),
                          style: onBoardStyle.copyWith(color: Colors.white)),
                      trailing: IconButton(
                          onPressed: () {
                            _launchURL(
                                'https://bpbdbondowoso.com/bpbd-admin/public/upload/pdf/' +
                                    item.pdf.toString());
                          },
                          icon: const Icon(Icons.file_download),
                          color: Colors.white)),
                ),
              )
          ],
        ));
  }
}
