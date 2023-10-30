import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SummaryHitScreen extends StatelessWidget {
  final String levelValue;
  final String hitValue;

  const SummaryHitScreen({super.key, required this.levelValue, required this.hitValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hit $hitValue' - Nível $levelValue"),
      ),
      body: SummaryHitView(hitValue: hitValue, levelValue: levelValue,),
    );
  }
}

class SummaryHitView extends StatelessWidget {
   final String levelValue;
  final String hitValue;

  const SummaryHitView({super.key, required this.levelValue, required this.hitValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Resumen de su Hit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ],  
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.center,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                    children: [
                    TableCell(child: Text('Tiempo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),)),
                    TableCell(child: Text('Valocidad', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),)),
                    TableCell(child: Text('Esfuerzo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),)),                
                    ],
                  ),
                  const TableRow(
                    children: [
                      Text("0'-1'", style: TextStyle(fontSize: 20.0),),
                      Text("4-5 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Fácil", style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 27, 116, 189)),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("1'-3'", style: TextStyle(fontSize: 20.0),),
                      const Text("5-6 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Moderado", style: TextStyle(fontSize: 20.0, color: Colors.green.shade700),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("3'-4'", style: TextStyle(fontSize: 20.0),),
                      const Text("6-7 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Máximo", style: TextStyle(fontSize: 20.0, color: Colors.red.shade700),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("4'-5'", style: TextStyle(fontSize: 20.0),),
                      const Text("4-5 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Fácil", style: TextStyle(fontSize: 20.0, color: Colors.blue.shade700),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("5'-6'", style: TextStyle(fontSize: 20.0),),
                      const Text("5-6 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Moderado", style: TextStyle(fontSize: 20.0, color: Colors.green.shade700),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("6'-7'", style: TextStyle(fontSize: 20.0),),
                      const Text("4-5 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Fácil", style: TextStyle(fontSize: 20.0, color: Colors.blue.shade700),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("7'-8'", style: TextStyle(fontSize: 20.0),),
                      const Text("6-7 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Máximo", style: TextStyle(fontSize: 20.0, color: Colors.red.shade700),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("8'-9'", style: TextStyle(fontSize: 20.0),),
                      const Text("5-6 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Moderado", style: TextStyle(fontSize: 20.0, color: Colors.green.shade700),),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text("9'-10'", style: TextStyle(fontSize: 20.0),),
                      const Text("4-5 Km/h", style: TextStyle(fontSize: 20.0),),
                      Text("Fácil", style: TextStyle(fontSize: 20.0, color: Colors.blue.shade700),),
                    ]
                  ),
                ],
              ),
            ),
          ),

          const Spacer(flex: 1,),

          ElevatedButton(
            onPressed: () {
              context.push('/actual-velocity/$levelValue/$hitValue');
            }, 
            child: const Text('Vamos a Comenzar!')
          ),

        ],

      ),

      
    );
  }
}