import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/models/blog.dart';
import 'package:homeward/views/single_blog/blog_entry.dart';

import 'package:intl/intl.dart';

List _mockBlogsResponse = [
  {
    "id": "1",
    "createdAt": "2021-03-24T21:28:43.779Z",
    "title": "Outdoors connecting sensor",
    "imageUrl": "http://lorempixel.com/640/480/abstract"
  },
  {
    "id": "2",
    "createdAt": "2021-03-24T11:45:16.988Z",
    "title": "Ergonomic",
    "imageUrl": "http://lorempixel.com/640/480/technics"
  },
  {
    "id": "3",
    "createdAt": "2021-03-24T09:36:07.027Z",
    "title": "Togo",
    "imageUrl": "http://lorempixel.com/640/480/people"
  },
  {
    "id": "4",
    "createdAt": "2021-03-24T15:42:46.589Z",
    "title": "Highway Representative",
    "imageUrl": "http://lorempixel.com/640/480/technics"
  },
];

blogPoviderMock() {
  List<Blog> formattedBlogList = [];
  _mockBlogsResponse.forEach((blog) {
    formattedBlogList.add(Blog.fromJson(blog));
  });
  formattedBlogList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
  return formattedBlogList.reversed.toList();
}

class BlogsHomeScreenForTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: blogPoviderMock().length,
            itemBuilder: (BuildContext context, int index) {
              return _blogContainer(
                  blog: blogPoviderMock()[index], context: context);
            }),
      ),
    );
  }

  Widget _blogContainer({@required Blog blog, @required BuildContext context}) {
    final String createdAt =
        DateFormat.yMMMEd().add_Hm().format(blog.createdAt);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SingleBlogScreen(
                    blogId: blog.id,
                  )),
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
                    color: Colors.teal,
                  ),
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

void main() {
  blogsScreen() => MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
        home: BlogsHomeScreenForTest(),
      );

  group('All Blogs Screen Widgets Test : ', () {
    testWidgets('Testing if 8 Text Widget Show On Blogs Screen',
        (tester) async {
      var blogs = _mockBlogsResponse;
      tester.pumpWidget(blogsScreen()).then((value) {
        return expect(find.byType(Text), findsNWidgets(blogs.length * 2));
      });
    });
  });
}
