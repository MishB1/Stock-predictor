import 'package:flutter/material.dart';
import 'package:stock_predictor/components/favoriteStockWidget.dart';
import 'package:stock_predictor/models/favorite_stock_model.dart';
import 'package:stock_predictor/models/news_model.dart';
import 'package:stock_predictor/news/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/intro';

  @override
  State<HomeScreen> createState() => _AppState();
}

class _AppState extends State<HomeScreen> {
  final _textController = TextEditingController();
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
    news = await getTopNews();
  }

  @override
  void initState() {
    setNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      // drawer: NavBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'Market Trends',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Trending News',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: colors[index],
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 3),
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                spreadRadius: 1,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news?[index].title ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Source: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  news?[index].source ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 40,
              ),
              Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: favoriteStocks.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    FavoriteStock favoriteStock = favoriteStocks[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildFavoriteStock(
                        stockPrice: favoriteStock.stockPrice,
                        percentage: favoriteStock.percentage,
                        stockName: favoriteStock.stockName,
                        stockImagePath: favoriteStock.stockImagePath,
                      ),
                    );
                  },
                ),
              ),
              // TextField(
              //   controller: _textController,
              //   style: TextStyle(color: Colors.white),
              //   decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(width: 1.0, color: Colors.white),
              //         borderRadius: BorderRadius.circular(50.0),
              //       ),
              //       prefixIcon: Icon(
              //         Icons.search,
              //         color: Colors.white,
              //       ),
              //       suffixIcon: IconButton(
              //           onPressed: () {
              //             _textController.clear();
              //           },
              //           icon: Icon(
              //             Icons.clear,
              //             color: Colors.white,
              //           )),
              //       hintText: "Search your stock here...",
              //       hintStyle: TextStyle(color: Colors.white, fontSize: 15)),
              // ),
            ]),
          )
        ],
      ),
    );
  }
}
