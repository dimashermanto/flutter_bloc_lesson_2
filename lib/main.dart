import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lesson_2/counter_state.dart';

import 'counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        //Executed everytume a change occured in CounterState
        listener: (BuildContext context, state) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("State changed"), duration: Duration(milliseconds: 700),));
          if(state.wasIncremented){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nambah bossku ?"), duration: Duration(milliseconds: 700),));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Okeeee"), duration: Duration(milliseconds: 700),));
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Button Pushed',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 24,
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (BuildContext context, state) {
                    if (state.counterValue < 0) {
                      return Text(
                        "Currently under zero (${state.counterValue.toString()})",
                      );
                    } else {
                      return Text(
                        state.counterValue.toString(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
