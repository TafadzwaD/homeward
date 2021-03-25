class Blog {
   String id;
   String title;
   String imageUrl;
   DateTime createdAt;

  Blog({
    this.id,
    this.title,
    this.imageUrl,
    this.createdAt,
  });


  Blog.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    createdAt = DateTime.parse(json['createdAt']); // formatting it to DateTime for sorting purposes
    imageUrl = json['imageUrl'];
  }
}
