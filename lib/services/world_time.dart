import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'];
    //offset = offset.substring(1,3);

    //print(dateTime);
    //print(offset.substring(4, 6));

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset.substring(1, 3)), minutes: int.parse(offset.substring(4, 6))));
    //print(now);

    time = DateFormat.jm().format(now);
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false; 

    } catch (e) {
      print(e);
      time = 'Could not get the time data';
    }
  }

  
}

