// import 'package:flutter/material.dart';
// import 'package:locations_work/modules/radio/widgets/vehicle_type_widget.dart';

// // List<String> vehiclesIds = ['1', '2', '3'];
// // List<String> vehiclesTitles = ['van', 'sedan', '5 pass car'];
// // List<int> vehiclesExteriorPrices = [40, 20, 30];
// // List<String> vehiclesImages = [
// //   'https://pics.freeicons.io/uploads/icons/png/10011672171636777626-512.png',
// //   'https://pics.freeicons.io/uploads/icons/png/11708348221666851072-512.png',
// //   'https://pics.freeicons.io/uploads/icons/png/17472710041544526147-512.png'
// // ];
// // List<String> vehiclesdescriptions = ['big car', 'small car', 'small car'];

// class RadioScreen extends StatefulWidget {
//   const RadioScreen({super.key});

//   @override
//   State<RadioScreen> createState() => _RadioScreenState();
// }

// class _RadioScreenState extends State<RadioScreen> {
//   String groupValue = '';
//   String vehicleId = '';
//   // Map<String, dynamic> vehicleTypes = {
//   //   'vehicle':[
//   //     {
//   //     '_id':'1',
//   //     'title':'van',
//   //     'exteriorPrice':40,
//   //     'image':'https://pics.freeicons.io/uploads/icons/png/10011672171636777626-512.png',
//   //     'description':"big car"
//   //   },
//   //     {
//   //     '_id':'2',
//   //     'title':'sedan',
//   //     'exteriorPrice':20,
//   //     'image':'https://pics.freeicons.io/uploads/icons/png/11708348221666851072-512.png',
//   //     'description':"small car"
//   //   },
//   //     {
//   //     '_id':'3',
//   //     'title':'5 pass car',
//   //     'exteriorPrice':30,
//   //     'image':'https://pics.freeicons.io/uploads/icons/png/17472710041544526147-512.png',
//   //     'description':"small car"
//   //   },
//   //   ]
//   // };
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: ListView.builder(
//             padding: const EdgeInsets.all(20.0),
//             itemCount: vehiclesIds.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: VehicleTypeWidget(
//                     text: vehiclesTitles[index],
//                     imageUrl: vehiclesImages[index],
//                     backgroundColor: Colors.white,
//                     price: vehiclesExteriorPrices[index].toDouble(),
//                     radioGroupValue: groupValue,
//                     radioValue: vehiclesIds[index],
//                     // infoFunc: () {
//                     //   Get.bottomSheet(
//                     //     BottomSheet(
//                     //         enableDrag: false,
//                     //         onClosing: () {
//                     //           Navigator.pop(context);
//                     //         },
//                     //         builder: (context) {
//                     //           return CarInfoWidget(
//                     //             description: vehiclesdescriptions[index],
//                     //             imageUrl: vehiclesImages[index],
//                     //             title: vehiclesTitles[index],
//                     //           );
//                     //         }),
//                     //     backgroundColor: Colors.white,
//                     //   );
//                     // },
//                     boxShadow: vehiclesIds[index] == groupValue
//                         ? []
//                         : [
//                             const BoxShadow(
//                               offset: Offset(0, 0),
//                               blurStyle: BlurStyle.outer,
//                               blurRadius: 2,
//                               color: Colors.blue,
//                             )
//                           ],
//                     onChanged: (value) {
//                       setState(
//                         () {
//                           groupValue = value!;
//                           vehicleId = vehiclesIds[index];
//                         },
//                       );
//                     }),
//               );
//             }));
//   }
// }
