part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  SizeConfig sizeConfig = SizeConfig();
  User? user = FirebaseAuth.instance.currentUser;
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

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    _scaffoldKey.currentState!.showSnackBar(snackBar);
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
    return user != null
        ? const MainPage()
        : Scaffold(
            key: _scaffoldKey,
            body: Form(
              key: _formKey,
              child: ListView(
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
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: const Color(0xFF1F1F1F).withOpacity(0.8)),
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

                      // onFieldSubmitted: (_) {
                      //   // FocusScope.of(context).requestFocus(passFocus);
                      // },
                      validator: (emailValue) {
                        if (emailValue!.isEmpty) {
                          return 'Please enter your email';
                        }
                        email = emailValue;
                        return null;
                      }
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
                      decoration: InputDecoration(
                          hintText: 'Masukkan Password',
                          suffixIcon: const Icon(Icons.lock_outlined),
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
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 7,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _login();
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(color: orangeColor))),
                          backgroundColor:
                              MaterialStateProperty.all(orangeColor),
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
                        onPressed: () async {
                          FirebaseService service = FirebaseService();
                          try {
                            await service.signInwithGoogle();
                            if (!visitToday) {
                              localStorage!.setString('last_visit', todayDate);

                              Network.visitor('0').then((response) {
                                if (response.success!) {
                                  print('berhasil merekap visitor');
                                }
                              }).catchError((e) {
                                print(
                                    'terjadi error saat merekap visitor : $e');
                              });
                            }
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()),
                                (route) => false);
                          } catch (e) {
                            if (e is FirebaseAuthException) {
                              showMessage(e.message!);
                            }
                          }
                        },
                        style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: const BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
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
                              fontSize: 14,
                              color: const Color(0xFF444444).withOpacity(0.7)),
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
                            style: onBoardStyle.copyWith(
                                fontSize: 14, color: orangeColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {'email': email, 'password': password};
    var res = await Network().auth(data, 'auth/login/');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setInt('id', int.parse(json.encode(body['data']['id'])));
      if (!visitToday) {
        localStorage.setString('last_visit', todayDate);
        Network.visitor(json.encode(body['data']['id'])).then((response) {
          if (response.success!) {
            print('berhasil merekap visitor');
          }
        }).catchError((e) {
          print('terjadi error saat merekap visitor : $e');
        });
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
          (route) => false);
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
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
}
