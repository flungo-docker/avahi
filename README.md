# Avahi Docker Image

Docker image for the Avahi mDNS/DNS-SD daemon. Built on Alpine Linux to make the image as small as possible. Highly configurable through environment variables to support most usecases which need an Avahi Daemon.

## Usage

Basic usage consists of running the docker container with the appropriate environment variables and volumes to achieve your desired behaviour.

```shell
docker run flungo/avahi
```

## Environment variables

Environment variables are made available for all of the options of `avahi-daemon.conf`. The variable names are in the format `<SECTION>_<OPTION>` where `<SECTION>` is the capitalised section name from the configuration file and `<OPTION>` is the capitalised option name with `-` replaced by `_`. The table below outlines the available options:

| Section     | Option                            | Variable                                  |
| ----------- | --------------------------------- | ----------------------------------------- |
| `server`    | `host-name`                       | `SERVER_HOST_NAME`                        |
| `server`    | `domain-name`                     | `SERVER_DOMAIN_NAME`                      |
| `server`    | `browse-domains`                  | `SERVER_BROWSE_DOMAINS`                   |
| `server`    | `use-ipv4`                        | `SERVER_USE_IPV4`                         |
| `server`    | `use-ipv6`                        | `SERVER_USE_IPV6`                         |
| `server`    | `allow-interfaces`                | `SERVER_ALLOW_INTERFACES`                 |
| `server`    | `deny-interfaces`                 | `SERVER_DENY_INTERFACES`                  |
| `server`    | `check-response-ttl`              | `SERVER_CHECK_RESPONSE_TTL`               |
| `server`    | `use-iff-running`                 | `SERVER_USE_IFF_RUNNING`                  |
| `server`    | `enable-dbus`                     | `SERVER_ENABLE_DBUS`                      |
| `server`    | `disallow-other-stacks`           | `SERVER_DISALLOW_OTHER_STACKS`            |
| `server`    | `allow-point-to-point`            | `SERVER_ALLOW_POINT_TO_POINT`             |
| `server`    | `cache-entries-max`               | `SERVER_CACHE_ENTRIES_MAX`                |
| `server`    | `clients-max`                     | `SERVER_CLIENTS_MAX`                      |
| `server`    | `objects-per-client-max`          | `SERVER_OBJECTS_PER_CLIENT_MAX`           |
| `server`    | `entries-per-entry-group-max`     | `SERVER_ENTRIES_PER_ENTRY_GROUP_MAX`      |
| `server`    | `ratelimit-interval-usec`         | `SERVER_RATELIMIT_INTERVAL_USEC`          |
| `server`    | `ratelimit-burst`                 | `SERVER_RATELIMIT_BURST`                  |
| `wide-area` | `enable-wide-area`                | `WIDE_AREA_ENABLE_WIDE_AREA`              |
| `publish`   | `disable-publishing`              | `PUBLISH_DISABLE_PUBLISHING`              |
| `publish`   | `disable-user-service-publishing` | `PUBLISH_DISABLE_USER_SERVICE_PUBLISHING` |
| `publish`   | `add-service-cookie`              | `PUBLISH_ADD_SERVICE_COOKIE`              |
| `publish`   | `publish-addresses`               | `PUBLISH_PUBLISH_ADDRESSES`               |
| `publish`   | `publish-hinfo`                   | `PUBLISH_PUBLISH_HINFO`                   |
| `publish`   | `publish-workstation`             | `PUBLISH_PUBLISH_WORKSTATION`             |
| `publish`   | `publish-domain`                  | `PUBLISH_PUBLISH_DOMAIN`                  |
| `publish`   | `publish-dns-servers`             | `PUBLISH_PUBLISH_DNS_SERVERS`             |
| `publish`   | `publish-resolv-conf-dns-servers` | `PUBLISH_PUBLISH_RESOLV_CONF_DNS_SERVERS` |
| `publish`   | `publish-aaaa-on-ipv4`            | `PUBLISH_PUBLISH_AAAA_ON_IPV4`            |
| `publish`   | `publish-a-on-ipv6`               | `PUBLISH_PUBLISH_A_ON_IPV6`               |
| `reflector` | `enable-reflector`                | `REFLECTOR_ENABLE_REFLECTOR`              |
| `reflector` | `reflect-ipv`                     | `REFLECTOR_REFLECT_IPV`                   |
| `rlimits`   | `rlimit-as`                       | `RLIMITS_RLIMIT_AS`                       |
| `rlimits`   | `rlimit-core`                     | `RLIMITS_RLIMIT_CORE`                     |
| `rlimits`   | `rlimit-data`                     | `RLIMITS_RLIMIT_DATA`                     |
| `rlimits`   | `rlimit-fsize`                    | `RLIMITS_RLIMIT_FSIZE`                    |
| `rlimits`   | `rlimit-nofile`                   | `RLIMITS_RLIMIT_NOFILE`                   |
| `rlimits`   | `rlimit-stack`                    | `RLIMITS_RLIMIT_STACK`                    |
| `rlimits`   | `rlimit-nproc`                    | `RLIMITS_RLIMIT_NPROC`                    |

If you find an option you require is missing, report this or make a PR adding that feature.

## Examples

This sections contains several example usages for the. If you use this container for a common scenrio or if any of the examples can be improved, please let me know the configurtion you have used so that I can improve this documentation.

### Reflect mDNS broadcasts between networks

To reflect mDNS broadcasts between two docker networks (`net1` and `net2` in the example given) the reflector should be enabled by setting `REFLECTOR_ENABLE_REFLECTOR=yes`.

```shell
# Create a container named mdns-reflector attached to net1
docker run -d --name=mdns-reflector \
  --network net1 \
  -e REFLECTOR_ENABLE_REFLECTOR=yes \
  flungo/avahi
# Attach the container to the net2 network
docker network connect net2 mdns-reflector
```
