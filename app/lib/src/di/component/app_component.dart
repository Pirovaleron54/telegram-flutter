import 'package:app/src/di/module/app_module.dart';
import 'package:app/src/di/module/td_module.dart';
import 'package:app/src/feature/feature.dart';
import 'package:app/src/navigation/navigation.dart';
import 'package:app/src/navigation/navigation_router.dart';
import 'package:app_controller/app_controller_component.dart';
import 'package:core/core.dart';
import 'package:core_tdlib_api/core_tdlib_api.dart';
import 'package:core_utils/core_utils.dart';
import 'package:jugger/jugger.dart' as j;
import 'package:localization_api/localization_api.dart';
import 'package:td_client/td_client.dart';

@j.Component(modules: <Type>[
  AppModule,
  TdModule,
])
abstract class AppComponent {
  IAppController getAppController();

  ITdConfigProvider getTdConfigProvider();

  TdClient getTdClient();

  IBasicGroupRepository getBasicGroupRepository();

  ISuperGroupRepository getSuperGroupRepository();

  IChatRepository getChatRepository();

  IStickerRepository getStickerRepository();

  IUserRepository getUserRepository();

  ISessionRepository getSessionRepository();

  IFileRepository getIFileRepository();

  IChatFilterRepository getChatFilterRepository();

  IChatMessageRepository getChatMessageRepository();

  IBackgroundRepository getBackgroundRepository();

  ISplitNavigationDelegate getSplitNavigationDelegate();

  SplitNavigationInfoProvider getSplitNavigationInfoProvider();

  DateFormatter getDateFormatter();

  DateParser getDateParser();

  IChatUpdatesProvider getChatUpdatesProvider();

  IChatMessagesUpdatesProvider getChatMessagesUpdatesProvider();

  IChatFiltersUpdatesProvider getChatFiltersUpdatesProvider();

  IFileUpdatesProvider getFileUpdatesProvider();

  ISuperGroupUpdatesProvider getSuperGroupUpdatesProvider();

  IBasicGroupUpdatesProvider getBasicGroupUpdatesProvider();

  IAuthenticationStateUpdatesProvider getAuthenticationStateUpdatesProvider();

  IConnectionStateProvider getConnectionStateProvider();

  IConnectivityProvider getConnectivityProvider();

  IAppLifecycleStateProvider getIAppLifecycleStateProvider();

  FeatureFactory getFeatureFactory();

  ILocalizationManager getLocalizationManager();

  ITdFunctionExecutor getTdFunctionExecutor();
}

@j.componentBuilder
abstract class AppComponentBuilder {
  AppComponentBuilder localizationManager(
    ILocalizationManager localizationManager,
  );

  AppComponent build();
}
