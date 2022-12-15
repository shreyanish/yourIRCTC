import 'package:flutter/material.dart';
import 'package:yourirctc/models/train.api.dart';
import 'package:yourirctc/views/widgets/train_card.dart';

import '../models/train.dart';

class SearchForm extends StatefulWidget {
  SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var originStation = TextEditingController();
  var destinationStation = TextEditingController();

  late List<Train> _trains;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getTrains();
  }

  Future<void> getTrains() async{
    _trains = await TrainApi.getTrain();
    setState(() {
      _isLoading = false;
    });
    print(_trains);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    originStation.dispose();
    destinationStation.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.directions_train),
            Text("Your IRCTC"),
          ],
        ),
      ),
      body: Container(
        //margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        //height: 300,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Start"),
                    controller: originStation,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Destination"),
                    controller: destinationStation,
                  ),
                  ElevatedButton(onPressed: () {
                     //print(originStation.text) ;
                     //print(destinationStation.text);
                  }, child: const Text("Search Trains")
                  ),
                  const TrainCard(trainName: "trainName", trainNumber: "trainNumber", platformNumber: "platformNumber", startTime: "startTime", endTime: "endTime", distance: "distance", boolStop: "boolStop")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

