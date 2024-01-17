part of 'pdf_view.dart';

typedef PdfViewBuilder<T> = Widget Function(
  /// Build context
  BuildContext context,

  /// All passed builders
  PdfViewBuilders<T> builders,

  /// Document loading state
  PdfLoadingState state,

  /// Loaded result builder
  WidgetBuilder loadedBuilder,

  /// Pdf document when he loaded
  PdfDocument? document,

  /// Error of pdf loading
  Exception? loadingError,
);

class PdfViewBuilders<T> {
  /// Widget showing when pdf document loading
  final WidgetBuilder? documentLoaderBuilder;

  /// Widget showing when pdf page loading
  final WidgetBuilder? pageLoaderBuilder;

  /// Show document loading error message inside [PdfView]
  final Widget Function(BuildContext, Exception error)? errorBuilder;

  /// Root view builder
  final PdfViewBuilder<T> builder;

  /// Additional options for builder
  final T options;

  const PdfViewBuilders({
    required this.options,
    this.builder = _PdfViewState._builder,
    this.documentLoaderBuilder,
    this.pageLoaderBuilder,
    this.errorBuilder,
  });
}
