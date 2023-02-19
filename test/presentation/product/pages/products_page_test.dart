import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/presentation/product/bloc/products_bloc.dart';
import 'package:jubelio/presentation/product/pages/products_page.dart';
import 'package:jubelio/presentation/product/widgets/product_shimmer.dart';
import 'package:mocktail/mocktail.dart';

class MockProductsBloc extends MockBloc<ProductsEvent, ProductsState>
    implements ProductsBloc {}

class ProductsEventFake extends Fake implements ProductsEvent {}

class ProductsStateFake extends Fake implements ProductsState {}

void main() {
  late MockProductsBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(ProductsEventFake());
    registerFallbackValue(ProductsStateFake());
  });

  setUp(() {
    mockBloc = MockProductsBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<ProductsBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display products Shimmer when loading',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(ProductsLoading());

    final progressBarFinder = find.byType(ProductShimmer);

    await tester.pumpWidget(makeTestableWidget(const ProductsPage()));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display List when success loaded',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(
        const ProductsHasData(products: <Product>[], currentPage: 1));

    final loadedWidgetFinder = find.byType(PagedSliverList<int, Product>);

    await tester.pumpWidget(makeTestableWidget(const ProductsPage()));

    expect(loadedWidgetFinder, findsOneWidget);
  });

  testWidgets('Page should display Error when failed loaded',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(const ProductsError("Error"));

    final progressBarFinder = find.byType(PagedSliverList<int, Product>);

    await tester.pumpWidget(makeTestableWidget(const ProductsPage()));

    expect(progressBarFinder, findsOneWidget);
  });
}
