abstract class RemoteResponse {}

class NoConnection extends RemoteResponse {}

class ConnectionResponse<T> extends RemoteResponse {
  final T response;
  final String? filter;
  ConnectionResponse(this.response, this.filter);
}
