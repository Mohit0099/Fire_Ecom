import 'package:ecom_firebase/model/homemodel.dart';
import 'package:flutter/material.dart';

class Listcard extends StatelessWidget {
  String? image;
  String? text;
  int? count;
  int? index1;
  Listcard({
    Key? key,
    this.image,
    this.text,
    this.count,
    this.index1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 700,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index1) {
          return Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 80,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.network("$image"),
                      ),
                      Text("$text"),
                    ],
                  ),
                ),
                // Container(
                //   child: Text(contents[index].title.toString()),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
