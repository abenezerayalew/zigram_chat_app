import 'package:flutter/material.dart';

import 'favorite_card.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Favorite Contacts',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            // color: Colors.green,
            height: 120,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, contact) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        FavoriteCard(
                          image: 'assets/images/1.jpg',
                          name: 'ali',
                        ),
                        FavoriteCard(
                          image: 'assets/images/2.jpg',
                          name: 'jhon',
                        ),
                        FavoriteCard(
                          image: 'assets/images/3.jpg',
                          name: 'tom',
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
