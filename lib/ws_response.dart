class WsResponse{
  final String? message;
  final bool success;
  final dynamic data;

  WsResponse({this.message, required this.success, this.data});
}