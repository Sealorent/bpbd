part of 'pages.dart';

class BeritaDetailPage extends StatelessWidget {
  // const BeritaDetailPage({Key? key, this.title, this.content, this.publishedAt})
  //     : super(key: key);
  final title, content, publishedAt;

  // final title, content, publishedAt;
  BeritaDetailPage({Key? key, this.title, this.content, this.publishedAt})
      : super(key: key);
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          color: Colors.white,
          child: Column(
            children: [
              Text(
                '$title',
                style: onBoardStyle.copyWith(fontSize: 20),
              ),
              Text('$title'),
              Text('$title'),
            ],
          ),
        ),
      ),
    );
  }
}
