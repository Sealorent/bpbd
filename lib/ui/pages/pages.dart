import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
// import 'package:textfield_search/search.dart';
import 'package:bpbd/models/berita.dart';
import 'package:bpbd/models/laporan.dart';
// import 'package:bpbd/models/new_bencana.dart';
import 'package:bpbd/models/user.dart';
import 'package:bpbd/models/mitigasi_kategori.dart';
import 'package:dio/dio.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bpbd/models/kategori.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:google_api_headers/google_api_headers.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bpbd/auth/auth_google.dart';
// import 'package:bpbd/bloc/application_bloc.dart';
import 'package:bpbd/theme/shared.dart';
import 'package:bpbd/utils/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../cubit/get_location_cubit.dart';
// import 'package:dio/dio.dart';

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
part 'pageGuest.dart';
part 'dataTahunanPage.dart';
part 'bencanaPage.dart';
part '../widget/notif.dart';
part '../widget/splash.dart';
part '../widget/google_maps.dart';
part '../widget/menuItem.dart';
part '../widget/akun.dart';
part 'error_page.dart';
// part 'beritaNearPage.dart';
part 'mitigasi_kec.dart';
