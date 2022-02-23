part of 'pages.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  User? user = FirebaseAuth.instance.currentUser;
  var id;
  void _getuser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    id = localStorage.getString('token').toString();
    localStorage.getInt('id');
  }

  SizeConfig sizeConfig = SizeConfig();
  bool visitToday = false;
  SharedPreferences? localStorage;
  late String todayDate;

  _checkVisit() async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    setState(() => todayDate = formatter.format(now));

    localStorage = await SharedPreferences.getInstance();

    if (todayDate == localStorage!.get('last_visit')) {
      // Jika sudah pernah berkunjung hari ini
      setState(() => visitToday = true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkVisit();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 20,
              ),
              SizedBox(
                  height: SizeConfig.blockSizeVertical * 20,
                  child: Image.asset('assets/images/logo.png')),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 7,
                width: SizeConfig.blockSizeHorizontal * 80,
                child: ElevatedButton(
                  onPressed: () async {
                    if (!visitToday) {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      localStorage.setString('last_visit', todayDate);
                      Network.visitor('0').then((response) {
                        if (response.success!) {
                          print('berhasil merekap visitor');
                        }
                      }).catchError((e) {
                        print('terjadi error saat merekap visitor : $e');
                      });
                    }
                    Map<Permission, PermissionStatus> statuses = await [
                      Permission.location,
                      Permission.camera,
                      Permission.bluetooth,
                      Permission.storage
                    ].request();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  },
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(orangeColor),
                  ),
                  child: Text(
                    'Tamu',
                    style: onBoardStyle.copyWith(
                        fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 7,
                width: SizeConfig.blockSizeHorizontal * 80,
                child: ElevatedButton(
                  onPressed: () async {
                    Map<Permission, PermissionStatus> statuses = await [
                      Permission.location,
                      Permission.camera,
                      Permission.bluetooth,
                      Permission.storage
                    ].request();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(orangeColor),
                  ),
                  child: Text(
                    'Masuk',
                    style: onBoardStyle.copyWith(
                        fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ])));
  }
}
