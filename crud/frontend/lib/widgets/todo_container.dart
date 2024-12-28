// import 'package:flutter/material.dart';
//
// class TodoContainer extends StatelessWidget {
//   final int id;
//   final String title;
//   final Function onPress;
//   final String desc;
//   final bool isDone;
//   final Function(String id, String title, String desc) onUpdate;
//   const TodoContainer({super.key, required this.id, required this.title, required this.desc, required this.isDone, required this.onPress, required this.onUpdate});
//
//   @override
//   Widget build(BuildContext context) {
//     String updatedTitle = title;
//     String updatedDesc = desc;
//
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: (){
//           showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return Container(
//                   height: MediaQuery.of(context).size.height / 2,
//                   color: Colors.white,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           "Update your Todo",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextFormField(
//                           initialValue: title,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Title',
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextFormField(
//                           initialValue: desc,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Description',
//                           ),
//                         ),
//                         ElevatedButton(
//                             onPressed: () {
//                               onUpdate(id.toString(),updatedTitle,updatedDesc);
//                               Navigator.pop(context);
//                             },
//                             child: Text('Update'))
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         },
//         child: Container(
//           width: double.infinity,
//           height: 120,
//           decoration: BoxDecoration(
//             color: Colors.teal,
//             borderRadius: BorderRadius.all(Radius.circular(4.0))
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(title,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () => onPress(),
//                           icon: Icon(Icons.delete,color: Colors.white,)
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 6,),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Text(desc,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  final int id;
  final String title;
  final Function onPress;
  final String desc;
  final bool isDone;
  final Function(String id, String title, String desc) onUpdate;

  const TodoContainer({
    super.key,
    required this.id,
    required this.title,
    required this.desc,
    required this.isDone,
    required this.onPress,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    String updatedTitle = title;
    String updatedDesc = desc;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Update your Todo",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: title,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                          onChanged: (value) {
                            updatedTitle = value; // Update title
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          initialValue: desc,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                          ),
                          onChanged: (value) {
                            updatedDesc = value; // Update description
                          },
                        ),
                        ElevatedButton(
                            onPressed: () {
                              onUpdate(
                                id.toString(),
                                updatedTitle,
                                updatedDesc,
                              );
                              Navigator.pop(context);
                            },
                            child: Text('Update'))
                      ],
                    ),
                  ),
                );
              });
        },
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => onPress(),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      desc,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
