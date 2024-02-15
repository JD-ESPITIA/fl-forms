import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forms/presentation/blocs/counter_cubit/counter_cubit.dart';
import 'package:go_router/go_router.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const CubitCounterView(),
    );
  }
}

class CubitCounterView extends StatelessWidget {
  const CubitCounterView({super.key});

  @override
  Widget build(BuildContext context) {

// final counterState = context.watch<CounterCubit>().state;


    return Scaffold(
      appBar: AppBar(
        title:  context.select((CounterCubit cubit) {
          return  Text('Cubit counter ${cubit.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              }, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (p,c) => c.counter != p.counter,
        builder: (context, state) {
          print('cambio');
          return Text('Valor state ${state.counter} ');
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', child: const Text('+3'), onPressed: ()  {
                context.read<CounterCubit>().increaseBy(3);
              }
              // increaseCounterBy(context, 3)
              ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2', child: const Text('+2'), onPressed: () {
                context.read<CounterCubit>().increaseBy(2);
              }
              // increaseCounterBy(context, 2)
              ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () {
                context.read<CounterCubit>().increaseBy(1);
              }
              // increaseCounterBy(context)
              ),
        ],
      ),
    );
  }
}
