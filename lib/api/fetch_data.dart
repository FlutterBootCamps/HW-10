import "dart:convert";
import "dart:math";

import "package:http/http.dart" as http;

class Networking{
  final String baseUrlCard = "https://db.ygoprodeck.com/api/v7/randomcard.php";
  final String baseUrlOfMovie = "https://search.imdbot.workers.dev/?q=";
  Future<List> getCharacters() async{
    List card=[];
    final urlApi=Uri.parse(baseUrlCard);
    final response = await http.get(urlApi);
print(json.decode(response.body)["name"]);
    if(response.statusCode==200){
card.add(json.decode(response.body)["name"]);
card.add(json.decode(response.body)["type"]);
card.add(json.decode(response.body)["atk"]);
card.add(json.decode(response.body)["def"]);
card.add(json.decode(response.body)["level"]);
card.add(json.decode(response.body)["race"]);
card.add(json.decode(response.body)["attribute"]);
card.add(json.decode(response.body)["card_images"][0]["image_url"]);
      return card;
    }else{throw Exception("no data from Api");}
  }
Future<List> getMovie({required String name}) async{
  List movie=[];
  final urlApi=Uri.parse("${baseUrlOfMovie}${name}");
    final response = await http.get(urlApi);
    if(response.statusCode==200){
for(var e in json.decode(response.body)["description"])
  movie.add(e);{
  //movie.add(json.encode(response.body));
}
print("it : ${movie[0]["#TITLE"]}");
      return movie ;
    }else{throw Exception("no data from Api");}
  
}

}
