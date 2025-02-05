import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/pr_details.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class GRNPrintWidget extends StatelessWidget {
  const GRNPrintWidget({super.key, required this.details});

  final PRDetails details;

  static Widget downloadPDF(PRDetails details) {
    final bloc = CEBlocProvider.get().downloadGRN();
    return BlocProvider(
      create: (_) => bloc..request(Urls.filepath(details.url)),
      child: GRNPrintWidget(details: details),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GRN'),
        actions: [
          BlocBuilder<DownloadGRNCubit, DownloadGRNState>(
            builder: (_, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox(),
                success: (data) {
                  return IconButton(
                    onPressed: () async {
                      final xfile = XFile.fromData(data,
                          mimeType: 'application/pdf', name: details.id);
                      await Share.shareXFiles(
                        [xfile],
                        text: 'GRN',
                        subject: details.id,
                      );
                    },
                    icon: const Icon(Icons.share),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<DownloadGRNCubit, DownloadGRNState>(
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: LoadingIndicator()),
            success: (data) => InteractiveViewer(
              panEnabled: false,
              minScale: 0.5,
              maxScale: 4,
              child: PdfViewer.openData(data),
            ),
          );
        },
      ),
    );
  }
}
