import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectLevelScreen extends StatelessWidget {
  final String time;
  const SelectLevelScreen({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hit $time'"),
      ),
      body: SelectLevelView(time: time),
    );
  }
}

class SelectLevelView extends StatelessWidget {
  final String time;
  const SelectLevelView({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ahora elige el nivel!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ],  
          ),

          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: elements.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 70,
                  child: Center(
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      child: ListTile(
                        onTap: () {
                          context.push('/summary-hit/$index/$time');
                        },
                        trailing: const Icon(Icons.chevron_right_outlined),
                        leading: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorsList[index],
                          ),
                          height: 500,
                          width: 50,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Nivel', style: TextStyle(fontSize: 15, color: Colors.white),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(index.toString(), style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                ],
                              )
                            ],
                          ),
                        ),
                        title: Text(elements[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}

List<String> elements = ['Muy Fácil', 'Fácil', 'Moderado', 'Moderado Alto', 'Fuerte', 'Máximo'];
List<Color> colorsList = [
  Colors.blue.shade200,
  Colors.blue.shade600,
  Colors.green.shade600,
  Colors.yellow.shade600,
  Colors.orange.shade400,
  Colors.red.shade700,

];
