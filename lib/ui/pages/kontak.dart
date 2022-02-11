part of 'pages.dart';

class Kontak extends StatelessWidget {
  const Kontak({Key? key}) : super(key: key);

  void _launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kontak",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
      ),
      body: Container(
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
                  'Kontak',
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
                      _launchURL('https://wa.me/6281331988998');
                    },
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('WhatsApp',
                              style: onBoardStyle.copyWith(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.whatsapp,
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
                      _launchURL('https://www.facebook.com/bpbdkabbondowoso');
                    },
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Facebook',
                              style: onBoardStyle.copyWith(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.facebook,
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
                      _launchURL('https://www.instagram.com/bpbdbondowoso/');
                    },
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Instagram',
                              style: onBoardStyle.copyWith(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.instagram,
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
                      _launchURL('https://twitter.com/BondowosoBpbd');
                    },
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Twitter',
                              style: onBoardStyle.copyWith(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.twitter,
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
                      _launchURL(
                          'https://www.youtube.com/channel/UCwpF9IRdJuDwJD9iNYTrd5A');
                    },
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Youtube',
                              style: onBoardStyle.copyWith(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.youtube,
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
                      _launchURL('https://bpbd.bondowosokab.go.id/');
                    },
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Website',
                              style: onBoardStyle.copyWith(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    leading: Icon(
                      Icons.language,
                      color: orangeColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
