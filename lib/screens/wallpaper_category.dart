import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/helper/wallpaper_helper.dart';


class CategoryWallPapers extends StatefulWidget {
  
  final String photosCategory;

  CategoryWallPapers({required this.photosCategory});

  @override
  _CategoryWallPapersState createState() => _CategoryWallPapersState();
}

class _CategoryWallPapersState extends State<CategoryWallPapers> {

  var photoList;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    WallPapersForCategories news = WallPapersForCategories();
    await news.getPhotos(widget.photosCategory);
    photoList = news.wallpaper;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;


    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 16),
              child: GridView.builder(
                itemCount: photoList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PhotosTile(
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
      ),
    );
  }
}


class PhotosTile extends StatelessWidget {
  //const PhotosTile({ Key? key }) : super(key: key);

  String photographerUrl, photographer, imageUrl;

  PhotosTile(
      {required this.photographerUrl,
      required this.photographer,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        );
  }
}



class WallpapersTile extends StatelessWidget {
  //const PhotosTile({ Key? key }) : super(key: key);

  String photographerUrl, photographer, imageUrl;

  WallpapersTile(
      {required this.photographerUrl,
      required this.photographer,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        );
  }
}