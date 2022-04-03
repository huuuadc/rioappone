// // ignore: import_of_legacy_library_into_null_safe
// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart';
// import 'package:rioappone/models/searchhistoryqr.dart';
// import "package:rioappone/services/api_manager.dart";

// class Body extends StatefulWidget {
//   const Body({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _BodyState createState() => _BodyState();
// }

// final TextEditingController _qrControler = TextEditingController();

// class _BodyState extends State<Body> {
//   String result = "Không Có Thông Tin";

//   // ignore: deprecated_member_use, prefer_final_fields
//   List<ViewSearchQRHistory> _searchQR = <ViewSearchQRHistory>[];
// // ignore: deprecated_member_use, unused_field
//   List<ViewSearchQRHistory> _searchQRDisplay = <ViewSearchQRHistory>[];

// //bool _Reorder = false;
//   @override
//   void initState() {
//     //String result = "";
//     fetchQRHistpryID(result).then((value) {
//       setState(() {
//         _searchQR.addAll(value!);
//         _searchQRDisplay = _searchQR;
//       });
//     });
//     super.initState();
//   }

//   void _updateListView(String a) {
//     fetchQRHistpryID(a).then((value) {
//       setState(() {
//         _searchQR.clear();
//         _searchQR.addAll(value!);
//         _searchQRDisplay = _searchQR;
//       });
//     });
//   }

//   Future _scanQR() async {
//     try {
//       String qrResult = await BarcodeScanner.scan();
//       setState(() {
//         result = qrResult;
//         _qrControler.text = result;
//         //_updateListView(result);
//         // _a = result.substring(0, 10);
//         // _b = result.substring(11, 19);
//       });
//       _updateListView(result);
//     } on PlatformException catch (ex) {
//       if (ex.code == BarcodeScanner.CameraAccessDenied) {
//         setState(() {
//           result = "Camera";
//         });
//       } else {
//         setState(() {
//           result = "Unknown Error $ex";
//         });
//       }
//     } on FormatException {
//       setState(() {
//         result = "You pressed the back button before scanning anything";
//       });
//     } catch (ex) {
//       setState(() {
//         result = "Unknown Error $ex";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     //Size size = MediaQuery.of(context).size;
//     //return Background(
//     return Scaffold(
//       // body: Center(child: FutureBuilder<List<ViewSearchQRHistory>>(future: _searchQRDisplay,
//       // builder: (context,snapshot){

//       // },),),
//       // ignore: avoid_unnecessary_containers
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.all(20),
//               child: TextField(
//                 controller: _qrControler,
//                 onChanged: (a) {
//                   _updateListView(a);
//                 },
//                 onEditingComplete: () {},
//                 decoration: const InputDecoration(
//                   hintText: "Scan QR 1",
//                   icon: Icon(
//                     Icons.qr_code,
//                     color: Color(0xFF6F35A5),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//                 child: ReorderableListView.builder(
//               header: const Text("Lịch Sử QR"),
//               onReorder: (oldIndex, newIndex) => setState(() {
//                 //if (_Reorder = false) {
//                 final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
//                 final ViewSearchQRHistory item =
//                     _searchQRDisplay.removeAt(oldIndex);
//                 _searchQRDisplay.insert(index, item);
//                 // } else {
//                 //   _Reorder = false;
//                 // }
//               }),

//               padding: const EdgeInsets.all(20),
//               itemCount: _searchQRDisplay.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   key: ValueKey(index),
//                   // onDismissed: (direction) {
//                   //   setState(() {
//                   //     //_Reorder = true;
//                   //     //_searchQRDisplay.removeAt(index);
//                   //   });
//                   // },
//                   child: Card(
//                     semanticContainer: false,
//                     elevation: 6.0,
//                     shadowColor: Colors.grey.withOpacity(0.5),
//                     // decoration: BoxDecoration(
//                     //     color: Colors.white,
//                     //     borderRadius: BorderRadius.only(
//                     //         topLeft: Radius.circular(10),
//                     //         topRight: Radius.circular(10),
//                     //         bottomLeft: Radius.circular(10),
//                     //         bottomRight: Radius.circular(10)),
//                     //     boxShadow: [
//                     //       BoxShadow(
//                     //           color: Colors.grey.withOpacity(0.5),
//                     //           spreadRadius: 5,
//                     //           blurRadius: 7,
//                     //           offset: Offset(0, 3))
//                     //     ]),
//                     // alignment: Alignment.centerLeft,
//                     // //color: Colors.amber.shade100,
//                     // padding: const EdgeInsets.all(10),
//                     child: Container(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           children: [
//                             //SizedBox(height: 10.0),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Mã QR: ${_searchQRDisplay[index].qrCode}'),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Mã QR Tham Chiếu: ${_searchQRDisplay[index].qrExtend}'),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Công Đoạn: ${_searchQRDisplay[index].stageCode}'),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Trạng Thái: ${_searchQRDisplay[index].docType}',
//                                   style: TextStyle(color: Colors.red)),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Mã Vật Tư: ${_searchQRDisplay[index].itemNo}'),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Tên Vật Tư: ${_searchQRDisplay[index].itemName}',
//                                   style: TextStyle(
//                                       color: Colors.green[200],
//                                       fontSize: 16.0)),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Số Lượng: ${_searchQRDisplay[index].quantity}',
//                                   style: const TextStyle(
//                                       color: Colors.red, fontSize: 20.0)),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                   'Ngày Nhập Xuất: ${_searchQRDisplay[index].postingDate}'),
//                             ),
//                           ],
//                         )),
//                   ),
//                 );
//               },

//               // separatorBuilder: (BuildContext context, int index) =>
//               //     const Divider(),
//             ))
//             // Expanded(
//             //     child: ListView(
//             //         // ignore: deprecated_member_use
//             //         children: _a1.map((e) => Text(e)).toList())),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//           icon: const Icon(Icons.camera_alt),
//           label: const Text("Scan"),
//           onPressed: () {
//             _scanQR();
//             _qrControler.selection = TextSelection.fromPosition(
//                 TextPosition(offset: _qrControler.text.length));
//           }),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       //);
//     );
//   }
// }
