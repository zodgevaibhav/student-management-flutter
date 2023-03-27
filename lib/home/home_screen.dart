import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/commons/api_endpoint.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _cards = [];

  @override
  void initState() {
    super.initState();
    _fetchHomeScreen();
  }

  Future<void> _fetchHomeScreen() async {
    final response = await http.get(Uri.parse(APIEndPoints.BASE_URL+APIEndPoints.PARENT_ASSET));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final cards = List.generate(
        data.length,
        (index) => _buildCard(data[index]['title'], data[index]['image']),
      );

      setState(() {
        _cards = cards;
      });
    } else {
      throw Exception('Failed to fetch cards');
    }
  }

  void onCardTap(String cardName) {
    print(cardName + ' tapped');
  }

  Widget _buildCard(String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        onCardTap(title);
      },
      child: Card(
        child: Column(
          children: <Widget>[
             if (imageUrl.startsWith('asset'))
              Image.asset(imageUrl.substring(6)), // remove 'asset:' prefix
            if (imageUrl.startsWith('network'))
              Image.network(imageUrl.substring(8)),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _cards,
      ),
    );
  }
}
