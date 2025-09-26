import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  late String code;

  void emitOptClear() {
    emit(OtpClear());
  }

  void clear() {
    code = "";
  }
}
