part of 'pages.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  SizeConfig sizeConfig = SizeConfig();
  User? user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  var name, email, password, noTelp;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  late int isGoogle = user != null ? 1 : 0;

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 8),
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 6,
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
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                  color: const Color(0xFF1F1F1F).withOpacity(0.8)),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Divider(
              thickness: 2,
              color: orangeColor,
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
                validator: (namaValue) {
                  if (namaValue!.isEmpty) {
                    // user != null ? user!.displayName! : null;
                    return 'masukkan nama';
                  }
                  name = namaValue;
                  return null;
                }),
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
                validator: (emailValue) {
                  if (emailValue!.isEmpty) {
                    return 'Please enter your email';
                  }
                  email = emailValue;
                  return null;
                }),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Text(
              'Nomor Telepon',
              style: onBoardStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: const Color(0xFF444444)),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            TextFormField(
                decoration: InputDecoration(
                    hintText: 'Masukkan no Telepon',
                    suffixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide())),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (hpValue) {
                  if (hpValue!.isEmpty) {
                    return 'Please enter your no telp';
                  }
                  noTelp = hpValue;
                  return null;
                }),
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
              height: SizeConfig.blockSizeVertical * 3,
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
                validator: (passwordValue) {
                  if (passwordValue!.isEmpty) {
                    return 'Please enter your password';
                  }
                  password = passwordValue;
                  return null;
                }),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 4,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 7,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _register();
                    }
                  },
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
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah Punya Akun ?',
                  style: onBoardStyle.copyWith(
                      fontSize: 14,
                      color: const Color(0xFF444444).withOpacity(0.7)),
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
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'name': name,
      'email': email,
      'password': password,
      'no_hp': noTelp,
      'is_google': isGoogle
    };

    var res = await Network().auth(data, 'auth/register');
    var body = json.decode(res.body);
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      if (body['message']['name'] != null) {
        _showMsg(body['message']['name'][0].toString());
      } else if (body['message']['email'] != null) {
        _showMsg(body['message']['email'][0].toString());
      } else if (body['message']['password'] != null) {
        _showMsg(body['message']['password'][0].toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
