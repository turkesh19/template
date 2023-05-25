import 'dart:convert';

import 'package:http/http.dart' as http;

class Network_Network {
  Future getWeatherNews() async {
    //1st line
    //http.get(uri.parse())
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=27.7172&lon=85.3240&appid=e5f001d6384ceb15b0c91d7965838d53'));

    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
    } else if (response.statusCode == 400) //400=user side error
    {
    } else if (response.statusCode ==
        500) //500=server side error or server down
    {}
  }
}
