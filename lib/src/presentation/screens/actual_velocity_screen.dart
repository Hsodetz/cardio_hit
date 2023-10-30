import 'package:cardio_hit/src/presentation/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActualVelocityScreen extends StatelessWidget {
  final String levelValue;
  final String hitValue;

  const ActualVelocityScreen({super.key, required this.levelValue, required this.hitValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hit $hitValue - Nível $levelValue"),
      ),
      body: const ActualVelocityView(),
    );
  }
}

class ActualVelocityView extends ConsumerWidget {
  const ActualVelocityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);    
    
    return Padding(
      padding: const EdgeInsets.all(12.0),
      
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(ref.read(counterProvider.select((value) => value.timeLeftString)), style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  minimumSize: const Size(190, 70),
                ),
                onPressed: () {
                  counter.isEnding ? null : counter.startStopTimer();
                  
                }, 
                child: counter.isRunning ? const Icon(Icons.play_circle_fill_rounded) : const Icon(Icons.pause_circle_filled_outlined)
              ),
            ],
          ),

          const Spacer(flex: 1,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 150,
                width: 150,
                child: 
                CircularProgressIndicator(
                  backgroundColor: Colors.pink.shade100,
                  strokeWidth: 20,
                  value: ((double.tryParse(counter.timeSecondString))!*1)/60,
                  
                ),
              ),
            ],
          ),

          const Spacer(flex: 2,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(counter.isEnding ? 'Has Finalizado!': '', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),), 
            ],
          ),
    
          const Spacer(flex: 5,),
    
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _columGraph(heightColumn: 70, colorcito: counter.cicle >= 1 ? Colors.blue.shade200 : Colors.transparent),
              const SizedBox(width: 15,),
              _columGraph(heightColumn: 90, colorcito: counter.cicle >= 2 ? Colors.blue.shade200 : Colors.transparent),
              const SizedBox(width: 15,),
              _columGraph(heightColumn: 110, colorcito: counter.cicle >= 3 ? Colors.blue.shade200 : Colors.transparent),
            ],
          ),

          const Spacer(flex: 1,),
    
        ],
      ),
    );
  }
}

Widget _columGraph({double heightColumn = 1.0, Color colorcito = Colors.transparent}) {
  return  Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: colorcito,
                    ),
                    width: 30,
                    height: heightColumn,
                    //color: Colors.blue,
                  )
                ],
              );
}