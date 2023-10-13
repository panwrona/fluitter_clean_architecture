import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_body.dart';
import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const bpiListRouteName = 'functionalityListRoute';

final bpiListRoute = GoRoute(
    path: '/',
    name: bpiListRouteName,
    builder: (context, state) => const FunctionalityListPage());

class FunctionalityListPage extends StatelessWidget {
  const FunctionalityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BPIListCubit>(
      create: (context) => BPIListCubit(),
      child: const BPIListContent(),
    );
  }
}
