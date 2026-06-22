import 'package:blueprint_flutter_core/src/core/network/fx_service.dart';
import 'package:blueprint_flutter_core/src/modules/security/models/dto/pin_status_dto.dart';

class PinService extends FxService {
  PinService(super.ctx);

  FxResponse<PinStatusDto> hasPin(String pinType) => execute(() async {
    final response = await dio.get<dynamic>(endpoints.pinStatus(pinType));
    return PinStatusDto.fromJson(response.data! as Map<String, dynamic>);
  });

  FxResponse<void> createPin(String pinType, String pin) => execute(() async {
    await dio.post<dynamic>(
      endpoints.createPin,
      data: {'pin': pin, 'type': pinType},
    );
  });

  Future<void> resetPin(String pin) async {
    await dio.post<dynamic>(
      endpoints.verifyPin,
      data: {'pin': pin},
    );
  }

  FxResponse<void> verifyPin(String pinType, String pin) => execute(() async {
    await dio.post<dynamic>(
      endpoints.verifyPin,
      data: {'pin': pin, 'type': pinType},
    );
  });
}