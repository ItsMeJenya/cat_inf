import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat information',
      theme: ThemeData(primarySwatch: Colors.lightBlue,),
      home: PersonWidget(),
    );
  }
}

class FavorWidget extends StatefulWidget {
  @override
  _FavorWidgetState createState() => _FavorWidgetState();
}

class _FavorWidgetState extends State<FavorWidget> {
  bool _isFavorited = false;
  int _favouriteCount = 234;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            onPressed: _toggleFavourite,
            color: Colors.red[500],
          ),

        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text(
                '$_favouriteCount'
            ),
          ),
        ),
      ],
    );
  }
  void _toggleFavourite(){
    setState(() {
      if (_isFavorited){
        _isFavorited = false;
        _favouriteCount--;
      } else{
        _isFavorited = true;
        _favouriteCount++;
      }
    }
    );
  }
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cats, Tardar Sauce')),
      body: Container(child: _buildMainColumn()),
    );
  }


  Widget _buildMainColumn() =>
      ListView(
        children: [
          _buildTopImage(),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: _buildRating(),
                  ),
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                    child: (Container(
                      margin: EdgeInsets.all(10),
                      child: _buildAction(),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: (
                        Container(
                          margin: EdgeInsets.all(10),
                          child: _buildDescription(),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildTopImage()=> Container(
    child: Card(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      elevation: 5,
      child: Image.asset(
        'assets/images/img.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget _buildRating()=> ListTile(
    title: Text('Grumpy Cat',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      ),
    ),
    subtitle: Text("You can't make Tardar smile!"),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FavorWidget()
      ],
    ),
  );

  Widget _buildAction() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildButton('Grumpy', Icons.sentiment_dissatisfied_outlined, Colors.black),
      _buildButton('Carry to mouse', Icons.mouse, Colors.black),
      _buildButton('Celebrity', Icons.star_rate_outlined, Colors.black),
    ],
  );

  Widget  _buildButton(String label, IconData icon, Color color) => Column(
    children: [
      Icon(icon, color: Colors.black,),
      Container(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );

  Widget _buildDescription()=>Text(
    'Tardar Sauce (April 4, 2012 – May 14, 2019), nicknamed Grumpy Cat, was an American Internet celebrity cat. '
        'She was known for her permanently "grumpy" facial appearance, which was caused by an underbite and feline dwarfism. '
        'She came to prominence when a photograph of her was posted on September 22, 2012, on social news website '
        'Reddit by Bryan Bundesen, the brother of her owner Tabatha Bundesen. Lolcats and parodies created from the photograph'
        ' by Reddit users became popular. She was the subject of a popular Internet meme in which humorously negative, '
        'cynical images were made from photographs of her.',
    softWrap: true,
    style: TextStyle(
      fontSize: 23.0,
    ),
  );
}

