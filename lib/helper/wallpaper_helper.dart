import 'dart:convert';
import 'package:flutter_wallpaper/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class WallPapers {
  List<Photos> wallpaper = [];
  var nextPageLink;

  Future<void> getPhotos() async {
    String url = "https://api.pexels.com/v1/search?query=nature&per_page=21";

    var response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f9170000100000141142f87f90f4d058ce651afd9279079'
    });

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      nextPageLink = jsonData['per_page'];
      jsonData["photos"].forEach((element) {
        if (element['url'] != null &&
            element['photographer'] != null &&
            element['src']['original'] != null) {
          Photos photos = Photos(
              id: element['id'],
              photographer: element['photographer'],
              photographerUrl: element['photographer_url'],
              imageUrl: element['src']['original']);
          wallpaper.add(photos);
          //print(jsonData);
        }
      });
    }
  }
}

class WallPapersForCategories {
  List<Photos> wallpaper = [];
  var nextPageLink;

  Future<void> getPhotos(String category) async {
    String url = "https://api.pexels.com/v1/search?query=$category&per_page=21";

    var response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f9170000100000141142f87f90f4d058ce651afd9279079'
    });

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      nextPageLink = jsonData['per_page'];
      jsonData["photos"].forEach((element) {
        if (element['url'] != null &&
            element['photographer'] != null &&
            element['src']['original'] != null) {
          Photos photos = Photos(
              id: element['id'],
              photographer: element['photographer'],
              photographerUrl: element['photographer_url'],
              imageUrl: element['src']['original']);
          wallpaper.add(photos);
          //print(jsonData);
        }
      });
    }
  }
}
