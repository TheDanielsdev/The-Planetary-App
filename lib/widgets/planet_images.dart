import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/view_items.dart';

// final folio = StateProvider(((ref) => PortFolio_data.PortFolio_data_Items()));

class PContent extends StatefulWidget {
  String image;
  String title;
  String label;

  PContent({
    Key? key,
    required this.image,
    required this.title,
    required this.label,
  }) : super(key: key);

  @override
  State<PContent> createState() => _PContentState();
}

class _PContentState extends State<PContent> {
  // bool _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ViewItems(
                      image: widget.image,
                      label: widget.label,
                      title: widget.title,
                    )))
          },
          child: Container(
              child: Hero(
            tag: widget.image,
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              height: 130,
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontFamily: 'CerebriSansPro-Regular',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
      ]),
    );
  }
}
