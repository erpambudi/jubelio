import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jubelio/domain/entities/cart.dart';
import 'package:jubelio/presentation/cart/bloc/cart_bloc.dart';
import 'package:jubelio/presentation/cart/bloc/manage_cart_bloc.dart';
import 'package:jubelio/presentation/cart/pages/cart_page.dart';
import 'package:mocktail/mocktail.dart';

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CartEventFake extends Fake implements CartEvent {}

class CartStateFake extends Fake implements CartState {}

class MockManageCartBloc extends MockBloc<ManageCartEvent, ManageCartState>
    implements ManageCartBloc {}

class ManageCartEventFake extends Fake implements ManageCartEvent {}

class ManageCartStateFake extends Fake implements ManageCartState {}

void main() {
  late MockManageCartBloc mockManageCartBloc;
  late MockCartBloc mockCartBloc;

  setUpAll(() {
    registerFallbackValue(CartEventFake());
    registerFallbackValue(CartStateFake());

    registerFallbackValue(ManageCartEventFake());
    registerFallbackValue(ManageCartStateFake());
  });

  setUp(() {
    mockManageCartBloc = MockManageCartBloc();
    mockCartBloc = MockCartBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ManageCartBloc>.value(value: mockManageCartBloc),
        BlocProvider<CartBloc>.value(value: mockCartBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    when(() => mockCartBloc.state).thenReturn(CartStateLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const CartPage()));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display List when success loaded',
      (WidgetTester tester) async {
    when(() => mockCartBloc.state).thenReturn(const CartStateLoaded(
        carts: <Cart>[], totalItems: 1, totalPrice: 12.9));

    final loadedWidgetFinder = find.byType(Column);

    await tester.pumpWidget(makeTestableWidget(const CartPage()));

    expect(loadedWidgetFinder, findsOneWidget);
  });

  testWidgets('Page should display Error when failed loaded',
      (WidgetTester tester) async {
    when(() => mockCartBloc.state).thenReturn(const CartStateError("Error"));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(makeTestableWidget(const CartPage()));

    expect(progressBarFinder, findsOneWidget);
  });
}
