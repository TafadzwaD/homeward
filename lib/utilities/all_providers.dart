import 'package:homeward/providers/blogs_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:homeward/providers/authentication_provider.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create:(context) => AuthProvider(),
    lazy: false,
    //make it execute after it's created. Don't wait for use
  ),
  ChangeNotifierProvider(
    create:(context) => BlogProvider(),


  ),
];