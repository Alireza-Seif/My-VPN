class VpnInfo {
  late final String hostname,
      ip,
      ping,
      countryLongName,
      countryShortName,
      base64OpenVPNConfigurationData;
  late final int speed, vpnSessionsNum;

  VpnInfo({
    required this.hostname,
    required this.ip,
    required this.ping,
    required this.countryLongName,
    required this.countryShortName,
    required this.base64OpenVPNConfigurationData,
    required this.speed,
    required this.vpnSessionsNum,
  });

  VpnInfo.fromJson(Map<String, dynamic> jsonData) {
    hostname = jsonData['HostName'] ?? '';
    ip = jsonData['IP'] ?? '';
    ping = jsonData['Ping'].toString();
    speed = jsonData['Speed'] ?? 0;
    countryLongName = jsonData['CountryLong'] ?? '';
    countryShortName = jsonData['CountryShort'] ?? '';
    vpnSessionsNum = jsonData['NumVpnSessions'] ?? 0;
    base64OpenVPNConfigurationData =
        jsonData['OpenVPN_ConfigData_Base64'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final jsonData = <String, dynamic>{};
    jsonData['HostName'] = hostname;
    jsonData['IP'] = ip;
    jsonData['Ping'] = ping;
    jsonData['Speed'] = speed;
    jsonData['CountryLong'] = countryLongName;
    jsonData['CountryShort'] = countryShortName;
    jsonData['NumVpnSessions'] = vpnSessionsNum;
    jsonData['OpenVPN_ConfigData_Base64'] = base64OpenVPNConfigurationData;
    return jsonData;
  }
}
