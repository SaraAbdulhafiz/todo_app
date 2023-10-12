class TaskModel {
  String id;

  String title;

  String description;

  int date;

  bool isDone;

  TaskModel({
    this.id = "",
   required this.title,
   required this.description,
   required this.date,
    this.isDone = false ,
  });

  TaskModel.FromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          date: json['date'],
          title: json['title'],
          isDone: json['isDone'],
          description: json['description'],
        );


   Map<String , dynamic>toJson(){
     return {
       "id" : id ,
       "title" : title,
       "date" : date,
       "isDone" : isDone ,
       "description" : description
     };
   }

// TaskModel FromJson(Map<String , dynamic>json){
// return TaskModel(
// id: json['id'],
//  date:json['date'],
//  title: json['title'],
// isDone: json['isDone'],
//  description: json['description'],
// );

// }
}
