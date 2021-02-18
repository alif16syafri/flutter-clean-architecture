import 'package:event_bus/event_bus.dart';

export './event/article_event.dart';

class EventBusHelpers {
  static final EventBusHelpers instance = EventBusHelpers._internal();

  EventBusHelpers._internal();

  factory EventBusHelpers() {
    return instance;
  }

  final EventBus _eventBus = EventBus();

  EventBus get eventBus => _eventBus;
}
