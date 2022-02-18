import 'dart:convert';
import 'package:bpbd/models/bencana.dart';
import 'package:bpbd/models/berita.dart';
import 'package:bpbd/models/kategori.dart';
import 'package:bpbd/models/mitigasi_kategori.dart';
import 'package:bpbd/models/new_bencana.dart';
import 'package:bpbd/models/simple_response.dart';
import 'package:bpbd/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static const _DOMAIN = '192.168.1.19:8000';
  static const IMG_PATH = 'http://192.168.1.19:8000/upload/berita/';
  final String _url = 'http://192.168.1.19:8000/api/';

  // 192.168.1.2 is my IP, change with your IP address
  var token;

  static Future<Bencana> getListBencana() async {
    try {
      var url = Uri.http(_DOMAIN, '/api/bencana');

      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final Bencana data = bencanaFromJson(response.body);
        return data;
      } else {
        return Bencana();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Berita> getListBerita() async {
    try {
      var url = Uri.http(_DOMAIN, '/api/berita/');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      print(response);

      if (response.statusCode == 200) {
        final Berita data = beritaFromJson(response.body);
        return data;
      } else {
        return Berita();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<MitigasiKategori> getListBencanaKec(String kecamatan) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/bencana-kecamatan/$kecamatan');
      print(url);
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final MitigasiKategori data = mitigasiKategoriFromJson(response.body);
        print(response.body);
        return data;
      } else {
        return MitigasiKategori();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Berita> searchBerita(String judul) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/search-berita/');
      var response = await http.post(url, headers: {
        'Accept': 'application/json',
      }, body: {
        "judul": judul
      });

      if (response.statusCode == 200 || response.statusCode == 202) {
        final Berita data = beritaFromJson(response.body);
        return data;
      } else {
        return Berita();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<NewBencana> searchBencanaKec(String kec, String title) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/search-bencana/$kec/$title');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200 || response.statusCode == 202) {
        final NewBencana data = newBencanaFromJson(response.body);
        return data;
      } else {
        return NewBencana();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Berita> getListBeritaKategori(String kategori) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/berita/$kategori');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final Berita data = beritaFromJson(response.body);
        return data;
      } else {
        return Berita();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<NewBencana> getListBencanaKategori(
      String kecamatan, String kategori) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/bencana/$kecamatan/$kategori');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });
      print('url bencana kategori : $url');
      if (response.statusCode == 200) {
        final NewBencana data = newBencanaFromJson(response.body);
        print(response.body);
        return data;
      } else {
        return NewBencana();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Berita> getListBeritaKategoriTitle(
      String kategori, String title) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/berita/$kategori/$title');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final Berita data = beritaFromJson(response.body);
        return data;
      } else {
        return Berita();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<NewBencana> getListBencanaKategoriTitle(
      String kecamatan, String kategori, String title) async {
    try {
      var url =
          Uri.http(_DOMAIN, '/api/search-bencana/$kecamatan/$kategori/$title');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final NewBencana data = newBencanaFromJson(response.body);
        return data;
      } else {
        return NewBencana();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Kategori> getListKategori() async {
    try {
      var url = Uri.http(_DOMAIN, '/api/mitigasi-bencana/');
      var response = await http.get(url, headers: {
        'Accept': '*/*',
      });

      if (response.statusCode == 200) {
        final Kategori data = kategoriFromJson(response.body);
        return data;
      } else {
        return Kategori();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Kategori> getListKategoriId(int id) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/mitigasi-bencana/$id');
      var response = await http.get(url, headers: {
        'Accept': '*/*',
      });

      if (response.statusCode == 200) {
        final Kategori data = kategoriFromJson(response.body);
        return data;
      } else {
        return Kategori();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<UserApi> getUser(int id, String token) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/profile/$id');
      var response = await http.get(url, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final UserApi data = userApiFromJson(response.body);
        return data;
      } else {
        return UserApi();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<SimpleResponse> sendLaporan(var data, String token) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/laporan-bencana/');
      var response = await http.post(url, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, body: {
        "title": data['title'],
        "desc": data['desc'],
        "alamat": data['alamat'],
        "longitude": data['longitude'],
        "latitude": data['latitude'],
        "file": data['img'],
        "tmpfile": data['base64'],
      });

      if (response.statusCode == 200 || response.statusCode == 202) {
        final SimpleResponse data = simpleResponseFromJson(response.body);
        return data;
      } else {
        return SimpleResponse();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<SimpleResponse> visitor(String id_user) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/add-visitor/$id_user');
      var response = await http.get(url, headers: {
        'Content-type': 'application/json',
        'Accept': '*/*',
      });

      if (response.statusCode == 200 || response.statusCode == 202) {
        final SimpleResponse data = simpleResponseFromJson(response.body);
        return data;
      } else {
        return SimpleResponse();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode((localStorage.getString('token')).toString())['token'];
  }

  postUrl(dat, apUrl, token) async {
    try {
      var ful = Uri.parse(_url + apUrl);
      var response = await http.post(ful, body: jsonEncode(dat), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response);
      if (response.statusCode == 200) {
        return response;
      } else {
        return Text('error');
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  auth(data, apiURL) async {
    var fullUrl = Uri.parse(_url + apiURL);
    return await http.post(fullUrl,
        body: json.encode(data), headers: _setHeaders());
  }

  getData(apiURL) async {
    var fullUrl = Uri.parse(_url + apiURL);
    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
