import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourirctc/services/service1.dart';
import 'package:yourirctc/views/search_form2.dart';
import 'package:yourirctc/views/widgets/train_card.dart';
import 'package:yourirctc/auth_service.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  List? trainBetweenStations;
  var isFetched1 = false;

  @override
  void initState() {
    super.initState();

    getData1();
  }

  getData1 () async {
    trainBetweenStations = await Service1().trainsBetweenStations();
    if (trainBetweenStations != null) {
      print(trainBetweenStations![0]);
      print(trainBetweenStations![1]);
      setState(() {
        isFetched1 = true;
      });
    }
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:  [
                          const Text("Welcome,",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black38,
                          ),
                          ),
                          Text(
                            FirebaseAuth.instance.currentUser!.displayName!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          AuthService().signOut();
                        },
                        child: const Icon(Icons.power_settings_new_rounded,
                          size: 25,
                        color: Colors.blueAccent,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SearchForm(),
          Visibility(
            visible: isFetched1,
            replacement: const CircularProgressIndicator(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height /1.7 ,
              child: ListView.builder(
                  itemCount: trainBetweenStations?[0].length,
                  itemBuilder: (context, index) {
                    var trainName = trainBetweenStations![0][index]['train_name'];
                    var trainNumber = trainBetweenStations![0][index]['train_number'];
                    var departTime = trainBetweenStations![0][index]['depart_time'];
                    var arrivalTime = trainBetweenStations![0][index]['arrival_time'];
                    var distance = trainBetweenStations![0][index]['distance'];
                    var platformNumber = "";
                    var stop = "";
                    return TrainCard(trainName: trainName, trainNumber: trainNumber, platformNumber: platformNumber, startTime: departTime, endTime: arrivalTime, distance: distance, boolStop: stop);
              },
              ),
            ),
          )
        ],
      ),
    );
  }
}
