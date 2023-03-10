import 'package:flutter/material.dart';
import 'package:yourirctc/views/widgets/station_card.dart';
import 'package:yourirctc/views/widgets/train_card.dart';
import 'package:yourirctc/auth_service.dart';
import 'package:yourirctc/globals.dart' as globals;

import 'bookmark.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  List? trainBetweenStations;
  List? trainSchedule;
  var isFetched1 = false;

  @override
  void initState() {
    super.initState();

    getData1();
  }

  getData1 () async {
    trainBetweenStations = await globals.trainbwStations();
    print(trainBetweenStations);
    setState(() {
      isFetched1 = true;
    });
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.blueAccent,
                          size: 40),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: AuthService().getProfileImageS(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: IconButton(
                          onPressed: () {
                            final route = MaterialPageRoute(
                              builder: (context) => const BookmarkPage(),
                            );
                            Navigator.push(context, route);
                          },
                          icon: const Icon(
                            Icons.bookmark_rounded,
                            color: Colors.blueAccent,
                            size: 35,
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          StationCard(startStation: globals.s1, endStation: globals.s2),
          Visibility(
            visible: isFetched1,
            replacement: const Center(child: CircularProgressIndicator(),),
            child: SizedBox(
              height: MediaQuery.of(context).size.height /1.5 ,
              child: ListView.builder(
                  itemCount: trainBetweenStations?.length,
                  itemBuilder: (context, index) {
                    var trainName = trainBetweenStations![index]['train_name'];
                    var trainNumber = trainBetweenStations![index]['train_number'];
                    var departTime = trainBetweenStations![index]['depart_time'];
                    var arrivalTime = trainBetweenStations![index]['arrival_time'];
                    var distance = trainBetweenStations![index]['distance'];
                    return TrainCard(trainName: trainName, trainNumber: trainNumber, startTime: departTime, endTime: arrivalTime, distance: distance);
              },
              ),
            ),
          )
        ],
      ),
    );
  }
}
