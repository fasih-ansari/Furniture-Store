import 'package:ecommerce_app/screens/categories_feeds.dart';
import 'package:ecommerce_app/screens/feeds.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath':
          'https://img.freepik.com/free-vector/realistic-phono-device_52683-29765.jpg?size=338&ext=jpg',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath':
          'https://thumbs.dreamstime.com/b/blue-oversize-knit-sweater-hanger-fresh-plants-isolated-abstract-colorful-background-composition-clothes-banner-concept-189223692.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath':
          'https://media.gq.com/photos/588232d7402b722e7ade3045/3:2/w_3000,h_2000,c_limit/adidas-ultra-boost-01-2.jpg'
    },
    {
      'categoryName': 'Health & Beauty',
      'categoryImagesPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrSKTVGSDEAFAOL2hurOr96FazRwFg5uv-cDhyuaL5massNC3dwEr4f5nUkU6OLbKaUnM&usqp=CAU'
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW4QcWiFX_uNbfiymb4GlBjFDOquY9d_8h3A&usqp=CAU',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath':
          'https://www.blueloft.com/alexandria/uploads/sliders/OGXsZw1588581236.png',
    },
    {
      'categoryName': 'Watches',
      'categoryImagesPath':
          'https://royalwrist.pk/wp-content/uploads/2021/09/slider-3.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoriesFeedsScreen.routeName,
                arguments: '${categories[widget.index]['categoryName']}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                      categories[widget.index]['categoryImagesPath']?.toString() ??
                          ''),
                  fit: BoxFit.cover),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categories[widget.index]['categoryName']?.toString() ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).textSelectionColor,
              ), // TextStyle
            ), // Text
          ), // Container
        ) // Positioned
      ],
    );
  }
}
