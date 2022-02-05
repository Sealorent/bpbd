import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'package:bpbd/auth/auth_google.dart';
import 'package:bpbd/bloc/application_bloc.dart';
import 'package:bpbd/services/place_service.dart';
import 'package:bpbd/theme/shared.dart';
import 'package:bpbd/utils/api.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:bpbd/provider/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:provider/provider.dart';
// // import 'package:bpbd/provider/google_sign_in.dart';
// import 'package:bpbd/auth/auth_google.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
// import 'package:google_api_headers/google_api_headers.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoder/geocoder.dart';

part 'splashscreen.dart';
part 'daftar.dart';
part 'onboarding.dart';
part 'login.dart';
part 'main.dart';
part 'notifikasi.dart';
part 'detail.dart';
part 'mitigasi.dart';
part 'tentang.dart';
part 'berita.dart';
part 'laporkan.dart';
part '../widget/detail_menu.dart';
part '../widget/notif.dart';
part '../widget/splash.dart';
part '../widget/google_maps.dart';
part '../widget/menuItem.dart';
part '../widget/akun.dart';
