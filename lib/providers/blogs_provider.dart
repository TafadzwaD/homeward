import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:homeward/models/blog.dart';
import 'package:homeward/providers/authentication_provider.dart';
import 'package:homeward/utilities/configurations.dart';


class BlogProvider extends ChangeNotifier {

  Dio dio = new Dio();


  Options opts = Options(
    headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${AuthProvider().bearerToken}',
    },
  );

  Future blogs() {
    print('Bearer token in get blogs ${AuthProvider().bearerToken}');
    return dio.get(
      '${APIEndpoint.blogListUrl}',
      options: opts
    ).then((response){
      if(response.statusCode ==200){

        List<dynamic> blogsList = response.data;
        List<Blog> formattedBlogList = [];
        blogsList.forEach((blog) {
          formattedBlogList.add(Blog.fromJson(blog));
        });
        formattedBlogList.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        return formattedBlogList.reversed.toList();
      }else{
        return null;
      }
    }).catchError((onError){
      print('Error Encountered : ${onError.message}');
      return null;
    });
  }

  Future singleBlog({@required String blogId}) {
    print('Bearer token in get blogs ${AuthProvider().bearerToken}');
    return dio.get(
        '${APIEndpoint.blogListUrl}/$blogId',
        options: opts
    ).then((response){
      if(response.statusCode ==200){
        print('Response from blogs ${response.data}');
        return Blog.fromJson(response.data);
      }else{
        return null;
      }
    }).catchError((onError){
      print('Error Encountered : ${onError.message}');
      return null;
    });
  }
}
