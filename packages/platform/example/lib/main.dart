import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:platform/platform.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Platform Info Example',
    home: PlatformInfoScreen(),
  ));
}

class PlatformInfoScreen extends StatelessWidget {
  final Platform platform = const LocalPlatform();

  const PlatformInfoScreen({super.key});

  String getPlatform() {
    if (platform.isAndroid) {
      return 'Android';
    }
    if (platform.isIOS) {
      return 'iOS';
    }
    if (platform.isWindows) {
      return 'Windows';
    }
    if (platform.isMacOS) {
      return 'MacOS';
    }
    if (platform.isLinux) {
      return 'Linux';
    }

    return 'Unknown';
  }

  String getOS() {
    return kIsWeb ? 'web' : platform.operatingSystem;
  }

  String getExecutableDetails() {
    return 'Executing: ${platform.executable}\nArgs: ${platform.executableArguments}';
  }

  String getFirstEnvVars() {
    String envVars = '';

    for (MapEntry envVar in platform.environment.entries.take(3)) {
      envVars += '${envVar.key}: ${envVar.value}\n';
    }

    envVars += '...';
    return envVars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hostname: ${platform.localHostname}\n'),
                Text('Platform: ${getPlatform()} ${platform.version}\n'),
                Text(
                    'OS: ${getOS()} | Processors: ${platform.numberOfProcessors}\n'),
                Text(
                    'Currently executing `${platform.executable}` with args: ${platform.executableArguments}\n'),
                Text('Environment variables:\n${getFirstEnvVars()}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
