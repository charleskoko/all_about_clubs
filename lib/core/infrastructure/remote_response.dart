abstract class RemoteResponse {}

class NoConnection extends RemoteResponse {}

class ConnectionResponse<T> extends RemoteResponse {
  final T response;
  ConnectionResponse(this.response);
}
