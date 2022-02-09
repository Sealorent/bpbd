part of '../pages/pages.dart';

class PilihanMenu extends StatefulWidget {
  const PilihanMenu({Key? key}) : super(key: key);

  @override
  _PilihanMenuState createState() => _PilihanMenuState();
}

class _PilihanMenuState extends State<PilihanMenu> {
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
                  child: const Divider(
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
                  child: const Divider(
                    // height: SizeConfig.blockSizeVertical * 15,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BeritaPage()));
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
                  leading: FaIcon(
                    FontAwesomeIcons.newspaper,
                    color: orangeColor,
                    size: 30,
                  ),
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
                  child: const Divider(
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
                    Icons.verified_user,
                    color: orangeColor,
                    size: 30,
                  ),
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
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RawanBencanaPage()));
                  },
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Peta Rawan Bencana',
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
                    Icons.vpn_lock,
                    color: orangeColor,
                    size: 30,
                  ),
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
                  child: const Divider(
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
                        Text('Kejadian Bencana',
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
                    Icons.filter_hdr,
                    color: orangeColor,
                    size: 30,
                  ),
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
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMitigasi()));
                  },
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('IKD (Indeks Ketahanan Daerah)',
                            style: onBoardStyle.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: orangeColor,
                  ),
                  leading: Icon(
                    Icons.insert_chart,
                    color: orangeColor,
                    size: 30,
                  ),
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
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMitigasi()));
                  },
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kontak',
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
                    Icons.contacts,
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
                  child: const Divider(
                    thickness: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailMitigasi()));
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
              onTap: () {
                logoutUser();
              },
              leading: const Icon(
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

  void logoutUser() async {
    FirebaseService service = FirebaseService();
    try {
      service.signOutFromGoogle();
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (e) {
      if (e is FirebaseAuthException) {
        showMessage(e.message!);
      }
    }
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
