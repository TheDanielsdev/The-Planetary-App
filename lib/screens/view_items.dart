import 'package:flutter/material.dart';
import 'package:the_planetary/helpers/color_helper.dart';

class ViewItems extends StatelessWidget {
  String image;
  String label;
  String title;
  ViewItems(
      {Key? key, required this.image, required this.label, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(children: [
        Stack(children: [
          Hero(
            tag: image,
            child: Container(
                height: 320,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover))),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    AppColor.Secondary_Color.withOpacity(0.9),
                    AppColor.Tertiary_Color.withOpacity(0.9)
                  ])),
            ),
          ),

          //Curvy top container
          Positioned(
            top: 290,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                  color: AppColor.Primary_Color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(30, 30),
                      topRight: Radius.elliptical(30, 30))),
            ),
          ),
          const _appBar()
        ]),

        //main body
        Expanded(
            child: Container(
          alignment: Alignment.topCenter,
          color: AppColor.Primary_Color,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 19),
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: 'CerebriSansPro-Regular',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(label,
                      style: const TextStyle(
                          fontFamily: 'CerebriSansPro-Regular',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),

                  const SizedBox(
                    height: 15,
                  ),

                  //this place would or should later in the future be hndled using PageView() and the buildDot below it
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain)),
                  )
                ],
              ),
            ),
          ),
        ))
      ]),
    ));
  }
}

class _appBar extends StatelessWidget {
  const _appBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            const Spacer(),
            Container()
          ],
        ),
      ),
    );
  }
}
