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
    title = json['createdAt'];
    createdAt = json['createdAt'];
    imageUrl = json['imageUrl'];
  }
}
