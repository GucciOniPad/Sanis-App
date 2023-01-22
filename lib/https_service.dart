import 'dart:convert';
import 'package:http/http.dart';
import 'post_model.dart';

class HttpService {
  final String postsURL = "https://172.25.176.1:8000";
  Future<List<Post>> getPosts(name) async {
    String searchURL = '$postsURL/api/entry/$name';
    Response resp = await get(Uri.parse(searchURL));

    if (resp.statusCode == 200) {
      //List<dynamic> body = jsonDecode('{"text": "foo", "value": 1, "status": false, "extra": null}');
      String body = "";
      //Future<List<Post>> posts =
      //  jsonDecode('[{"id": 0, "name": "Error", "age": 0}]')
      //    .map(
      //    (dynamic item) => Post.fromJson(item),
      //)
      //.toList();
      try {
        List<dynamic> body = jsonDecode(resp.body);
        List<Post> posts = body
            .map(
              (dynamic item) => Post.fromJson(item),
            )
            .toList();
        return posts;
      } catch (FormatException) {
        try {
          body = resp.body;
          //throw "The server response had the wrong format. The message is: $resp";
          List<Post> posts = json.decode(body).cast<String>().toList();
          return posts;
        } catch (e) {
          throw "The server response had the wrong format. \n The error message is: $e \n the Server response is: $resp";
        }
      }
    } else {
      throw "Can't get entries";
    }
  }
}
