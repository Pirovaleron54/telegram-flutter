import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/src/util/util.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tdlib/td_api.dart' as td;
import 'package:jugger/jugger.dart' as j;

typedef ConnectionReadyWidgetFactory = Widget Function(BuildContext context);

class ConnectionStateWidgetFactory {
  @j.inject
  ConnectionStateWidgetFactory(
      {required IStringsProvider stringsProvider,
      required IConnectionStateUpdatesProvider connectionStateUpdatesProvider})
      : _connectionStateUpdatesProvider = connectionStateUpdatesProvider,
        _stringsProvider = stringsProvider {
    _connectionStateUpdatesProvider.connectionStateUpdates
        .listen((td.UpdateConnectionState event) {
      _connectionStateSubject.add(event.state);
    });
  }

  final IStringsProvider _stringsProvider;

  final BehaviorSubject<td.ConnectionState> _connectionStateSubject =
      BehaviorSubject<td.ConnectionState>.seeded(
          const td.ConnectionStateWaitingForNetwork());

  final IConnectionStateUpdatesProvider _connectionStateUpdatesProvider;

  Widget create(
      BuildContext context, ConnectionReadyWidgetFactory readyWidgetFactory) {
    return StreamBuilder<td.ConnectionState>(
      stream: _connectionStateSubject,
      builder:
          (BuildContext context, AsyncSnapshot<td.ConnectionState> snapshot) {
        final td.ConnectionState? state = snapshot.data;

        if (state != null) {
          if (state.getConstructor() == td.ConnectionStateReady.CONSTRUCTOR) {
            return readyWidgetFactory.call(context);
          } else {
            return Text(_getStateText(state) ?? '');
          }
        }
        return readyWidgetFactory.call(context);
      },
    );
  }

  String? _getStateText(td.ConnectionState state) {
    switch (state.getConstructor()) {
      case td.ConnectionStateUpdating.CONSTRUCTOR:
        {
          return _stringsProvider.connectionStateUpdating;
        }
      case td.ConnectionStateConnecting.CONSTRUCTOR:
        {
          return _stringsProvider.connectionStateConnecting;
        }
      case td.ConnectionStateConnectingToProxy.CONSTRUCTOR:
        {
          return _stringsProvider.connectionStateConnectingToProxy;
        }
      case td.ConnectionStateWaitingForNetwork.CONSTRUCTOR:
        {
          return _stringsProvider.connectionStateWaitingForNetwork;
        }
    }

    return null;
  }
}
