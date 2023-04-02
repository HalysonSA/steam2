import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Titulo navbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Game {
  String image;
  String name;

  Game({required this.image, required this.name});
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Game> games = [
    Game(image: 'gtav', name: 'Grand Theft Auto V'),
    Game(image: 'cs', name: 'Counter Strike'),
    Game(image: 'pubg', name: 'PlayerUnknown\'s Battlegrounds'),
    Game(image: 'warzone', name: 'Call of Duty: Warzone'),
    Game(image: 'dota2', name: 'Dota 2'),
  ];

  searchBox() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width - 100,
      color: Color.fromRGBO(69, 72, 78, 1),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 50,
          height: 50,
          child: Image.asset('assets/images/steam.png'),
        ),
        Container(
          height: 50,
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  gameCard({dynamic image = String, dynamic name = String}) {
    return Container(
      height: 220,
      width: 300,
      color: Color.fromRGBO(26, 54, 79, 1),
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/$image.jpg'),
              ),
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Text(
            '$name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              'R\$ 0,00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 49, 64, 1),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [searchBox()],
        )),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Center(
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(30, 31, 36, 1),
        bottom: (PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'MENU',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'LISTA DE DESEJOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'CARTEIRA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        ' (R\$ 0,00)',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Em destaque',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Row(children: [
                for (var game in games)
                  gameCard(image: game.image, name: game.name),
              ]),
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Loja',
            backgroundColor: Color.fromRGBO(30, 31, 36, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Noticias',
            backgroundColor: Color.fromRGBO(30, 31, 36, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield),
            label: 'Steam Guard',
            backgroundColor: Color.fromRGBO(30, 31, 36, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
            backgroundColor: Color.fromRGBO(30, 31, 36, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
            backgroundColor: Color.fromRGBO(30, 31, 36, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(34, 109, 186, 1),
        unselectedItemColor: const Color(0xFFBDBDBD),
        onTap: _onItemTapped,
      ),
    );
  }
}
