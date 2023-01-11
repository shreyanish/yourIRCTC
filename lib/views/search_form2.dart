import 'package:flutter/material.dart';
import 'package:yourirctc/globals.dart' as globals;
import '../services/service1.dart';


class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final originStation = TextEditingController();
  final destinationStation = TextEditingController();


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
    return SizedBox(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Start",
                  border: OutlineInputBorder(),
                ),
                controller: originStation,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Destination"
                  ),
                  controller: destinationStation,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: () async {
                  globals.s1 = originStation.text.toString().toLowerCase();
                  globals.s2 = destinationStation.text.toString().toLowerCase();
                  print(globals.s1);
                  print(globals.s2);
                  globals.trainBetweenStations = await Service1().trainsBetweenStations(globals.s1, globals.s2);
                  print(globals.trainBetweenStations);
                  globals.apicall = true;
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.search_rounded),
                      SizedBox(width: 10),
                      Text("Search Trains",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      )
                    ],
                  )


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }


