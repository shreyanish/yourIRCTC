import 'package:flutter/material.dart';
import 'package:yourirctc/globals.dart' as globals;
import 'package:yourirctc/views/home.dart';
import '../services/service1.dart';
import 'package:yourirctc/auth_service.dart';
import 'bookmark.dart';


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
    return Scaffold(
      body: Column(
        children: [
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 25),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
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
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          AuthService().signOut();
                        },
                        child: const Icon(Icons.power_settings_new_rounded,
                          size: 35,
                          color: Colors.blueAccent,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AuthService().getProfileImage(),
                radius: 85,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Start Station Code",
                        border: OutlineInputBorder(),
                      ),
                      controller: originStation,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Destination Station Code"
                        ),
                        controller: destinationStation,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(onPressed: () async {
                        setState(() {
                          globals.cardClicked = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()
                            ));
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
          ),
        ],
      ),
    ]));
  }
}


