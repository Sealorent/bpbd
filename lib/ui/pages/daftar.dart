part of 'pages.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  SizeConfig sizeConfig = SizeConfig();

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 8),
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/logobpbd.png',
                height: SizeConfig.blockSizeHorizontal * 16,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BPBD',
                    style: onBoardStyle.copyWith(fontSize: 20),
                  ),
                  Text(
                    'BONDOWOSO',
                    style: onBoardStyle.copyWith(fontSize: 20),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Divider(
            thickness: 2,
            color: orangeColor,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1,
          ),
          Text(
            'Daftar Akun',
            style: onBoardStyle.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1,
          ),
          Text(
            'Daftarkan Identitas Anda Terlebih Dahulu',
            style: onBoardStyle.copyWith(
                fontWeight: FontWeight.w200, color: const Color(0xFF858585)),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 3,
          ),
          Text(
            'Nama Lengkap',
            style: onBoardStyle.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 18,
                color: const Color(0xFF444444)),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          TextFormField(
            // controller: usernameController,
            decoration: InputDecoration(
                hintText: 'Masukkan Nama Lengkap',
                suffixIcon: const Icon(
                  Icons.person_outline,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide())),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            // focusNode: userFocus,

            onFieldSubmitted: (_) {
              // FocusScope.of(context).requestFocus(passFocus);
            },
            // validator: (value) => emptyValidation(value),
            // decoration: CommonStyle.textFieldStyle(
            //     labelTextStr: "Username", hintTextStr: "Enter Username"),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 3,
          ),
          Text(
            'Email',
            style: onBoardStyle.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 18,
                color: const Color(0xFF444444)),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          TextFormField(
            // controller: usernameController,
            decoration: InputDecoration(
                hintText: 'Masukkan Email',
                suffixIcon: const Icon(
                  Icons.email_outlined,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide())),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            // focusNode: userFocus,

            onFieldSubmitted: (_) {
              // FocusScope.of(context).requestFocus(passFocus);
            },
            // validator: (value) => emptyValidation(value),
            // decoration: CommonStyle.textFieldStyle(
            //     labelTextStr: "Username", hintTextStr: "Enter Username"),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 3,
          ),
          Text(
            'Password',
            style: onBoardStyle.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 18,
                color: const Color(0xFF444444)),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          TextFormField(
            // controller: usernameController,
            decoration: InputDecoration(
                hintText: 'Masukkan Password',
                suffixIcon: const Icon(
                  Icons.lock,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide())),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            // focusNode: userFocus,

            onFieldSubmitted: (_) {
              // FocusScope.of(context).requestFocus(passFocus);
            },
            // validator: (value) => emptyValidation(value),
            // decoration: CommonStyle.textFieldStyle(
            //     labelTextStr: "Username", hintTextStr: "Enter Username"),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 7,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: orangeColor))),
                  backgroundColor: MaterialStateProperty.all(orangeColor),
                ),
                child: Text(
                  'Masuk',
                  style: onBoardStyle.copyWith(fontSize: 20),
                )),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Center(
            child: Text(
              'Atau dengan',
              style: onBoardStyle.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                  color: const Color(0xFFACA9A9)),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 7,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.white))),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Google.svg',
                      height: SizeConfig.blockSizeVertical * 4,
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 2,
                    ),
                    Text(
                      'Lanjutkan melalui Google',
                      style: onBoardStyle.copyWith(fontSize: 18),
                    ),
                  ],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sudah Punya Akun ?',
                style: onBoardStyle.copyWith(
                    fontSize: 14, color: const Color(0xFFACA9A9)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Text(
                  'Masuk',
                  style:
                      onBoardStyle.copyWith(fontSize: 14, color: orangeColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
