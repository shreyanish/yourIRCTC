import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yourirctc/views/search_form2.dart';
import 'package:yourirctc/views/widgets/train_card.dart';


List? listResponse;

Future<Train> fetchTrain() async {
  const apiurl = "https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations?fromStationCode=cbe&toStationCode=mas";
  final url = Uri.parse(apiurl);
  final header = {
    "X-RapidAPI-Key": '07e7b47cadmsha03ef2d0dbf7e33p188fedjsnaea3db049afc',
    "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
    "useQueryString": "true"
  };
  final response = await http.get(url,headers: header);
  //print('status code: ${response.statusCode}');
  //print('Body: ${response.body}');

  listResponse = json.decode(response.body)['data'];

  return Train.fromJson(jsonDecode(response.body));
}


class Train  {
  final String trainName;
  final String trainNumber;
  final String departTime;
  final String arrivalTime;
  final String distance;

  const Train({
    required this.trainName,
    required this.trainNumber,
    required this.departTime,
    required this.arrivalTime,
    required this.distance,
});

  factory Train.fromJson(Map<String, dynamic> json) {
    return Train(
      trainName: json['data'][0]['train_name'],
      trainNumber: json['data'][0]['train_number'],
      departTime: json['data'][0]['depart_time'],
      arrivalTime: json['data'][0]['arrival_time'],
      distance: json['data'][0]['distance'],
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Train> futureTrain;

  @override
  void initState() {
    futureTrain = fetchTrain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 25),
            child: Row(
              children: [
                const Icon(Icons.train,
                color: Colors.blueAccent,
                size: 50,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Your",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    ),),
                    Text("IRCTC",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SearchForm(),
          FutureBuilder<Train>(
            future: futureTrain,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                  return SizedBox(
                    height: 555,
                    child: ListView.builder(itemBuilder: (context, index) {
                      var tname = listResponse![index]['train_name'];
                      var tnumber = listResponse![index]['train_number'];
                      var dtime = listResponse![index]['depart_time'];
                      var atime = listResponse![index]['arrival_time'];
                      var dist = listResponse![index]['distance'];
                      return TrainCard(trainName: tname, trainNumber: tnumber, platformNumber: "platformNumber", startTime: dtime, endTime: atime, distance: dist, boolStop: "boolStop");
                    },
                    itemCount: listResponse == null? 0: listResponse?.length,
                    ),
                  );
              } else if (snapshot.hasError) {
                return const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text('Loading...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                );
              }
              return const CircularProgressIndicator();
            }
          )
        ],
      ),
    );
  }
}
