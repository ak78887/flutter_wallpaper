import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/helper/categories_helper.dart';
import 'package:flutter_wallpaper/helper/wallpaper_helper.dart';
import 'package:flutter_wallpaper/model/categories_model.dart';
import 'package:flutter_wallpaper/model/wallpaper_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpaper/screens/image_screen.dart';
import 'package:flutter_wallpaper/screens/wallpaper_category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = [];
  List photoList = [];

  void getPhotos() async {
    WallPapers photos = WallPapers();
    await photos.getPhotos();
    photoList = photos.wallpaper;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    //var nextPageLink = WallPapers().nextPageLink;
    return Scaffold(
      appBar: AppBar(
        title: Text('nextPageLink'),
      ),
      body: Column(
        children: <Widget>[
          //categories
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    imageAssetUrl: categories[index].imageAssetUrl,
                    categoryName: categories[index].categorieName,
                  );
                }),
          ),

          //photos
          Expanded(
            child: Container(
              padding: EdgeInsets.all(3),
              color: Colors.white,
              child:
                  /* StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  itemCount: photoList.length,
                  crossAxisCount: 4,
                  itemBuilder: (context, index) {
                    return PhotosTile(
                        photographerUrl: photoList[index].photographerUrl ?? "",
                        photographer: photoList[index].photographer ?? "",
                        imageUrl: photoList[index].imageUrl ?? "");
                  },
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index.isEven ? 2 : 1),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 6.0,
                )  */

                  GridView.builder(
                itemCount: photoList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PhotosTile(
                      id: photoList[index].id ?? "",
                      photographerUrl: photoList[index].photographerUrl ?? "",
                      photographer: photoList[index].photographer ?? "",
                      imageUrl: photoList[index].imageUrl ?? "");
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotosTile extends StatelessWidget {
  //const PhotosTile({ Key? key }) : super(key: key);
  int id;
  String photographerUrl, photographer, imageUrl;

  PhotosTile(
      {required this.id,
      required this.photographerUrl,
      required this.photographer,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FullScreenImge(id)));
      },
      child: Container(
          margin: EdgeInsets.all(3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          )

          /* CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
          imageBuilder: (context, imageProvider) => Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),  */
          ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({required this.imageAssetUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryWallPapers(
                      photosCategory: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
