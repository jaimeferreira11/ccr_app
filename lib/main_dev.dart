import 'flavors/enviroment.dart';
import 'main_common.dart';

void main() async {
  await mainCommon(env: Environments.dev);
}
