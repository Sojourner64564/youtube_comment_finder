import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/presentation/assets/colors/my_colors.dart';

class FirstPageviewPage extends StatelessWidget{
  const FirstPageviewPage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/4),
          Container(
            color: MyColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text('Введите ссылку на видео',style: TextStyle(color: MyColors.lightGreyTextColor),),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: MyColors.lightGreyTextColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Пример : https://www.youtube.com/watch?v=pyKONWsQ1ek',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {  },
                    child: const Text('Запарсить'),
                  ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}