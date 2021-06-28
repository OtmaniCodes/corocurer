import 'package:corocurer/config/api_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetNewsData {
  final ApiInfo apiInfos = ApiInfo();

  // fetching most recent articals/news that has to do with COVID in the US
  Future getArticals() async {
    http.Response articalsResponse = await http.get(
      apiInfos.getUrl("articals"),
      headers: {
        "x-rapidapi-key": apiInfos.apiKey,
        "x-rapidapi-host": apiInfos.getHost("articals"),
      },
    );
    if(articalsResponse.statusCode == 200){
    return jsonDecode(articalsResponse.body);
    }else{
      throw Exception("some error has occured!");
    }
  }
}
