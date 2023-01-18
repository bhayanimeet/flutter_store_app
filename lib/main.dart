import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_1_1/views/res/Global.dart';

void main() {
  runApp(
    const CupertinoApp(home: HomePage(),debugShowCheckedModeBanner: false,),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentDate = DateTime.now();
  int currentPage = 0;
  TextEditingController text = TextEditingController();
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(
            index: currentPage,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 135,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: const Color(0xfff9f9f9),
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.shade300, width: 2),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 17, bottom: 10),
                        child: const Text(
                          "Cupertino Store",
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ...Global.itemList.map(
                            (e) => Container(
                          padding: const EdgeInsets.only(top: 20),
                          height: 102,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: 70,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(e['image'],
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e['title']}",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "${e['price']}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (e['var'] == false) {
                                            e['var'] = true;
                                            Global.image = e['image'];
                                            Global.title = e['title'];
                                            Global.price = e['price'];
                                            Global.value = e['price2'];
                                            Map detail = {
                                              'image': Global.image,
                                              'title': Global.title,
                                              'price': Global.price,
                                              'value': Global.value,
                                            };
                                            Global.purchaseItemList.addAll([detail]);
                                            for (int i = 0;
                                            i < Global.purchaseItemList.length;
                                            i++) {
                                              Global.total = (Global.total +
                                                  Global.purchaseItemList[i]
                                                  ['value'])
                                                  .toInt();
                                              Global.purchaseItemList[i]['value'] = 0;
                                            }
                                          } else if (e['var'] == true) {
                                            e['var'] = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        padding:
                                        const EdgeInsets.only(right: 15),
                                        child: (e['var'] == false)
                                            ? const Icon(
                                            CupertinoIcons.add_circled)
                                            : const Icon(Icons.done),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 2,
                                color: Colors.grey.shade300,
                                margin: const EdgeInsets.only(right: 15),
                                width: MediaQuery.of(context).size.width * 0.75,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                child: Column(
                  children: [
                    CupertinoSearchTextField(
                      borderRadius: BorderRadius.circular(10),
                      controller: text,
                      prefixInsets:
                      const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      placeholder: "Search",
                    ),
                    ...Global.mySearchList.map(
                          (e) => Container(
                        padding: const EdgeInsets.only(top: 20),
                        height: 102,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 70,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(e['image'],
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${e['title']}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "${e['price']}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (e['var'] == false) {
                                          e['var'] = true;
                                          Global.image = e['image'];
                                          Global.title = e['title'];
                                          Global.price = e['price'];
                                          Global.value = e['price2'];
                                          Map detail = {
                                            'image': Global.image,
                                            'title': Global.title,
                                            'price': Global.price,
                                            'value': Global.value,
                                          };
                                          Global.purchaseItemList.addAll([detail]);
                                          for (int i = 0; i < Global.purchaseItemList.length; i++) {
                                            Global.total = (Global.total + Global.purchaseItemList[i]['value']).toInt();
                                            Global.purchaseItemList[i]['value'] = 0;
                                          }
                                        } else if (e['var'] == true) {
                                          e['var'] = false;
                                        }
                                      });
                                    },
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: (e['var'] == false)
                                            ? const Icon(
                                            CupertinoIcons.add_circled)
                                            : const Icon(Icons.done)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 2,
                              color: Colors.grey.shade300,
                              width: MediaQuery.of(context).size.width * 0.73,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 135,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: const Color(0xfff9f9f9),
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.shade300, width: 2),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 17, bottom: 10),
                        child: const Text(
                          "Shopping Cart",
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 170,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              clearButtonMode: OverlayVisibilityMode.editing,
                              placeholder: "Name",
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child: Icon(Icons.person,
                                    color: Colors.grey.shade400, size: 30),
                              ),
                            ),
                            CupertinoTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              clearButtonMode: OverlayVisibilityMode.editing,
                              placeholder: "Email",
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child: Icon(Icons.email,
                                    color: Colors.grey.shade400, size: 30),
                              ),
                            ),
                            CupertinoTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              clearButtonMode: OverlayVisibilityMode.editing,
                              placeholder: "Location",
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child: Icon(Icons.location_on_sharp,
                                    color: Colors.grey.shade400, size: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.watch_later_outlined,
                                  color: Colors.grey.shade400, size: 30),
                            ),
                            Text("Delivery Time",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade400)),
                            const Spacer(),
                            Text(
                              "${months[currentDate.month - 1]} ${currentDate.day}, ${currentDate.year} ${currentDate.hour}:${currentDate.minute}",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 140,
                        child: CupertinoDatePicker(
                          dateOrder: DatePickerDateOrder.dmy,
                          backgroundColor: Colors.white,
                          initialDateTime: DateTime.now(),
                          use24hFormat: false,
                          maximumYear: 2100,
                          minimumYear: 1900,
                          onDateTimeChanged: (dateTime) {
                            setState(() {
                              currentDate = dateTime;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...Global.purchaseItemList.map(
                            (e) => Container(
                          padding: const EdgeInsets.only(top: 20),
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 70,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image(
                                    image: AssetImage(e['image']),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${e['title']}",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "${e['price']}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(right: 15),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${e['price']}",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 150,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Shipping : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.purchaseItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "\$ 19.32",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: (Global.purchaseItemList.isEmpty)
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Tax : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.purchaseItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "10.21",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.purchaseItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 1,
                                width: 100,
                                color: (Global.purchaseItemList.isEmpty)?Colors.white:Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Total : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.purchaseItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$ ${Global.total + 19.32 + 10.21}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.purchaseItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CupertinoTabBar(
            height: 60,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey.shade300,
            currentIndex: currentPage,
            onTap: (val) {
              setState(() {
                currentPage = val;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: "Cart",
              ),
            ],
          ),
        ],
      ),
    );
  }
}