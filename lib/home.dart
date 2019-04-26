import 'package:flutter/material.dart';
import './data/data_users.dart';
import './data/data_post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double screenSizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 10,
          margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('img/users/lindsey_morgan.jpg'),
            ),
          ),
        ),
        title: Text('lindsey_morgan'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          //friends
          Container(
            height: screenSizeHeight / 6,
            width: double.infinity,
            child: ListView.builder(
              itemCount: users.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        right: screenSizeWidth / 125,
                        left: screenSizeWidth / 100,
                        top: screenSizeHeight / 40,
                      ),
                      height: screenSizeHeight / 10,
                      width: screenSizeWidth / 5.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.redAccent),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("img/users/" + users[index]['avatar']),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(users[index]['name']),
                    )
                  ],
                );
              },
            ),
          ),
          //post
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          //margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'img/users/' + post[index]['avatar']),
                            ),
                          ),
                        ),
                        title: Text(post[index]['user']),
                        subtitle: Text(post[index]['location']),
                        trailing: Icon(Icons.more_vert),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: screenSizeHeight / 3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'img/post/' + post[index]['image'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            bottom: screenSizeWidth / 16,
                            left: screenSizeWidth / 16,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    post[index]['like'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: screenSizeWidth / 38,
                            left: screenSizeWidth / 15,
                            child: Text(
                              post[index]['comment'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: screenSizeWidth / 20,
                            right: screenSizeWidth / 25,
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: screenSizeWidth / 20,
                            right: screenSizeWidth / 8,
                            child: Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.tv,
                color: Colors.redAccent,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.message,
                color: Colors.redAccent,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.redAccent,
                size: 30,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
