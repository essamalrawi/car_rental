# Diff Details

Date : 2025-10-04 21:32:50

Directory /home/essam/Dev/car_rental/lib

Total : 32 files,  74 codes, -2 comments, 19 blanks, all 91 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/constants.dart](/lib/constants.dart) | Dart | -7 | -2 | -1 | -10 |
| [lib/core/constants/api\_constants.dart](/lib/core/constants/api_constants.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/core/constants/auth\_keys.dart](/lib/core/constants/auth_keys.dart) | Dart | 4 | 0 | 0 | 4 |
| [lib/core/constants/preferences\_keys.dart](/lib/core/constants/preferences_keys.dart) | Dart | 2 | 0 | 1 | 3 |
| [lib/core/models/auth\_response\_model.dart](/lib/core/models/auth_response_model.dart) | Dart | -129 | 0 | -22 | -151 |
| [lib/core/services/quent\_auth\_service.dart](/lib/core/services/quent_auth_service.dart) | Dart | 3 | 0 | -1 | 2 |
| [lib/features/auth/domain/data/models/country\_model/country\_model.dart](/lib/features/auth/domain/data/models/country_model/country_model.dart) | Dart | 15 | 0 | 3 | 18 |
| [lib/features/auth/domain/data/models/location\_model/location\_model.dart](/lib/features/auth/domain/data/models/location_model/location_model.dart) | Dart | 17 | 0 | 3 | 20 |
| [lib/features/auth/domain/data/models/request\_password\_reset\_code\_mode/request\_password\_reset\_code\_mode.dart](/lib/features/auth/domain/data/models/request_password_reset_code_mode/request_password_reset_code_mode.dart) | Dart | 15 | 0 | 3 | 18 |
| [lib/features/auth/domain/data/models/request\_verify\_phone\_model/request\_verify\_phone\_model.dart](/lib/features/auth/domain/data/models/request_verify_phone_model/request_verify_phone_model.dart) | Dart | 15 | 0 | 3 | 18 |
| [lib/features/auth/domain/data/models/reset\_password\_model/reset\_password\_model.dart](/lib/features/auth/domain/data/models/reset_password_model/reset_password_model.dart) | Dart | 7 | 0 | 3 | 10 |
| [lib/features/auth/domain/data/models/user\_model/user\_model.dart](/lib/features/auth/domain/data/models/user_model/user_model.dart) | Dart | 125 | 0 | 22 | 147 |
| [lib/features/auth/domain/entities/country\_entity.dart](/lib/features/auth/domain/entities/country_entity.dart) | Dart | -7 | 0 | -1 | -8 |
| [lib/features/auth/domain/entities/location\_entity.dart](/lib/features/auth/domain/entities/location_entity.dart) | Dart | -8 | 0 | -1 | -9 |
| [lib/features/auth/domain/entities/request\_password\_reset\_code\_entity.dart](/lib/features/auth/domain/entities/request_password_reset_code_entity.dart) | Dart | -7 | 0 | -1 | -8 |
| [lib/features/auth/domain/entities/request\_verify\_phone\_entity.dart](/lib/features/auth/domain/entities/request_verify_phone_entity.dart) | Dart | -7 | 0 | -1 | -8 |
| [lib/features/auth/domain/entities/reset\_password\_entity.dart](/lib/features/auth/domain/entities/reset_password_entity.dart) | Dart | -3 | 0 | -1 | -4 |
| [lib/features/auth/presentation/manager/cubits/verify\_phone\_number/verify\_phone\_number\_cubit.dart](/lib/features/auth/presentation/manager/cubits/verify_phone_number/verify_phone_number_cubit.dart) | Dart | -1 | 0 | -1 | -2 |
| [lib/features/auth/presentation/views/reset\_your\_password\_view.dart](/lib/features/auth/presentation/views/reset_your_password_view.dart) | Dart | 0 | 0 | 1 | 1 |
| [lib/features/auth/presentation/views/sign\_in\_view.dart](/lib/features/auth/presentation/views/sign_in_view.dart) | Dart | 0 | 0 | 1 | 1 |
| [lib/features/auth/presentation/views/widgets/country\_search\_bar\_suggestions.dart](/lib/features/auth/presentation/views/widgets/country_search_bar_suggestions.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/features/auth/presentation/views/widgets/location\_search\_bar\_suggetions.dart](/lib/features/auth/presentation/views/widgets/location_search_bar_suggetions.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/features/auth/presentation/views/widgets/sign\_in\_view\_body\_bloc\_consumer.dart](/lib/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/features/auth/presentation/views/widgets/verification\_code\_view\_body.dart](/lib/features/auth/presentation/views/widgets/verification_code_view_body.dart) | Dart | -3 | 0 | 0 | -3 |
| [lib/features/auth/presentation/views/widgets/verify\_your\_phone\_number\_view\_body.dart](/lib/features/auth/presentation/views/widgets/verify_your_phone_number_view_body.dart) | Dart | -1 | 0 | -1 | -2 |
| [lib/features/home/presentation/views/car\_details.dart](/lib/features/home/presentation/views/car_details.dart) | Dart | 9 | 0 | 3 | 12 |
| [lib/features/home/presentation/views/home\_view.dart](/lib/features/home/presentation/views/home_view.dart) | Dart | -6 | 1 | 0 | -5 |
| [lib/features/home/presentation/views/widgets/car\_details\_view\_body.dart](/lib/features/home/presentation/views/widgets/car_details_view_body.dart) | Dart | 8 | 0 | 3 | 11 |
| [lib/features/home/presentation/views/widgets/nearby\_car.dart](/lib/features/home/presentation/views/widgets/nearby_car.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/features/on\_boarding/presentation/views/main\_view.dart](/lib/features/on_boarding/presentation/views/main_view.dart) | Dart | 9 | -1 | 0 | 8 |
| [lib/features/on\_boarding/presentation/views/startup\_view.dart](/lib/features/on_boarding/presentation/views/startup_view.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/features/on\_boarding/presentation/views/widgets/main\_view\_body.dart](/lib/features/on_boarding/presentation/views/widgets/main_view_body.dart) | Dart | 16 | 0 | 3 | 19 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details