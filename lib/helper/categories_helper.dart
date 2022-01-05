import 'package:flutter_wallpaper/model/categories_model.dart';

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = [];
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Street Art";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/2119706/pexels-photo-2119706.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Wild Life";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/625727/pexels-photo-625727.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Nature";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=750&w=1260";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Oceans";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/8157741/pexels-photo-8157741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Kiss";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/1024996/pexels-photo-1024996.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Bikes";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/2747540/pexels-photo-2747540.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Cars";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  return myCategories;

}
