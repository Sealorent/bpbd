part of '../pages/pages.dart';

class PilihanMenu extends StatefulWidget {
  const PilihanMenu({Key? key}) : super(key: key);

  @override
  _PilihanMenuState createState() => _PilihanMenuState();
}

class _PilihanMenuState extends State<PilihanMenu> {
  User? user = FirebaseAuth.instance.currentUser;
  SizeConfig sizeConfig = SizeConfig();
  var _id;
  String? _token;

  _getuser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    _id = localStorage.getInt('id');
    var token = localStorage.getString('token');
    if (token != null) {
      print('token : $token');
      setState(() => _token = token);
      return _id;
    }
    // if (token == null) {
    //   Fluttertoast.showToast(
    //       msg: "Anda Masuk Sebagai tamu",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.CENTER,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 12.0);
    // } else {
    //   print('token : $token');
    //   setState(() => _token = token);
    //   return _id;
    // }
  }

  @override
  void initState() {
    super.initState();
    _getuser();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ListView(
      children: [
        Container(
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
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataTahunan()));
                      },
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Data Tahunan ',
                                style: onBoardStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
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
                                builder: (context) => const Kontak()));
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
                _token != null || user != null
                    ? ListTile(
                        onTap: () {
                          _exitPage();
                        },
                        leading: const Icon(
                          Icons.exit_to_app,
                          size: 30,
                          color: Colors.red,
                        ),
                        title: Text(
                          'Keluar Akun',
                          style: onBoardStyle.copyWith(
                              color: Colors.red, fontSize: 18),
                        ),
                      )
                    : ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        leading: const Icon(
                          Icons.exit_to_app,
                          size: 30,
                          color: Colors.green,
                        ),
                        title: Text(
                          'Masuk',
                          style: onBoardStyle.copyWith(
                              color: Colors.green, fontSize: 18),
                        ),
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void logoutUser() async {
    try {
      FirebaseService service = FirebaseService();
      service.signOutFromGoogle();
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.clear();
      Navigator.pushReplacement(
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

  void _exitPage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              'Apakah anda yakin ingin keluar ?',
              style: onBoardStyle,
            )),
            // content: Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    logoutUser();
                  },
                  child: Text('Iya',
                      style: onBoardStyle.copyWith(color: orangeColor))),
              TextButton(
                onPressed: () {
                  // _dismissDialog();
                  Navigator.pop(context);
                },
                child: Text('Tidak',
                    style: onBoardStyle.copyWith(color: orangeColor)),
              )
            ],
          );
        });
  }
}
