// import 'package:geolocator/geolocator.dart';

// class GeolocatorService {
//   Future<Position?> determinePosition() async {
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         return Future.error('Location Not Available');
//       }
//     } else {
//       throw Exception('Error');
//     }
//     return await Geolocator.getCurrentPosition();
//   }
// }

//   //   return await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.high);
//   // }

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class Downloader {
  static var httpClient = new HttpClient();
  Future<File> downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}
