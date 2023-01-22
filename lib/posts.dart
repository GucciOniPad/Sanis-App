import 'package:flutter/material.dart';
import 'https_service.dart';
import 'post_model.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
} 

class _PostsPageState extends State<PostsPage> {
  final HttpService httpService = HttpService();
  final TextEditingController textController = TextEditingController();
  Future<List<Post>> _future = Future.value([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Einträge"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _future = httpService.getPosts(textController.text);
              });
            },
            child: Text("Search"),
          ),
          FutureBuilder(
            future: _future,
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data ?? [];
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: posts
                      .map(
                        (Post post) => ListTile(
                          title: Text(post.name),
                          subtitle: Text("${post.age}"),
                        ),
                      )
                      .toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}


/*
class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  final TextEditingController textController = TextEditingController(text: "");

  PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Einträge"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _future = httpService.getPosts(textController.text);
              });
              
            },
            child: const Text("Search"),
          ),
          FutureBuilder(
            future: _future,
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data ?? [];
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: posts
                      .map(
                        (Post post) => ListTile(
                          title: Text(post.name),
                          subtitle: Text("${post.age}"),
                        ),
                      )
                      .toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
            future: httpService.getPosts(textController.text),
          ),
        ],
      ),
    );

    /*
      FutureBuilder(
        
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data ?? [];
            return ListView(
              children: posts
                  .map(
                    (Post post) => ListTile(
                      title: Text(post.name),
                      subtitle: Text("${post.age}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        future: httpService.getPosts(name),
      ),
    );
    */
  }
}
*/
