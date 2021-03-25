import 'package:test/test.dart';
import 'package:homeward/models/blog.dart';


void main(){
  group('Testing Blog Model fromJson method', (){

    
    test('The Blog().fromJson method should return a Blog model instance after parsing the Blog json', (){

      var blogJson = {
        'id':'3',
        'title' :'Test Title',
        'imageUrl' : 'http://test.com',
        'createdAt' : '2021-03-24T21:28:43.779Z'

      };
      var result = Blog.fromJson(blogJson);
      
      expect(result.runtimeType == Blog().runtimeType, true);
    });
  });
}
