import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: PageView(
        children: [
          Center(
            child: Text('Banner 1',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text('Banner 2',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text('Banner 2',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
