part of 'pages.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  SizeConfig sizeConfig = SizeConfig();
  int index = 0;
  Color enableColor = Colors.white;
  Color disableColor = Colors.transparent;
  Color enableIconColor = orangeColor;

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                style: ElevatedButton.styleFrom(
                  primary: index == 0 ? enableColor : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/menu-boxed.svg',
                      height: 29,
                      color: index == 0 ? enableIconColor : Colors.black,
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 1,
                    ),
                    Text(
                      'Menu',
                      style: onBoardStyle.copyWith(
                        fontSize: 20,
                        color: index == 0 ? enableIconColor : Colors.black,
                      ),
                    ),
                  ],
                )),
            TextButton(
                style: TextButton.styleFrom(
                  primary: index == 1 ? enableColor : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/home.svg',
                    ),
                    Text(
                      'Beranda',
                      style: onBoardStyle.copyWith(fontSize: 18),
                    ),
                  ],
                )),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: index == 2 ? enableColor : disableColor),
                onPressed: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/menu-boxed.svg'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Menu',
                        style: onBoardStyle.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
