import 'package:application/Widgets/card.dart';
import 'package:application/model/stat.dart';
import 'package:application/model/statapi.dart';
import 'package:flutter/material.dart';

class Hstatistic extends StatefulWidget {
  const Hstatistic({Key? key}) : super(key: key);

  @override
  _HstatisticState createState() => _HstatisticState();
}

class _HstatisticState extends State<Hstatistic> {
  late List<Covidstat> _stat;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getStat();
  }

  Future<void> getStat() async {
    _stat = await StatApi.getStat();
    setState(() {
      _isLoading = false;
    });
    print(_stat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.equalizer_outlined),
              SizedBox(width: 10),
              Text('Statistics')
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _stat.length,
                itemBuilder: (context, index) {
                  return Deco(
                      country: _stat[index].country,
                      time: _stat[index].time,
                      population: _stat[index].population,
                      activecases: _stat[index].activecases);
                },
              ));
  }
}
