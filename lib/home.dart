import 'package:flutter/material.dart';
import 'package:flutterapp/CartAnimation.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _key = GlobalKey();
  Offset _endOffset;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) {
      // Get the location of the "shopping cart"
      _endOffset = (_key.currentContext.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Shop",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Easy Cart Animation $index',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              // Get the position of the current widget when clicked, and pass in overlayEntry
                              var _overlayEntry = OverlayEntry(builder: (_) {
                                RenderBox box = context.findRenderObject();
                                var offset = box.localToGlobal(Offset.zero);
                                return
                                    // EasyCartAnimation(
                                    //   startPosition: _endOffset,
                                    //   endPosition: offset,
                                    //   height: 14,
                                    //   width: 14,
                                    //   color: Colors.blue,
                                    //   dxCurveAnimation: 55,
                                    //   dyCurveAnimation: 250,
                                    //   opacity: 0.5,
                                    // );
                                    CartAnimation(
                                  startPosition: _endOffset,
                                  endPosition: offset,
                                  height: 50,
                                  width: 50,
                                  color: Colors.blue,
                                  dxCurveAnimation: 55,
                                  dyCurveAnimation: 250,
                                  opacity: 0.9,
                                  image:
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png",
                                );
                              });
                              // Show Overlay
                              Overlay.of(context).insert(_overlayEntry);
                              // wait for the animation to end
                              Future.delayed(Duration(milliseconds: 800), () {
                                _overlayEntry.remove();
                                _overlayEntry = null;
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              // Get the position of the current widget when clicked, and pass in overlayEntry
                              var _overlayEntry = OverlayEntry(builder: (_) {
                                RenderBox box = context.findRenderObject();
                                var offset = box.localToGlobal(Offset.zero);
                                return
                                    // Container(
                                    //   child: Column(
                                    //     children: [
                                    //       Text("data"),
                                    //       EasyCartAnimation(
                                    //         startPosition: offset,
                                    //         endPosition: _endOffset,
                                    //         height: 24,
                                    //         width: 24,
                                    //         color: Colors.red,
                                    //         dxCurveAnimation: 250,
                                    //         dyCurveAnimation: 50,
                                    //         opacity: 0.5,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // );

                                    // Text("as");
                                    //     EasyCartAnimation(
                                    //   startPosition: offset,
                                    //   endPosition: _endOffset,
                                    //   height: 24,
                                    //   width: 24,
                                    //   color: Colors.red,
                                    //   dxCurveAnimation: 250,
                                    //   dyCurveAnimation: 50,
                                    //   opacity: 0.5,
                                    // );
                                    CartAnimation(
                                  startPosition: offset,
                                  endPosition: _endOffset,
                                  height: 50,
                                  width: 50,
                                  color: Colors.red,
                                  dxCurveAnimation: 250,
                                  dyCurveAnimation: 50,
                                  opacity: 0.9,
                                  image:
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png",
                                );
                              });
                              // Show Overlay
                              Overlay.of(context).insert(_overlayEntry);
                              // wait for the animation to end
                              Future.delayed(Duration(milliseconds: 800), () {
                                _overlayEntry.remove();
                                _overlayEntry = null;
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              itemCount: 100,
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Container(
            height: 60,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 90),
                  child: Icon(
                    Icons.shop_two,
                    key: _key,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      // Column(
      //   children: <Widget>[
      //     Expanded(
      //       child: ListView.builder(
      //         itemBuilder: (BuildContext context, int index) {
      //           return Container(
      //             padding: EdgeInsets.symmetric(horizontal: 20),
      //             height: 50,
      //             child: Row(
      //               children: <Widget>[
      //                 Expanded(
      //                   child: Text(
      //                     'Easy Cart Animation $index',
      //                     style: TextStyle(fontSize: 16),
      //                   ),
      //                 ),
      //                 // Builder(
      //                 //   builder: (context) {
      //                 //     return IconButton(
      //                 //       icon: Icon(Icons.remove_circle_outline),
      //                 //       onPressed: () {
      //                 //         // Get the position of the current widget when clicked, and pass in overlayEntry
      //                 //         var _overlayEntry = OverlayEntry(builder: (_) {
      //                 //           RenderBox box =
      //                 //               context.findRenderObject() ;
      //                 //           var offset = box.localToGlobal(Offset.zero);
      //                 //           return EasyCartAnimation(
      //                 //             startPosition: _endOffset,
      //                 //             endPosition: offset,
      //                 //             height: 14,
      //                 //             width: 14,
      //                 //             color: Colors.blue,
      //                 //             dxCurveAnimation: 55,
      //                 //             dyCurveAnimation: 250,
      //                 //             opacity: 0.5,
      //                 //           );
      //                 //         });
      //                 //         // Show Overlay
      //                 //         Overlay.of(context)!.insert(_overlayEntry);
      //                 //         // wait for the animation to end
      //                 //         Future.delayed(Duration(milliseconds: 800), () {
      //                 //           _overlayEntry.remove();
      //                 //           _overlayEntry = false as OverlayEntry;
      //                 //         });
      //                 //       },
      //                 //     );
      //                 //   },
      //                 // ),
      //                 // SizedBox(
      //                 //   width: 10,
      //                 // ),
      //                 // Builder(
      //                 //   builder: (context) {
      //                 //     return IconButton(
      //                 //       icon: Icon(Icons.add_circle_outline),
      //                 //       onPressed: () {
      //                 //         // Get the position of the current widget when clicked, and pass in overlayEntry
      //                 //         var _overlayEntry = OverlayEntry(builder: (_) {
      //                 //           RenderBox? box =
      //                 //               context.findRenderObject() as RenderBox?;
      //                 //           var offset = box!.localToGlobal(Offset.zero);
      //                 //           return EasyCartAnimation(
      //                 //             startPosition: offset,
      //                 //             endPosition: _endOffset,
      //                 //             height: 14,
      //                 //             width: 14,
      //                 //             color: Colors.blue,
      //                 //             dxCurveAnimation: 250,
      //                 //             dyCurveAnimation: 50,
      //                 //             opacity: 0.5,
      //                 //           );
      //                 //         });
      //                 //         // Show Overlay
      //                 //         Overlay.of(context)!.insert(_overlayEntry);
      //                 //         // wait for the animation to end
      //                 //         Future.delayed(Duration(milliseconds: 800), () {
      //                 //           _overlayEntry.remove();
      //                 //           _overlayEntry = false as OverlayEntry;
      //                 //         });
      //                 //       },
      //                 //     );
      //                 //   },
      //                 // ),
      //               ],
      //             ),
      //           );
      //         },
      //         itemCount: 100,
      //       ),
      //     ),
      //     Container(
      //       height: 1,
      //       color: Colors.grey.withOpacity(0.5),
      //     ),
      //     Container(
      //       height: 60,
      //       color: Colors.white,
      //       child: Row(
      //         children: <Widget>[
      //           Padding(
      //             padding: EdgeInsets.only(left: 20),
      //             child: Icon(
      //               Icons.shop_two,
      //               key: _key,
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
