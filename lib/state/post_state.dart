import 'package:flutter/cupertino.dart';
import '../model/post.dart';
import '../resource/post_service.dart';


class PostState with ChangeNotifier {
  final PostService postService = PostService();

  bool _loading = false;
  bool get loading => _loading;

  enableLoading(){
    _loading = true;
    notifyListeners();
  }

  disableLoading(){
    _loading = false;
    notifyListeners();
  }

  List<Post> _posts = [];
  List<Post> get posts => _posts;


  Future<void> fetchPosts()async{
    enableLoading();
    _posts = await postService.getPosts();
    notifyListeners();
    disableLoading();
  }

  init(){
    fetchPosts();
    notifyListeners();
  }
}