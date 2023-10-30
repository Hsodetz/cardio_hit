import 'package:cardio_hit/utils/custom_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hit Caminadora!"),
      ),
      body: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [   
              Text('Elije el tiempo para el hit!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    context.push('/select-level/1');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 100,
                    decoration: customBoxDecoration,
                    child: const Center(
                      child: Text("1'", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    ),
                    
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    context.push('/select-level/2');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 100,
                    decoration: customBoxDecoration,
                    child: const Center(
                      child: Text("2'", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ),
            ],
          ),

              Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    context.push('/select-level/3');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 100,
                    decoration: customBoxDecoration,
                    child: const Center(
                      child: Text("3'", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

