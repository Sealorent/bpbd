part of 'pages.dart';

class Berita extends StatefulWidget {
  const Berita({Key? key}) : super(key: key);

  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 70,
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
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 4),
                child: TextField(
                    readOnly: true,
                    onTap: () {
                      // _handlePressButton();
                    },
                    enabled: true,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Cari Daerah',
                        // contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none),
                    onChanged: (value) {}),
              ),
            ),
          ),
          TabBar(
              controller: _tabController,
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.transparent,
              labelColor: orangeColor,
              // overlayColor: MaterialStateProperty(),
              tabs: [
                Tab(
                  child: Text(
                    'Terbaru',
                    style: defaultStyle.copyWith(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Banjir',
                    style: defaultStyle.copyWith(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Gempa Bumi',
                    style: defaultStyle.copyWith(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Tanah Longsor',
                    style: defaultStyle.copyWith(fontSize: 18),
                  ),
                ),
              ]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
