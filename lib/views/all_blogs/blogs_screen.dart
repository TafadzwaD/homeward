import 'package:flutter/material.dart';
import 'package:homeward/models/blog.dart';
import 'package:homeward/providers/authentication_provider.dart';
import 'package:homeward/providers/blogs_provider.dart';
import 'package:homeward/utilities/theme_utilities.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
class BlogsHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Bearer token in blogs ${AuthProvider().bearerToken}');
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: Provider.of<BlogProvider>(context).blogs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print('This is the snapshot data ${snapshot.data}');
              if (snapshot.hasData) {
                List<dynamic> blogs = snapshot.data;
                return ListView.builder(
                    itemCount: blogs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _blogContainer(
                        blog: Blog(
                          id: blogs[index]['id'],
                          title: blogs[index]['title'],
                          imageUrl: blogs[index]['imageUrl'],
                          createdAt: DateTime.parse(blogs[index]['createdAt']),
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  Widget _blogContainer({@required Blog blog}) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          // Container(
          //   width: 60,
          //   height: 60,
          //   color: mainThemeColor,
          // ),
          Container(
            margin: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: Container(
                  height: 130,
                  width: 80,
                  child: Image.network(
                    blog.imageUrl,
                    height: 130,
                  )),
              title: Text(
                blog.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(DateFormat.yMMMEd().format(blog.createdAt)),
            ),
          )
        ],
      ),
    );
  }
}
