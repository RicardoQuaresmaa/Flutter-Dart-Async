import 'networking.dart';

String url = 'https://recipe-puppy.p.rapidapi.com/?p=';

class FoodData {
  Future<List<String>> getTitle(int page) async {
    NetworkHelper networkHelper = NetworkHelper(url: url, count: page);
    var response = await networkHelper.getData();
    List<String> title = [];
    for (var res in response['results']) {
      title.add(res['title']);
    }
    return title;
  }

  Future<List<String>> getImage(int page) async {
    NetworkHelper networkHelper = NetworkHelper(url: url, count: page);
    var response = await networkHelper.getData();
    List<String> image = [];
    for (var res in response['results']) {
      image.add(res['thumbnail']);
    }
    return image;
  }

  Future<List<String>> getRecipe(int page) async {
    NetworkHelper networkHelper = NetworkHelper(url: url, count: page);
    var response = await networkHelper.getData();
    List<String> recipe = [];
    for (var res in response['results']) {
      recipe.add(res['ingredients']);
    }
    return recipe;
  }
}