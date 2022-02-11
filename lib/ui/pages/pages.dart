import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'dart:io';
// import 'package:textfield_search/search.dart';
import 'package:bpbd/models/kecamatan.dart';
import 'package:flutter/services.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:bpbd/models/kategori.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bpbd/auth/auth_google.dart';
import 'package:bpbd/bloc/application_bloc.dart';
import 'package:bpbd/theme/shared.dart';
import 'package:bpbd/utils/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

part 'splashscreen.dart';
part 'daftar.dart';
part 'onboarding.dart';
part 'login.dart';
part 'main.dart';
part 'notifikasi.dart';
part 'detailMitigasi.dart';
part 'mitigasi.dart';
part 'tentang.dart';
part 'beritaPage.dart';
part 'laporkan.dart';
part 'rawanBencana.dart';
part 'kontak.dart';
part 'beritaDetailPage.dart';
part '../widget/notif.dart';
part '../widget/splash.dart';
part '../widget/google_maps.dart';
part '../widget/menuItem.dart';
part '../widget/akun.dart';
part '../widget/detail_menu.dart';
