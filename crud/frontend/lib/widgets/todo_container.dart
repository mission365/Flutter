import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  final int id;
  final String title;
  final Function onPress;
  final String desc;
  final bool isDone;
  const TodoContainer({super.key, required this.id, required this.title, required this.desc, required this.isDone, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(4.0))
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                    IconButton(
                        onPressed: () => onPress(),
                        icon: Icon(Icons.delete,color: Colors.white,)
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(desc,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
