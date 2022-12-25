import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class Service1 {
  Future trainsBetweenStations() async {
    var apiurl = "https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations?fromStationCode=bju&toStationCode=cbe";
    final url = Uri.parse(apiurl);
    final header = {
      "X-RapidAPI-Key": '13eafc7b81mshcaf8edf9ba380f8p17a17bjsnbadbea627916',
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

  Future trainDetails(List details) async {
    List trainDetails2 = [];
    List allDetails = [];
    for (var i = 0; i < details.length; i++) {
      var trainNumber = details[i]['train_number'];
      print(i);
      var apiurl = "https://irctc1.p.rapidapi.com/api/v1/getTrainSchedule?trainNo=${trainNumber}";
      print(apiurl);
      final url = Uri.parse(apiurl);
      final header = {
        "X-RapidAPI-Key": '13eafc7b81mshcaf8edf9ba380f8p17a17bjsnbadbea627916',
        "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
        "useQueryString": "true"
      };
      final response = await http.get(url,headers: header);
      print(response.body);
      List listResponse2 = jsonDecode(response.body)['data']['route'];
      var platformNumber = listResponse2[0]['platform_number'];
      var stop = listResponse2[0]['stop'];
      trainDetails2.add([platformNumber, stop]);
    }
    allDetails.add(details);
    allDetails.add(trainDetails2);
    return allDetails;
  }

}