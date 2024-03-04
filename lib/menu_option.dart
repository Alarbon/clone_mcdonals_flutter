import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  
  final String titile;
  final String imageURL;
  final int? discount;

  const MenuOption({super.key,required this.titile,required this.imageURL,  this.discount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: discount !=null ? const Color(0xFFC8151D): Colors.grey[50],
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(
                  imageURL,
                  height: 48,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                titile,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: discount!=null ? Colors.white:Colors.black,
                ),
              ),
              discount!=null
              ? Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                      child: Text(
                        '$discount% off',
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              )
              : Container()
            ],
          ),
        ),
        )
    );
  }
}