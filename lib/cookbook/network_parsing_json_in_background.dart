import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;
  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  //dynamic关键字：动态类型。如果对象不限于单一类型（没有明确的类型），可使用Object或dynamic关键字
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

List<Photo> parsePhotos(String responseBody) {
  //dynamic关键字：动态类型。如果对象不限于单一类型（没有明确的类型），可使用Object或dynamic关键字
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((item) => Photo.fromJson(item)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/photos');
  // Use the compute function to run parsePhotos in a separate isolate
  //These messages can be primitive values, such as null, num, bool, double, or String, or simple objects such as the List<Photo> in this example.
  return compute(parsePhotos, response.body);
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;
  PhotosList({Key key, this.photos}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,), 
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(photos[index].thumbnailUrl);
      },      
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate Demo'),
      ),
      body: FutureBuilder(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? PhotosList(photos: snapshot.data,) : Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isolate Demo',
      home: MyHomePage(),
    );
  }
}

void main() => runApp(MyApp());