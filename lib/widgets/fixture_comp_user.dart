import 'package:flutter/material.dart';
import 'package:soccer_app/view/shared/circular_image.dart';
import 'package:soccer_app/view/view_fixture_detail_screen/user_fixture_detail_screen.dart';
import 'package:soccer_app/route/route.dart';
import '../models/model.dart';

class FixtureComponent extends StatelessWidget {
  final Fixture fixture;

  FixtureComponent({required this.fixture});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          UserFixtureDetail.routeName,
          arguments: FixtureRoutArgsForDetail(fixture: fixture),
        );
      },
      child: Container(
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 15,
          color: Colors.white,
          shadowColor: Colors.black45,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircularImage(
                            placeholderText: fixture.firstClub[0].toUpperCase(),
                            radius: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(fixture.firstClub),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(fixture.matchDate.toString()),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(fixture.stadiumName),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircularImage(
                            placeholderText:
                                fixture.secondClub[0].toUpperCase(),
                            radius: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(fixture.secondClub),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
