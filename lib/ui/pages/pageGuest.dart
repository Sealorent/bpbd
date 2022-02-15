part of 'pages.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
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
                  style:
                      onBoardStyle.copyWith(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
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
                  style:
                      onBoardStyle.copyWith(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
