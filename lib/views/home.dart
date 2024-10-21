// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/channel_logo.dart';
import 'package:news_app/widgets/logos.dart';

import '../widgets/home_header.dart';
import 'package:http/http.dart' as http;

import 'news_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final Logos logos = Logos();
  void initState() {
    super.initState();
    getArticle();
  }

  List articles = [];
  Future<List<dynamic>> getArticle() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=2a000452057648619a9e74efe22fe597'));
    var data = jsonDecode(response.body.toString());
    var jsonData = data['articles'];
    print(data);
    if (response.statusCode == 200) {
      setState(() {
        articles = jsonData.map((e) => Articles.fromJson(e)).toList();
      });

      return articles;
    }
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hot News ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: logos.channelLogos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ChannelLogos(
                          imageUrl: logos.channelLogos[index],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsPage(
                                    articles: articles,
                                  )));
                        },
                        child: Text(
                          "See All  >",
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: articles.length!,
                      itemBuilder: (BuildContext context, int index) {
                        if (articles.isEmpty) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Card(
                            child: Container(
                              width: 300,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      articles[index].title.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        child: articles[index].urlToImage !=
                                            null
                                            ? Image.network(
                                          articles[index].urlToImage!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error,
                                              stackTrace) {
                                            return Center(
                                                child: Text(
                                                    "Image not available"));
                                          },
                                        )
                                            : Center(
                                            child:
                                            CircularProgressIndicator())),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                            backgroundImage: articles[index]
                                                .urlToImage !=
                                                null
                                                ? NetworkImage(
                                                articles[index].urlToImage!)
                                                : NetworkImage(
                                                'https://picsum.photos/250?image=9')),
                                        title: Text(articles[index].author !=
                                            null
                                            ? articles[index].author.toString()
                                            : "Not Available"),
                                        subtitle: Text(
                                            articles[index].publishedAt != null
                                                ? articles[index]
                                                .publishedAt
                                                .toString()
                                                : " Not Available"),
                                      )),
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
        ));
  }
}


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedTab = 0;
  List _pages = [
    Home(),
    Text("Category"),
    Text("Search"),
    Text("Profile"),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      fixedColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Category",
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}
