import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_cubit.dart';
import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_state.dart';
import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BPIListContent extends StatelessWidget {
  const BPIListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: const LatestPriceAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: BlocConsumer<BPIListCubit, BPIListState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              } else if (state.hasBPIData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: BPIListWidget(
                    bpi: state,
                  ),
                );
              } else if (state.errorMessage != null) {
                return Text(
                  state.errorMessage!,
                  style: const TextStyle(height: 24),
                );
              } else {
                return const Text(
                  'Something went wrong',
                  style: TextStyle(height: 24),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class LatestPriceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LatestPriceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF545454),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'Latest Price',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
