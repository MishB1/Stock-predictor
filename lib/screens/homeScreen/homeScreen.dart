import 'package:flutter/material.dart';
import 'package:stock_predictor/models/favorite_stock_model.dart';
import 'package:stock_predictor/models/news_model.dart';
import 'package:stock_predictor/news/news.dart';
import 'package:stock_predictor/screens/MarketTrends/marketTrends.dart';
import 'package:stock_predictor/screens/NavBar/NavBar.dart';
import 'package:stock_predictor/screens/News/news.dart';
import 'package:stock_predictor/screens/SettingsPage/settings.dart';

class HomeScreen extends StatefulWidget {
  final int? pageIndex;
  const HomeScreen({super.key, this.pageIndex});

  static const String routeName = '/intro';

  @override
  State<HomeScreen> createState() => _AppState();
}

class _AppState extends State<HomeScreen> {
  // final _textController = TextEditingController();

  int currentIndex = 0;

  List<News>? news;
  List<Color> colors = [Colors.black, Colors.teal, Colors.blueAccent];
  List<FavoriteStock> favoriteStocks = [
    FavoriteStock(
      stockPrice: 132.15,
      percentage: 1.25,
      stockName: 'Apple Inc',
      stockImagePath: 'assets/images/apple.png',
    ),
    FavoriteStock(
      stockPrice: 292.92,
      percentage: 2.06,
      stockName: 'Spotify',
      stockImagePath: 'assets/images/spotify.jpg',
    ),
    FavoriteStock(
      stockPrice: 1420.2,
      percentage: 14.50,
      stockName: 'Nvidia',
      stockImagePath: 'assets/images/nvidia.png',
    ),
    FavoriteStock(
      stockPrice: 89.89,
      percentage: -1.50,
      stockName: 'Microsoft',
      stockImagePath: 'assets/images/microsoft.png',
    ),
  ];

  setNews() async {
    final res = await getTopNews();

    setState(() {
      news = res;
    });
  }

  setPageIndex() {
    setState(() {
      currentIndex = widget.pageIndex ?? 0;
    });
  }

  @override
  void initState() {
    setPageIndex();
    setNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> navBarItems = [
      BottomNavigationBarItem(
        label: 'Hot Picks',
        icon: currentIndex == 0
            ? Image.asset('assets/images/hot_pick_selected.png')
            : Image.asset('assets/images/hot_pick_unselected.png'),
      ),
      BottomNavigationBarItem(
        label: 'Home',
        icon: currentIndex == 1
            ? Image.asset('assets/images/home_selected.png')
            : Image.asset('assets/images/home_unselected.png'),
      ),
      BottomNavigationBarItem(
        label: 'Settings',
        icon: currentIndex == 2
            ? Image.asset('assets/images/settings_selected.png')
            : Image.asset('assets/images/settings_unselected.png'),
      ),
    ];

    List<Widget> pages = [
      NewsScreen(),
      MarketTrends(colors: colors, news: news, favoriteStocks: favoriteStocks),
      SettingsPage(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      // drawer: NavBar(),
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavBar(
          items: navBarItems,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          }),
    );
  }
}
