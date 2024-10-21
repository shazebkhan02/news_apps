// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChannelLogos extends StatelessWidget {
  final String imageUrl;

  const ChannelLogos({Key? key,required this.imageUrl,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300,width: 1),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );;
  }
}
