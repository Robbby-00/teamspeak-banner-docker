# TeamSpeak Banner Docker

This repository contains a dockerized version of the original project [dennisabrams/teamspeak-banner](https://github.com/dennisabrams/teamspeak-banner). All credits for the development of the project go to [dennisabrams](https://github.com/dennisabrams).

## Environment Variables

The following environment variables can be configured to customize the behavior of the container

| Variable               | Description                                 | Default Value | Required |
| ---------------------- | ------------------------------------------- | ------------- | -------- |
| `SERVERQUERY_USERNAME` | The username for the server query interface | `serveradmin` | ❌       |
| `SERVERQUERY_PASSWORD` | The password for the server query interface | `PASSWORD`    | ✅       |
| `SERVERQUERY_PORT`     | The port for the server query interface     | `10011`       | ❌       |
| `SERVER_IP`            | The IP address of the TeamSpeak server      | `127.0.0.1`   | ❌       |
| `TS3_PORT`             | The port for the TeamSpeak 3 server         | `9987`        | ❌       |
| `PORT`                 | The HTTP port for the banner service        | `80`          | ❌       |

## Further Information

If you wish to customize the banner, you can do so by modifying the `config.php` file through the volume created by the container.

> ⚠️ **Warning**: Do not modify the first few lines of the `config.php` file unless you are certain about what you are doing. These lines handle the library path and environment variable setup, and altering them could cause unexpected behavior.
