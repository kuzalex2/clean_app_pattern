import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MainPagePageType {
  inbox,
  notification,
  settings,
}

class MainPageState extends Equatable {
  final MainPagePageType activePage;

  int get currentIndex => activePage.index;

  const MainPageState({required this.activePage});

  MainPageState copyWith({
    MainPagePageType? activePage,
  }) {
    return MainPageState(
      activePage: activePage ?? this.activePage,
    );
  }

  @override
  List<Object?> get props => [activePage];
}

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(const MainPageState(activePage: MainPagePageType.inbox));

  void changePage(MainPagePageType? page) {
    if (page == null) return;
    emit(state.copyWith(activePage: page));
  }
}
