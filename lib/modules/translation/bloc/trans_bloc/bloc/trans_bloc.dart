import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locations_work/core/helpers/app_prefs.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/helpers/snackbar_helper.dart';
import 'package:locations_work/modules/translation/models/trans_response.dart';
import 'package:locations_work/modules/translation/repository/trans_repository.dart';

part 'trans_event.dart';
part 'trans_state.dart';

class TransBloc extends Bloc<TransEvent, TransState> {
  final TransRepository transRepository;
  TransBloc(this.transRepository) : super(TransInitial()) {
    on<GetTrans>(getTrans);
  }

  FutureOr<void> getTrans(GetTrans event, Emitter<TransState> emit) async {
    String language = await getIt<AppPreferences>().getAppLanguage();
    emit(TransLoadingState());
    await transRepository.getTrans().then((result) => result.fold((error) {
          emit(TransErrorState(error.message));
        }, (response) async {
          SnackBarHelper.showSuccessSnackBar(
              language == 'en' ? 'English' : 'لغة عربيـــة',
              language == 'en'
                  ? response.englishText ?? ''
                  : response.arabicText ?? '');
          emit(TransSuccessState(response));
        }));
  }
}
