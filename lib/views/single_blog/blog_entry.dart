import 'package:flutter/material.dart';
import 'package:homeward/models/blog.dart';
import 'package:homeward/providers/blogs_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
class SingleBlogScreen extends StatelessWidget {
  final String blogId;

  const SingleBlogScreen({@required this.blogId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: Provider.of<BlogProvider>(context).singleBlog(blogId: blogId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print('This is the snapshot data ${snapshot.data}');
              if (snapshot.hasData) {
                Blog blog = snapshot.data;
                return Center(
                  child: _blogContainer(
                    blog: blog,
                  ),
                );
              }
              return Center(child: CircularProgressIndicator(),);
            }),
      ),
    );
  }

  Widget _blogContainer({@required Blog blog}) {
    final String createdAt = DateFormat.yMMMEd().add_Hm().format(blog.createdAt);

    return GestureDetector(
      onTap: (){
        print('Clicked on ${blog.id}');
      },
      child: Container(
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              // Container(
              //   width: 60,
              //   height: 60,
              //   color: mainThemeColor,
              // ),
              Card(
                elevation: 50,
                color: Colors.white,
                shadowColor: Colors.black,
                child: ListTile(
                  leading: Container(
                      height: 140,
                      width: 80,
                      child: Image.network(
                        blog.imageUrl,
                        height: 130,
                      )),
                  title: Text(
                    blog.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(createdAt),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
