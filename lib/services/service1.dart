import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:yourirctc/globals.dart' as globals;


class Service1 {
  Future trainsBetweenStations(s1, s2) async {
    var apiurl = "https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations?fromStationCode=$s1&toStationCode=$s2";
    final url = Uri.parse(apiurl);
    final header = {
      "X-RapidAPI-Key": '06652166cfmshacfa2fb631b0575p160d0ejsnc92b70eb855d',
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
      "useQueryString": "true"
    };
    final response = await http.get(url,headers: header);
    if (response.statusCode == 200) {
      List listResponse = jsonDecode(response.body)['data'];
      //print(listResponse);
      //var requiredDetails = await trainDetails(listResponse);
      //return requiredDetails;
      return listResponse;
    }
  }

  Future trainDetails(trainno) async {
    var apiurl2 = "https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations?trainNo=$trainno";
    print(apiurl2);
    final url2 = Uri.parse(apiurl2);
    final header2 = {
      "X-RapidAPI-Key": '06652166cfmshacfa2fb631b0575p160d0ejsnc92b70eb855d',
      "X-RapidAPI-Key": 'd6658b004bmsh172d492a15ff3f9p155c14jsnbcc96c26f127',
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
      "useQueryString": "true"
    };
    final response2 = await http.get(url2,headers: header2);
    print(response2.body);
    if (response2.statusCode == 200) {
      List listResponse = jsonDecode(response2.body)['data']['route'];
      globals.apicall2 = true;
      return listResponse;
    }
  }

}