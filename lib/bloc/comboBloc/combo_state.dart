part of 'combo_bloc.dart';

@immutable
class ComboState {}

final class ComboInitial extends ComboState {
  final List<ComboDataModel> combos;
  ComboInitial({required this.combos});
}
