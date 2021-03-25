import 'package:flutter/material.dart';
import 'package:homeward/models/blog.dart';
import 'package:homeward/providers/blogs_provider.dart';
import 'package:homeward/views/single_blog/blog_entry.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
class BlogsHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: Provider.of<BlogProvider>(context).blogs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.hasData) {
                List<dynamic> blogs = snapshot.data;
                return ListView.builder(
                    itemCount: blogs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _blogContainer(
                        blog: snapshot.data[index],
                        context: context
                      );
                    });
              }
              return Center(child: CircularProgressIndicator(),);
            }),
      ),
    );
  }

  Widget _blogContainer({@required Blog blog,@required BuildContext context}) {
    final String createdAt = DateFormat.yMMMEd().add_Hm().format(blog.createdAt);
    return GestureDetector(
      onTap: (){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleBlogScreen(blogId: blog.id,)),
            );

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
