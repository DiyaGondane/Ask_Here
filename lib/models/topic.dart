
class Topic {
  String id;
  String name;
  String color;
  List tags;

  Topic.fromMap(Map<String,dynamic> data){
    id = data["id"];
    name = data["name"];
    color = data["data"];

  }
}