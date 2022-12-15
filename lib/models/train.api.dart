import 'package:yourirctc/models/train.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yourirctc/views/search_form2.dart' as searchform;


class TrainApi {
    static Future<List<Train>> getTrain() async {
      var uri = Uri.https('irctc1.p.rapidapi.com', '/api/v2/trainBetweenStations',
      {"fromStationCode": "cbe", "toStationCode": "mas"});

      final response = await http.get(uri, headers:{
        "X-RapidAPI-Key": "503e469606msh169fb0309cced17p1bdbbejsncda2d01ad3f8",
        "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
        "useQueryString": "true"
      });

      Map data = jsonDecode(response.body);
      List temp = [];

      temp.add(data['data']);

      return Train.trainFromSnapshot(temp);
      }
    }

