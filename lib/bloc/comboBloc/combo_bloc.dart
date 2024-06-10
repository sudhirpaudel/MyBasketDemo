import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:mybasket/firebaseData/get_combo_data.dart';
import 'package:mybasket/models/combo_model.dart';

part 'combo_event.dart';
part 'combo_state.dart';

class ComboBloc extends Bloc<ComboEvent, ComboState> {
  ComboBloc() : super(ComboInitial(combos: const [])) {
    on<GetCombos>(_getCombos);
    on<UpdateCombo>(_onUpdateCombos);
  }
  _getCombos(GetCombos event, Emitter<ComboState> emit) async {
    List<ComboDataModel> combos = await getComboData();

    emit(ComboInitial(combos: combos));
  }

  void _onUpdateCombos(UpdateCombo event, Emitter<ComboState> emit) {
    final state = this.state;
    if (state is ComboInitial) {
      List<ComboDataModel> combos = (state.combos.map((combo) {
        return combo.comboId == event.combo.comboId ? event.combo : combo;
      })).toList();

      emit(ComboInitial(combos: combos));
    }
  }
}
