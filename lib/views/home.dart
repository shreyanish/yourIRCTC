import 'package:flutter/material.dart';
import 'package:yourirctc/models/train.api.dart';
import 'package:yourirctc/views/search_form2.dart';
import 'package:yourirctc/views/widgets/train_card.dart';

import '../models/train.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Train> _trains;
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getTrains();
  }

  Future<void> getTrains() async{
    _trains = await TrainApi.getTrain();
    setState(() {
      _isloading = false;
    });
    print(_trains);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchForm(),

      ],
    );
  }
}
