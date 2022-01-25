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
                // height: SizeConfig.blockSizeHorizontal * 18,
                width: SizeConfig.blockSizeVertical * 8,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BPBD',
                    style: onBoardStyle.copyWith(fontSize: 18),
                  ),
                  Text(
                    'BONDOWOSO',
                    style: onBoardStyle.copyWith(fontSize: 18),
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
                fontWeight: FontWeight.w200,fontSize: 12, color: const Color(0xFF1F1F1F).withOpacity(0.8)),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Text(
            'Nama Lengkap',
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
                hintText: 'Masukkan Nama Lengkap',
                suffixIcon: const Icon(
                  Icons.person_outline,
                ),
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
            height: SizeConfig.blockSizeVertical * 3,
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
                suffixIcon: const Icon(
                  Icons.email_outlined,
                ),
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
            height: SizeConfig.blockSizeVertical * 3,
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
                suffixIcon: const Icon(
                  Icons.lock_outlined,
                ),
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
            height: SizeConfig.blockSizeVertical * 4,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 7,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: orangeColor))),
                  backgroundColor: MaterialStateProperty.all(orangeColor),
                ),
                child: Text(
                  'Daftar',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sudah Punya Akun ?',
                style: onBoardStyle.copyWith(
                    fontSize: 14, color: const Color(0xFF444444).withOpacity(0.7)),
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
