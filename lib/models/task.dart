class Task {
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.date,
      this.isDone = false});

  Map<String,dynamic>toJson(){
    return {
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "isDone":isDone
    };
  }
  Task.fromJson( Map<String,dynamic> map):this(
    id: map["id"],title: map["title"],description: map["description"],
    date: map["date"],isDone: map["isDone"]
  );
}
