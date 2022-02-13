import 'dart:convert';
import 'package:bpbd/models/bencana.dart';
import 'package:bpbd/models/berita.dart';
import 'package:bpbd/models/kategori.dart';
import 'package:bpbd/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static const _DOMAIN = '192.168.1.16:8000';
  static const IMG_PATH = 'http://192.168.1.16:8000/upload/berita/';
  final String _url = 'http://192.168.1.16:8000/api/';

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

  static Future<User> getUser(int id, String token) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/profile/$id');
      var response = await http.get(url, headers: {
        'Content-type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final User data = userFromJson(response.body);
        return data;
      } else {
        return User();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode((localStorage.getString('token')).toString())['token'];
  }

  postUrl(dat, apUrl, String token) async {
    var ful = Uri.parse(_url + apUrl);
    return await http.post(ful, body: jsonEncode(dat), headers: {
      'Content-type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token',
    });
  }

  auth(data, apiURL) async {
    var fullUrl = Uri.parse(_url + apiURL);
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
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
        'Authorization': 'Bearer $token',
      };
}
