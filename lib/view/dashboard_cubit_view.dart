// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sum_two/cubit/dashboard_cubit.dart';

// class DashboardView extends StatelessWidget {
//   const DashboardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Anita_Dashboard'),
//         centerTitle: true,
//       ),
//       body: GridView(
//         padding: const EdgeInsets.all(8),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8,
//           mainAxisSpacing: 8,
//         ),
//         children: <Widget>[
//           Card(
//             child: InkWell(
//               onTap: () {
//                 context:
//                 context.read<DashboardCubit>().openCounterView(context);
//               },
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Icon(Icons.add, size: 48),
//                   Text('Area of Circle'),
//                 ],
//               ),
//             ),
//           ),
//           Card(
//             child: InkWell(
//               onTap: () {
//                 context:
//                 context.read<DashboardCubit>().openArithmeticView(context);
//               },
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Icon(Icons.calculate, size: 48),
//                   Text('Arithmetic Cubit'),
//                 ],
//               ),
//             ),
//           ),
//           Card(
//             child: InkWell(
//               onTap: () {},
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Icon(Icons.person, size: 48),
//                   Text('Simple Interest Cubit'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:class_assignment2/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aakriti Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            crossAxisSpacing: 16, // Spacing between cards
            mainAxisSpacing: 16,
          ),
          children: <Widget>[
            // Area of Circle Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  context.read<DashboardCubit>().openCounterView(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.circle_outlined, size: 48, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      'Area of Circle',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Arithmetic Cubit Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  context.read<DashboardCubit>().openArithmeticView(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.calculate, size: 48, color: Colors.orange),
                    SizedBox(height: 10),
                    Text(
                      'Arithmetic Cubit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Simple Interest Cubit Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  context.read<DashboardCubit>().openStudentView(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.percent, size: 48, color: Colors.green),
                    SizedBox(height: 10),
                    Text(
                      'Simple Interest',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
