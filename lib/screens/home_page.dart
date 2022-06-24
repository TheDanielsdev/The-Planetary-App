// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:the_planetary/helpers/color_helper.dart';
import 'package:the_planetary/widgets/planet_images.dart';

import '../models/planet_data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Primary_Color,
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 39, 20, 50),
              child: GridView(
                children: DUMMY_DATA
                    .map((e) => PContent(
                          image: e.image,
                          label: e.label,
                          title: e.title,
                        ))
                    .toList(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
