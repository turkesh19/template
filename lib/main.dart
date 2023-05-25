import 'package:colortemp2/network_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(colortemp2());
}

class colortemp2 extends StatelessWidget {
  List dateoftime = ['3hrs ago', '2hrs ago', '4hrs ago', '2022', null];
  List content = [
    'Prompted to tranning',
    'Prompted to tranning',
    'Prompted to hero',
    'Prompted to tranning',
    null
  ];
  List numberofdoc = [
    '2 Docs',
    '1 Docs',
    '5 Docs',
    '3 Docs',
    '4 Docs',
  ];

  List filters = [
    'General',
    'Law',
    'Public Purchese',
    'Promotion',
    'Recurment',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap: () {}, child: Icon(Icons.arrow_back)),
          backgroundColor: Color(0xff1E7FB2),
          title: GestureDetector(
              onTap: () async {
                Network_Network newtworkHelper = Network_Network();
                await newtworkHelper.getWeatherNews();
              },
              child: Text("Notice")),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ("Search"),
                      suffix: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(color: Color(0xff6E6E6E)),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${filters[index]}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return NoticeContent(
                    dateoftime: dateoftime[index] ?? "No time Availabe",
                    content:
                        content[index] ?? "No Content Available at the moment",
                    numberofdoc: numberofdoc[index] ?? "No Docs Available",
                  );
                },
              ),
              // NoticeContent(
              //   dateoftime: "6",
              //   content:
              //       "Regarding being promoted to the post of Deputy Inspector General of Police (2080-01-06)",
              //   numberofdoc: "2 Docs",
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // NoticeContent(
              //   dateoftime: "2022-01-12",
              //   content:
              //       "Notice regarding the publication of promotion recommendation list from the post of Senior...",
              //   numberofdoc: "3 Docs",
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // NoticeContent(
              //   dateoftime: "2021-11-4",
              //   content:
              //       "Regarding the promotion and posting of Senior Deputy Inspectors of Technical Police. (2079-12-23)",
              //   numberofdoc: "5 Docs",
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // NoticeContent(
              //   dateoftime: "2021-11-4",
              //   content:
              //       "Regarding the promotion and posting of Senior Deputy Inspectors of Technical Police. (2079-12-23)",
              //   numberofdoc: "5 Docs",
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // NoticeContent(
              //   dateoftime: "2021-11-4",
              //   content:
              //       "Regarding the promotion and posting of Senior Deputy Inspectors of Technical Police. (2079-12-23)",
              //   numberofdoc: "5 Docs",
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // NoticeContent(
              //   dateoftime: "2021-11-4",
              //   content:
              //       "Regarding the promotion and posting of Senior Deputy Inspectors of Technical Police. (2079-12-23)",
              //   numberofdoc: "5 Docs",
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // NoticeContent(
              //   dateoftime: "2021-11-4",
              //   content:
              //       "Regarding the promotion and posting of Senior Deputy Inspectors of Technical Police. (2079-12-23)",
              //   numberofdoc: "5 Docs",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoticeContent extends StatelessWidget {
  final dateoftime;
  final content;
  final numberofdoc;

  NoticeContent({this.dateoftime, this.content, this.numberofdoc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$dateoftime",
            style: TextStyle(color: Color(0xff6e6e6e)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "$content",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffEDEDED),
              ),
              child: Row(
                children: [
                  Icon(Icons.book),
                  Text("$numberofdoc"),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
