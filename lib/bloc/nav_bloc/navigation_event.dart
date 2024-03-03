part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

final class ChangeThePageEvent extends NavigationEvent{
    late int currentIndex;

  ChangeThePageEvent({required this.currentIndex});
}
