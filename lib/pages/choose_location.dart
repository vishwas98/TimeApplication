

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url : 'Asia/Baghdad', location: 'Baghdad', flag: 'iraq.jpg'),
    WorldTime(url : 'Europe/Paris', location: 'Paris', flag: 'france.jpg'),
    WorldTime(url : 'Europe/Prague', location: 'Prague', flag: 'czech.jpg'),
    WorldTime(url : 'Pacific/Auckland', location: 'Auckland', flag: 'new.jpg'),
    WorldTime(url : 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
    WorldTime(url : 'America/Denver', location: 'Denver', flag: 'usa.jpg'),
    WorldTime(url : 'America/Halifax', location: 'Halifax', flag: 'canada.jpg'),
    WorldTime(url : 'Asia/Damascus', location: 'Damascus', flag: 'syria.jpg'),
    WorldTime(url : 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'china.jpg'),
    WorldTime(url : 'Australia/Darwin', location: 'Darwin', flag: 'australia.jpg'),
    WorldTime(url : 'America/New_York', location: 'New York', flag: 'usa.jpg'),
    WorldTime(url : 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpg'),

  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // jump to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });

  }
  
  
  @override
  
  Widget build(BuildContext context) {
    print('Build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage : AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );

        }),
    );
  }
}