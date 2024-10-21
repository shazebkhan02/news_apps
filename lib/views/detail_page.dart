// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DeatilPage extends StatelessWidget {
  final String urlToimage;
  final String title;
  final String description;
  final String publishedAt;

  const DeatilPage({
    required this.urlToimage,
    required this.title,
    required this.description,
    required this.publishedAt,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: urlToimage!=null?
                Image.network(
                  urlToimage,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ):CircularProgressIndicator()
            ),
            SizedBox(height: 8,),
            Text(title!=null?title:'No Title',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),

            SizedBox(height: 8,),
            Text(description!=null?description:'No Description',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Published At",style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),),
                Text(publishedAt!=null?publishedAt:'No Date',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
