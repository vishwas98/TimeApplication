import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

  String location;
  String time;
  String flag; //url
  String url; // location url
  bool isDaytime; // true or false day or night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
          Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);
    //create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    
    isDaytime = now.hour > 6 && now.hour < 20 ? true: false;
    time = DateFormat.jm().format(now);//set time property

    }

    catch(e){
      print('caught error : $e');
      time = 'could not get time data';

    }



  }



}

WorldTime instance = WorldTime(location: 'Kolkata', flag: 'india.png', url: '/Asia/Kolkata');
