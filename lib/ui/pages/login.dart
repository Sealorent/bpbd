part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            height: SizeConfig.blockSizeVertical * 5,
          ),
          Center(
              child: Image.asset(
            'assets/images/logo.png',
            // height: SizeConfig.safeBlockVertical * ,
            width: SizeConfig.safeBlockVertical * 14,
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 80,
            child: Divider(
              color: orangeColor,
              thickness: 2,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Text(
            'Masuk Akun',
            style: onBoardStyle.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 1,
          ),
          Text(
            'Masuk Terlebih Dahulu Untuk Mendapatkan Informasi',
            style: onBoardStyle.copyWith(
                fontWeight: FontWeight.w200, fontSize: 12, color: const Color(0xFF1F1F1F).withOpacity(0.8)),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Text(
            'Email',
            style: onBoardStyle.copyWith(
                fontWeight: FontWeight.w400,
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
                suffixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
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
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Text(
            'Password',
            style: onBoardStyle.copyWith(
                fontWeight: FontWeight.w400,
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
                suffixIcon: const Icon(Icons.lock_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide())),
            keyboardType: TextInputType.text,
            obscureText: true,
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
            height: SizeConfig.blockSizeVertical * 5,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 7,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: orangeColor))),
                  backgroundColor: MaterialStateProperty.all(orangeColor),
                ),
                child: Text(
                  'Masuk',
                  style: onBoardStyle.copyWith(fontSize: 18),
                )),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Center(
            child: Text(
              'Atau dengan',
              style: onBoardStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xFF444444).withOpacity(0.7)),
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
                          borderRadius: BorderRadius.circular(12.0),
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
                      width: SizeConfig.blockSizeHorizontal * 6,
                    ),
                    Text(
                      'Lanjutkan melalui Google',
                      style: onBoardStyle.copyWith(fontSize: 16),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeHorizontal * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tidak Punya Akun ?',
                  style: onBoardStyle.copyWith(
                      fontSize: 14, color: const Color(0xFF444444).withOpacity(0.7)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarPage()));
                  },
                  child: Text(
                    'Daftar',
                    style:
                        onBoardStyle.copyWith(fontSize: 14, color: orangeColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
