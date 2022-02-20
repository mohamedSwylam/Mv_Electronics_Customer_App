import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding : EdgeInsets.fromLTRB(8, 0, 8, 0),
                  hintText: 'Search in Shop App',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, size: 20, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 20,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: const [
                  Icon(
                    IconlyLight.infoSquare, size: 12, color: Colors.white,),
                  Text('100% Genuine',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    IconlyLight.infoSquare, size: 12, color: Colors.white,),
                  Text('4 - 7 Days Return',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    IconlyLight.infoSquare, size: 12, color: Colors.white,),
                  Text('Trusted Brands',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
