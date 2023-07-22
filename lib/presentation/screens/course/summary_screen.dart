import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/presentation/bloc/summary/summary_bloc.dart';

import '../../widgets/custom_app_bar.dart';

class SummaryScreen extends StatefulWidget {
  final int topicId;
  const SummaryScreen({required this.topicId, super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  void initState() {
    context.read<SummaryBloc>().add(GetSummaryEvent(widget.topicId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(46),
        child: CustomAppBar(
          leadingText: 'Topics',
          title: 'Summary',
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<SummaryBloc, SummaryState>(
          builder: (context, state) {
            if (state is SummaryLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is SummaryLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.summary.summary,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }
            return Text(state.toString());
          },
        ),
      ),
    );
  }
}
