import 'package:flutter/material.dart';
import 'package:mvvm/view/comments_view.dart';
import 'package:mvvm/view/posts/posts_view_assistant.dart';

class BaseMain extends StatefulWidget {
  const BaseMain({Key? key}) : super(key: key);
  static const rout = "main";

  @override
  _BaseMainState createState() => _BaseMainState();
}

class _BaseMainState extends State<BaseMain> {
  int currentPage = 0;

  bool active(int index) => currentPage == index;
  PageStorageBucket pageStorageBucket = PageStorageBucket();

  final pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    navigateTo(int index) {
      setState(() {
        currentPage = index;
      });
      pageController.jumpToPage(index);
    }

    return Scaffold(
      // body: PageStorage(child: list[currentPage],bucket: pageStorageBucket,key: mykey,),
      body: PageView(
        children: [...list],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () => navigateTo(0),
                child: AnimatedContainer(
                  padding: EdgeInsets.all(5),
                  //margin: EdgeInsets.only(bottom: currentPage == 0 ? 10 : 0),
                  duration: Duration(milliseconds: 200),
                  //curve: Curves.easeI,
                  curve: Curves.easeInOutBack,
                  decoration: BoxDecoration(
                    color: currentPage == 0
                        ? Theme.of(context).appBarTheme.color
                        : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color:
                            currentPage == 0 ? Color(0xFFFF6A14) : Colors.white,
                        width: 3),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(1, 1)),
                    ],
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    color: active(0)
                        ? Colors.white
                        : Theme.of(context).iconTheme.color,
                    size: 35,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigateTo(1),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: currentPage == 1
                        ? Theme.of(context).appBarTheme.color
                        : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color:
                            currentPage == 1 ? Color(0xFFFF6A14) : Colors.white,
                        width: 3),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(1, 1)),
                    ],
                  ),
                  child: Icon(
                    Icons.access_time_outlined,
                    color: active(1)
                        ? Colors.white
                        : Theme.of(context).iconTheme.color,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> list = [PostAssistant(), CommentsView()];
