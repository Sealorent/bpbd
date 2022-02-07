import 'dart:convert';
import 'package:bpbd/models/bencana.dart';
import 'package:bpbd/models/kategori.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  static const _DOMAIN = '192.168.1.11:8000';
  final String _url = 'http://192.168.1.11:8000/api/auth';
  // 192.168.1.2 is my IP, change with your IP address
  var token;

  static Future<Bencana> getListBencana(String token) async {
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

  static Future<Kategori> getListKategori() async {
    try {
      var url = Uri.http(_DOMAIN, '/api/kategori-bencana');
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
