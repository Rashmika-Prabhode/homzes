import "dart:developer";

void printLog(message, [String? requestId]) {
  String printMsg = "";
  if (requestId?.isNotEmpty ?? false) {
    printMsg = "$requestId -> ";
  }
  log(printMsg + message.toString());
}
