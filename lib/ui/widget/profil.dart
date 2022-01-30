part of '../pages/pages.dart';

class InformasiAkun extends StatefulWidget {
  const InformasiAkun({Key? key}) : super(key: key);

  @override
  _InformasiAkunState createState() => _InformasiAkunState();
}

class _InformasiAkunState extends State<InformasiAkun> {
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      height: SizeConfig.blockSizeVertical * 100,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
        ),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bantuan',
                style: onBoardStyle.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 18,
                      right: SizeConfig.blockSizeHorizontal * 5),
                  child: Divider(
                    // height: SizeConfig.blockSizeVertical * 15,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Laporkan()));
                  },
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Laporkan Bencana',
                            style: onBoardStyle.copyWith(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: orangeColor,
                  ),
                  leading: SvgPicture.asset('assets/icons/chat.svg',
                      height: 30, width: 30),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 18,
                      right: SizeConfig.blockSizeHorizontal * 5),
                  child: Divider(
                    // height: SizeConfig.blockSizeVertical * 15,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Berita()));
                  },
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Berita Terbaru',
                            style: onBoardStyle.copyWith(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: orangeColor,
                  ),
                  leading: SvgPicture.asset('assets/icons/berita.svg',
                      height: 30, width: 30),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 18,
                      right: SizeConfig.blockSizeHorizontal * 5),
                  child: Divider(
                    // height: SizeConfig.blockSizeVertical * 15,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mitigasi()));
                  },
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mitigasi Bencana',
                            style: onBoardStyle.copyWith(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: orangeColor,
                  ),
                  leading: Icon(
                    Icons.priority_high_rounded,
                    color: orangeColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Lainnya',
                style: onBoardStyle.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 5,
                      left: SizeConfig.blockSizeHorizontal * 18,
                      right: SizeConfig.blockSizeHorizontal * 5),
                  child: Divider(
                    // height: SizeConfig.blockSizeVertical * 15,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Tentang()));
                  },
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tentang Aplikasi',
                            style: onBoardStyle.copyWith(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: orangeColor,
                  ),
                  leading: Icon(
                    Icons.error_outline_outlined,
                    color: orangeColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.red,
              ),
              title: Text(
                'Keluar Akun',
                style: onBoardStyle.copyWith(color: Colors.red, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
