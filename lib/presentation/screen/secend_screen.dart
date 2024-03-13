import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecendScreen extends StatefulWidget {
  const SecendScreen({super.key});

  @override
  State<SecendScreen> createState() => _SecendScreenState();
}

class _SecendScreenState extends State<SecendScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            centerTitle: true,
            title: const Text("Counter BLoC"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
            if (state.wasIncremented == true) {
              ScaffoldMessenger.of(context).showSnackBar(
              const  SnackBar(
                  content: Text("Incremented!"),
                  duration: Duration(seconds: 2),
                ),
              );
            } if(state.wasIncremented == false) {
              ScaffoldMessenger.of(context).showSnackBar(
              const  SnackBar(
                  content: Text("Decremented!"),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
                  builder: (context, state) {
                    if (state.counterValue < 0) {
                      return Text(
                        "BRR NEGATIVE${state.counterValue}",
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else if (state.counterValue % 2 == 0) {
                      return Text(
                        "YAAAY${state.counterValue.toString()}",
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else if (state.counterValue == 5) {
                      Text(
                        "HMM NUMBERN 5",
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else
                      return Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    return SizedBox();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 35,
                        )),
                    IconButton(
                        onPressed: () {
                          // context.bloc<CounterCubit>().decrement();
                          BlocProvider.of<CounterCubit>(context).decrement();
                        },
                        icon: const Icon(
                          Icons.minimize,
                          size: 35,
                        ))
                  ],
                ),
              ],
            ),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: const EdgeInsets.only(top: 55, right: 50),
            child: const Banner(
              message: "Habib",
              location: BannerLocation.bottomStart,
            ),
          ),
        ),
      ],
    );
  }
}