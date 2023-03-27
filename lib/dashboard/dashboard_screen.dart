import 'dart:convert';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List _cards = [];

  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  void _fetchCards() async {
    String jsonData = '[{"title":"Card 1","image":"lib/dashboard/assets/leave_application.png"},{"title":"Card 2","image":"lib/dashboard/assets/class.png"},{"title":"Card 3","image":"lib/dashboard/assets/class.png"},{"title":"Card 6","image":"lib/dashboard/assets/class.png"},{"title":"Card 6","image":"lib/dashboard/assets/class.png"},{"title":"Card 6","image":"lib/dashboard/assets/class.png"},{"title":"Card 6","image":"lib/dashboard/assets/class.png"},{"title":"Card 6","image":"lib/dashboard/assets/school_bus_location.png"},{"title":"Card 6","image":"lib/dashboard/assets/school_fees.png"},{"title":"Card 6","image":"lib/dashboard/assets/school_fees.png"}]';
    setState(() {
      _cards = jsonDecode(jsonData);
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Dashboard'),
    ),
    body: GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        _cards.length,
        (index) => _buildCard(
          _cards[index]['title'],
          _cards[index]['image'],
          index,
        ),
      ),
    ),
  );
}


Widget _buildCard(String title, String imagePath, int index) {
  Color bgColor = index % 3 == 0 ? Colors.white : Colors.grey.shade700;
  return GestureDetector(
    onTap: () => onCardTap(title),
    child: Card(
      color: bgColor,
      child: Column(
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(height: 8),  
          Text(title),
        ],
      ),
    ),
  );
}

  void onCardTap(String title) {
    print('Card $title tapped');
  }
}
