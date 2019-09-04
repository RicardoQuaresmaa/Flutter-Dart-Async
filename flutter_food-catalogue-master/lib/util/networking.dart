import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper({this.url, this.count});
  final String url;
  final int count;
  Future getData() async {
    http.Response response = await http.get('$url+$count', headers: {
      'X-RapidAPI-Host': 'recipe-puppy.p.rapidapi.com',
      'X-RapidAPI-Key': 'a5f6ba8665msh2ac15af61241433p11b645jsn8be27dfa8391'
    });
    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    } else {
      return response.statusCode;
    }
  }
}