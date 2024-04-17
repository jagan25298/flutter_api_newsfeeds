import 'package:api_newsfeed/api_class.dart';
import 'package:api_newsfeed/data_server.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late List<Data> _newsfeed = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newsfeedDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsFeedScreen'),
      ),
      body: _newsfeed == null || _newsfeed.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _newsfeed.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text('source: ${_newsfeed[index].source}'),
                      Text('title:${_newsfeed[index].title}'),
                      Text('link:${_newsfeed[index].link}'),
                      Text('descrpition:${_newsfeed[index].description}'),
                      Text('pubDate:${_newsfeed[index].pubDate}'),
                    ],
                  ),
                );
              }),
    );
  }

  Future _newsfeedDetails() async {
    try {
      NewsFeed response = await ApiServer.fetchLessons();
      print('----------newsfeedDetails');
      setState(() {
        _newsfeed = response.data!;
        print('${response.status}');
      });
    } catch (e) {
      print('error loading: $e');
    }
  }
}
