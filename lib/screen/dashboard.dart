import 'package:counter_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
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
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state){
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
                )
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
