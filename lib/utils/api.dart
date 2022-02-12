import 'dart:convert';
import 'package:bpbd/models/bencana.dart';
import 'package:bpbd/models/berita.dart';
import 'package:bpbd/models/kategori.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static const _DOMAIN = '192.168.1.2:8000';
  final String _url = 'http://192.168.1.2:8000/api/auth';
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

  static Future<Mitigasi> getListKategori() async {
    try {
      var url = Uri.http(_DOMAIN, '/api/mitigasi-bencana/');
      var response = await http.get(url, headers: {
        'Accept': '*/*',
      });

      if (response.statusCode == 200) {
        final Mitigasi data = mitigasiFromJson(response.body);
        return data;
      } else {
        return Mitigasi();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<Mitigasi> getListKategoriId(int id) async {
    try {
      var url = Uri.http(_DOMAIN, '/api/mitigasi-bencana/$id');
      var response = await http.get(url, headers: {
        'Accept': '*/*',
      });

      if (response.statusCode == 200) {
        final Mitigasi data = mitigasiFromJson(response.body);
        return data;
      } else {
        return Mitigasi();
      }
    } catch (e) {
      throw Exception('error : ' + e.toString());
    }
  }

  static Future<List> getListKecamatan() async {
    await Future.delayed(Duration(milliseconds: 2000));
    List _list = <dynamic>[];
    _list.add('Text' + ' Item 1');
    _list.add('Test' + ' Item 2');
    _list.add('Test' + ' Item 3');
    return _list;
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode((localStorage.getString('token')).toString())['token'];
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
      };
}
