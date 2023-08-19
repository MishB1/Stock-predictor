import 'package:flutter/material.dart';

buildFavoriteStock({
  Color? textColor,
  required num stockPrice,
  required num percentage,
  required String stockName,
  required String stockImagePath,
}) {
  return Container(
    width: 150,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(stockImagePath),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          stockName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "\$$stockPrice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "$percentage%",
              style: TextStyle(
                color: percentage > 0 ? Colors.green : Colors.red,
              ),
            )
          ],
        )
      ],
    ),
  );
}
