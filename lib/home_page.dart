import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moto_gp_app/rider_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((event) {
      if (event.notification != null) {
        //ada notifikasi yang masuk
        print(event.notification!.title);
      }
    });
    // FirebaseMessaging _firebaseMessaging =
    //     FirebaseMessaging.instance; // Change here
    // _firebaseMessaging.getToken().then((token) {
    //   print("token is $token");
    // });

    //kita akan mendengarkan notifikasi
    //root project
    super.initState();

//ketika notifikasi di klik dan keadaannya on Terminated

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        var _routeName = message.data['route'];
        Navigator.of(context).pushNamed(_routeName);
      }
    });

//ketika notifikasi di klik dan keadaannya on background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {});

//ketika on forground
    FirebaseMessaging.onMessage.listen((event) {
      if (event.notification != null) {
        //ada notifikasi yang masuk
        print(event.notification!.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Color.fromRGBO(23, 28, 33, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Image.asset(
                    'images/moto_gp3.png',
                    fit: BoxFit.fitWidth,
                    height: 25,
                  ),
                  background: Image(
                    image: AssetImage('images/riders.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(text: "Riders"),
                      new Tab(text: "Teams"),
                      new Tab(text: "Circuit"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Rider(),
              Icon(Icons.movie),
              Icon(Icons.games),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
