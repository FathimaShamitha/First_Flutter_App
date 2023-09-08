import 'package:flutter/material.dart';

class MyGridBuilder extends StatefulWidget {
  const MyGridBuilder({Key? key}) : super(key: key);

  @override
  State<MyGridBuilder> createState() => _MyGridBuilderState();
}

class _MyGridBuilderState extends State<MyGridBuilder> {
  List ProfilePic = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9ySx6w03MteA7LmBWIqr5C7rhqOdC8xY2SLkoAN03bMZfXmTVpRmcH3ewSR_pFpxqJM&usqp=CAU",
    "https://shorturl.at/iCKL4",
    "https://shorturl.at/anuQV",
    "https://tinyurl.com/5dmf84s7",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsgCyfu-sXHSnFWwiUjP7gMbfG8kBhF9w6jRoUp-IncsHP1-OZshO7pRdtuSL2xDt2gSE&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz1b6b8-SGhdk0tifwTFwdLdgYe4yGLZJKrooKbsYWO2YPygcFLnU5lrcWhECp4Sau9wg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwJzyQcBu_7EH0wSSW14L4Edxsj3X8AJKcy3UBpQE33iMrZ8Z3SNXmPpEZyqsl898vYwI&usqp=CAU",
  ];

  List Name = [
    "Ahad Shuvo",
    "Lyn R. Lermus",
    "Katherine A. Stanfil",
    "Robert K. Perez",
    "Jason L. Bowling",
    "Joseph A. Bove",
    "Jack M. Peoples"
  ];

  List Time = [
    "10:20 AM",
    "10:40 AM",
    "11:00 AM",
    "11:20 AM",
    "11:40 AM",
    "12:00 AM",
    "12:00 PM"
  ];

  List Date = [
    "03.09.2023",
    "03.09.2023",
    "03.09.2023",
    "03.09.2023",
    "03.09.2023",
    "03.09.2023",
    "03.09.2023"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            itemCount: Name.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 4),
            itemBuilder: (context, int index) {
              return Card(
                elevation: 4,
                child: Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(ProfilePic[index]),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        Name[index],
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Consultation",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            Time[index],
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            Date[index],
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[500],
                        ),
                        child: Center(
                            child: Text(
                          "VIEW DETAILS",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
