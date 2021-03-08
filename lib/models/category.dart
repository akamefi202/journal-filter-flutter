class CategoryGroup {
  String title;
  List<Category> content;

  CategoryGroup({this.title, this.content});
}

class Category {
  String name;
  String url;
  String type;

  Category({this.name, this.url, this.type});
}
