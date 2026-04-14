/// Auth: [AuthController], email / phone flows, services, and models.
///
/// ```dart
/// import 'package:blueprint_flutter_core/blueprint_auth.dart';
/// ```
library;

export 'src/modules/auth/core/controllers/auth_controller.dart';
export 'src/modules/auth/core/enums/auth_method.dart';
export 'src/modules/auth/core/enums/auth_status.dart';
export 'src/modules/auth/core/models/auth_state.dart';
export 'src/modules/auth/core/models/auth_tokens.dart';
export 'src/modules/auth/core/models/session.dart';
export 'src/modules/auth/core/models/user.dart';
export 'src/modules/auth/core/services/auth_service.dart';
export 'src/modules/auth/core/storage/auth_storage.dart';

export 'src/modules/auth/email_auth/controllers/email_auth_flow_controller.dart';
export 'src/modules/auth/email_auth/controllers/email_auth_flow_state.dart';
export 'src/modules/auth/email_auth/controllers/forgot_password_flow_controller.dart';
export 'src/modules/auth/email_auth/controllers/forgot_password_flow_state.dart';
export 'src/modules/auth/email_auth/models/email_login_input.dart';
export 'src/modules/auth/email_auth/models/email_register_input.dart';
export 'src/modules/auth/email_auth/models/register_request.dart';
export 'src/modules/auth/email_auth/models/reset_password_input.dart';
export 'src/modules/auth/email_auth/services/email_auth_service.dart';
export 'src/modules/auth/email_auth/widgets/forgot_password/fx_forgot_password_data.dart';
export 'src/modules/auth/email_auth/widgets/forgot_password/fx_forgot_password_widget.dart';
export 'src/modules/auth/email_auth/widgets/fx_email_auth.dart';

export 'src/modules/auth/phone_auth/controllers/phone_auth_flow_controller.dart';
export 'src/modules/auth/phone_auth/controllers/phone_auth_flow_state.dart';
export 'src/modules/auth/phone_auth/models/otp_data.dart';
export 'src/modules/auth/phone_auth/models/phone_lookup_result.dart';
export 'src/modules/auth/phone_auth/models/register_request.dart';
export 'src/modules/auth/phone_auth/models/user_details_input.dart';
export 'src/modules/auth/phone_auth/services/phone_auth_service.dart';
export 'src/modules/auth/phone_auth/widgets/fx_phone_auth.dart';
