import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourirctc/globals.dart' as globals;

import '../auth_service.dart';
import 'bookmark.dart';


class TrainPage extends StatefulWidget {
  const TrainPage({Key? key}) : super(key: key);

  @override
  State<TrainPage> createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  List? trainSchedule;
  var isFetched1 = false;

  @override
  void initState() {
    super.initState();

    getData1();
  }

  getData1 () async {
    trainSchedule = await globals.trainDetails();
    print(trainSchedule);
    setState(() {
      isFetched1 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Visibility(
            visible: isFetched1,
              child: SizedBox(
                height: MediaQuery.of(context).size.height /1.2 ,
                child: ListView.builder(
                  itemCount: trainSchedule?.length,
                  itemBuilder: (context, index) {
                    var pn = trainSchedule![index]['platform_number'];
                    var stname = trainSchedule![index]['state_name'];
                    var snname = trainSchedule![index]['station_name'];
                    var stop = trainSchedule![index]['stop'];
                    var stdmin = trainSchedule![index]['std_min'];
                    return Column(
                      children: [
                        Text('Route $index'),
                        Text('Platform Number - $pn'),
                        Text('State Name - $stname'),
                        Text('Station Name - $snname'),
                        Text('Stop - $stop'),
                        Text('Std Min - $stdmin'),
                      ],
                    );
                  },
                ),
              ),
          ),
        ],
      ),
    );
  }
}
