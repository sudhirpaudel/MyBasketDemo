part of 'combo_bloc.dart';

@immutable
abstract class ComboEvent {}

class GetCombos extends ComboEvent {
  final List<ComboDataModel> combos;
  GetCombos({required this.combos});
}

class UpdateCombo extends ComboEvent {
  final ComboDataModel combo;
  UpdateCombo({required this.combo});
}

