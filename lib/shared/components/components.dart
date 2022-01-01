import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article) {
  String ? imageUrl= article['urlToImage'];
  String ?  title= article['title'];
  String ?  date= article['publishedAt'];
  // title= ;
  return
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CachedNetworkImage(
          width: 120.0,
          height: 120.0,
          fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              width: 120.0,
              height: 120.0,
              decoration:
              BoxDecoration(
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        imageUrl: "$imageUrl",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline_sharp),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Expanded(
                  child: Directionality(
                    
                    textDirection: TextDirection.rtl,
                    child: Text(
                      title ?? "Title not Found",
                      style:const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  date ?? "Date Not Found",
                  style:const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    ),
  );
}


Widget myDivider() => Padding(
    padding: EdgeInsets.symmetric(
        horizontal: 30.0),
child: Container(
  height: 1,
  color: Colors.deepOrange,
),);