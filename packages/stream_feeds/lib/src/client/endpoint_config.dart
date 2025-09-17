enum EndpointConfig {
  localhost(
    hostname: 'http://localhost:3030',
    wsEndpoint: 'ws://localhost:8800/api/v2/connect',
  ),

  staging(
    hostname: 'https://chat-edge-frankfurt-ce1.stream-io-api.com',
    wsEndpoint:
        'wss://chat-edge-frankfurt-ce1.stream-io-api.com/api/v2/connect',
  ),

  production(
    hostname: 'https://feeds.stream-io-api.com',
    wsEndpoint: 'wss://feeds.stream-io-api.com/api/v2/connect',
  );

  const EndpointConfig({
    required this.hostname,
    required this.wsEndpoint,
    String? baseFeedsUrl,
  }) : baseFeedsUrl = baseFeedsUrl ?? hostname;

  final String hostname;
  final String wsEndpoint;
  final String baseFeedsUrl;
}
