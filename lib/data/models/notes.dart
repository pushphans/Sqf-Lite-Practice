class Notes {
  int? id;
  String title;
  String createdAt;

  Notes({this.id, required this.title, required this.createdAt});

  factory Notes.fromMap(Map<String, dynamic> map) =>
      Notes(id: map['id'], title: map['title'], createdAt: map['createdAt']);

  Map<String, dynamic> toMap() => {'title': title, 'createdAt': createdAt};
}
