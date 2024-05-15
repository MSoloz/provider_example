import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/ui/page/post/widgets/post_card_widget.dart';
import '../../../state/post_state.dart';


class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<PostState>(
        builder: (context,notifier,child){
          if(notifier.loading){
            return const Center(child: CircularProgressIndicator());
          }else if(notifier.posts.isEmpty){
            return const Center(child: CircularProgressIndicator());
          }else {
            return ListView.builder(
                itemCount: notifier.posts.length,
                itemBuilder: (context,index){
                  return PostCardWidget(post: notifier.posts[index],);
                }
            );
          }
        },
      ),
    );
  }
}
