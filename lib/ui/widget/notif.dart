part of '../pages/pages.dart';

class Terbaru extends StatefulWidget {
  const Terbaru({Key? key}) : super(key: key);

  @override
  _TerbaruState createState() => _TerbaruState();
}

class _TerbaruState extends State<Terbaru> {
  SizeConfig sizeConfig = SizeConfig();
  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return ListView(
      children: [
        Card(
          color: Colors.white,
          child: Stack(
            children: [
              ListTile(
                minVerticalPadding: 20,
                // dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                minLeadingWidth: 40, horizontalTitleGap: 40,
                leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    // shape: const CircleBorder(),
                    child: Image.asset(
                      'assets/icons/gempa.png',
                      height: 18,
                      width: 18,
                    )),

                isThreeLine: true,
                visualDensity: VisualDensity.compact,
                title: RichText(
                    text: TextSpan(
                        style: onBoardStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey),
                        children: const [
                      TextSpan(text: 'Tanggal' + (' ') + '12/04/2021'),
                      TextSpan(text: ' - ' + ('Pukul : ') + '13:22:11')
                    ])),
                subtitle: Text(
                  'Desa Sekar Putih - Kec.Tegal Ampel',
                  style: onBoardStyle.copyWith(fontSize: 18),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 23,
                child: Text(
                  'Banjir',
                  style: onBoardStyle.copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        ),
        Card(
          color: Colors.white,
          child: Stack(
            children: [
              ListTile(
                minVerticalPadding: 20,
                // dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                minLeadingWidth: 40, horizontalTitleGap: 40,
                leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    // shape: const CircleBorder(),
                    child: Image.asset(
                      'assets/icons/gempa.png',
                      height: 18,
                      width: 18,
                    )),

                isThreeLine: true,
                visualDensity: VisualDensity.compact,
                title: RichText(
                    text: TextSpan(
                        style: onBoardStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey),
                        children: const [
                      TextSpan(text: 'Tanggal' + (' ') + '12/04/2021'),
                      TextSpan(text: ' - ' + ('Pukul : ') + '13:22:11')
                    ])),
                subtitle: Text(
                  'Desa Sekar Putih - Kec.Tegal Ampel',
                  style: onBoardStyle.copyWith(fontSize: 18),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 23,
                child: Text(
                  'Banjir',
                  style: onBoardStyle.copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        ),
        Card(
          color: Colors.white,
          child: Stack(
            children: [
              ListTile(
                minVerticalPadding: 20,
                // dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                minLeadingWidth: 40, horizontalTitleGap: 40,
                leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    // shape: const CircleBorder(),
                    child: Image.asset(
                      'assets/icons/gempa.png',
                      height: 18,
                      width: 18,
                    )),

                isThreeLine: true,
                visualDensity: VisualDensity.compact,
                title: RichText(
                    text: TextSpan(
                        style: onBoardStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey),
                        children: const [
                      TextSpan(text: 'Tanggal' + (' ') + '12/04/2021'),
                      TextSpan(text: ' - ' + ('Pukul : ') + '13:22:11')
                    ])),
                subtitle: Text(
                  'Desa Sekar Putih - Kec.Tegal Ampel',
                  style: onBoardStyle.copyWith(fontSize: 18),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 23,
                child: Text(
                  'Banjir',
                  style: onBoardStyle.copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        ),
        Card(
          color: Colors.white,
          child: Stack(
            children: [
              ListTile(
                minVerticalPadding: 20,
                // dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                minLeadingWidth: 40, horizontalTitleGap: 40,
                leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    // shape: const CircleBorder(),
                    child: Image.asset(
                      'assets/icons/gempa.png',
                      height: 18,
                      width: 18,
                    )),

                isThreeLine: true,
                visualDensity: VisualDensity.compact,
                title: RichText(
                    text: TextSpan(
                        style: onBoardStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey),
                        children: const [
                      TextSpan(text: 'Tanggal' + (' ') + '12/04/2021'),
                      TextSpan(text: ' - ' + ('Pukul : ') + '13:22:11')
                    ])),
                subtitle: Text(
                  'Desa Sekar Putih - Kec.Tegal Ampel',
                  style: onBoardStyle.copyWith(fontSize: 18),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 23,
                child: Text(
                  'Banjir',
                  style: onBoardStyle.copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        ),
        Card(
          color: Colors.white,
          child: Stack(
            children: [
              ListTile(
                minVerticalPadding: 20,
                // dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                minLeadingWidth: 40, horizontalTitleGap: 40,
                leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    // shape: const CircleBorder(),
                    child: Image.asset(
                      'assets/icons/gempa.png',
                      height: 18,
                      width: 18,
                    )),

                isThreeLine: true,
                visualDensity: VisualDensity.compact,
                title: RichText(
                    text: TextSpan(
                        style: onBoardStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey),
                        children: const [
                      TextSpan(text: 'Tanggal' + (' ') + '12/04/2021'),
                      TextSpan(text: ' - ' + ('Pukul : ') + '13:22:11')
                    ])),
                subtitle: Text(
                  'Desa Sekar Putih - Kec.Tegal Ampel',
                  style: onBoardStyle.copyWith(fontSize: 18),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 23,
                child: Text(
                  'Banjir',
                  style: onBoardStyle.copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        ),
        Card(
          color: Colors.white,
          child: Stack(
            children: [
              ListTile(
                minVerticalPadding: 20,
                // dense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                minLeadingWidth: 40, horizontalTitleGap: 40,
                leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    // shape: const CircleBorder(),
                    child: Image.asset(
                      'assets/icons/gempa.png',
                      height: 18,
                      width: 18,
                    )),

                isThreeLine: true,
                visualDensity: VisualDensity.compact,
                title: RichText(
                    text: TextSpan(
                        style: onBoardStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey),
                        children: const [
                      TextSpan(text: 'Tanggal' + (' ') + '12/04/2021'),
                      TextSpan(text: ' - ' + ('Pukul : ') + '13:22:11')
                    ])),
                subtitle: Text(
                  'Desa Sekar Putih - Kec.Tegal Ampel',
                  style: onBoardStyle.copyWith(fontSize: 18),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 23,
                child: Text(
                  'Banjir',
                  style: onBoardStyle.copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
