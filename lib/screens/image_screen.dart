import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
class FetchWallPaper extends StatelessWidget {
  //const FetchWallPaper({ Key? key }) : super(key: key);

  var imageUrl;
  int id;
  var jsonData;

  FetchWallPaper(this.id);

  Future<void> getWallPaper() async {
    String url = "https://api.pexels.com/v1/photos/$id";
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f9170000100000141142f87f90f4d058ce651afd9279079'
    });

    jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      imageUrl = jsonData[("src")]["portrait"];
      print("url: " + jsonData[("src")]["portrait"]);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    getWallPaper();
    return Container();
  }
}
*/

class FullScreenImge extends StatefulWidget {
  final int id;
  FullScreenImge(this.id);

  //const FullScreenImge({ Key? key }) : super(key: key);

  @override
  _FullScreenImgeState createState() => _FullScreenImgeState(id);
}

class _FullScreenImgeState extends State<FullScreenImge> {
  int id;
  _FullScreenImgeState(this.id);

  var jsonData;
  var imageUrl;

  bool showSplash = true;

  Future<void> getWallPaper() async {
    String url = "https://api.pexels.com/v1/photos/$id";
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f9170000100000141142f87f90f4d058ce651afd9279079'
    });

    jsonData = jsonDecode(response.body);
    //print(jsonData);

    if (response.statusCode == 200) {
      imageUrl = jsonData[("src")]["portrait"];

      print("url: " + jsonData[("src")]["portrait"]);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await this.getWallPaper();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 240,
              margin: EdgeInsets.only(
                bottom: 80,
              ),
              child: MaterialButton(
                onPressed: () {
                  downloadImage(imageUrl);
                },
                padding: EdgeInsets.only(top: 12, bottom: 12),
                color: Colors.greenAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Download",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}

void downloadImage(imageUrl) async {}
