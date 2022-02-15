part of 'pages.dart';

class IKDPages extends StatefulWidget {
  IKDPages({Key? key}) : super(key: key);

  @override
  State<IKDPages> createState() => _IKDPagesState();
}

class _IKDPagesState extends State<IKDPages> {
  Downloader? download;

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
                  trailing: const Icon(
                    Icons.file_download,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
