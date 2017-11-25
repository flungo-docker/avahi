#!/bin/sh -e

if [ "${DEBUG}" == "true" ]; then
  set -x
fi


AUG_BASE="/files/etc/avahi/avahi-daemon.conf"

avahi_set() {
  if [ $# -lt 3 ]; then
    >&2 echo "Usage: avahi_set SECTION KEY VALUE"
    return 1
  fi
  augtool set "${AUG_BASE}/$1/$2" "$3"
}

# Defaults
SERVER_ENABLE_DBUS=${SERVER_ENABLE_DBUS:-no}


# server section
if [ -n "${SERVER_HOST_NAME}" ]; then
  avahi_set "server" "host-name" "${SERVER_HOST_NAME}"
fi
if [ -n "${SERVER_DOMAIN_NAME}" ]; then
  avahi_set "server" "domain-name" "${SERVER_DOMAIN_NAME}"
fi
if [ -n "${SERVER_BROWSE_DOMAINS}" ]; then
  avahi_set "server" "browse-domains" "${SERVER_BROWSE_DOMAINS}"
fi
if [ -n "${SERVER_USE_IPV4}" ]; then
  avahi_set "server" "use-ipv4" "${SERVER_USE_IPV4}"
fi
if [ -n "${SERVER_USE_IPV6}" ]; then
  avahi_set "server" "use-ipv6" "${SERVER_USE_IPV6}"
fi
if [ -n "${SERVER_ALLOW_INTERFACES}" ]; then
  avahi_set "server" "allow-interfaces" "${SERVER_ALLOW_INTERFACES}"
fi
if [ -n "${SERVER_DENY_INTERFACES}" ]; then
  avahi_set "server" "deny-interfaces" "${SERVER_DENY_INTERFACES}"
fi
if [ -n "${SERVER_CHECK_RESPONSE_TTL}" ]; then
  avahi_set "server" "check-response-ttl" "${SERVER_CHECK_RESPONSE_TTL}"
fi
if [ -n "${SERVER_USE_IFF_RUNNING}" ]; then
  avahi_set "server" "use-iff-running" "${SERVER_USE_IFF_RUNNING}"
fi
if [ -n "${SERVER_ENABLE_DBUS}" ]; then
  avahi_set "server" "enable-dbus" "${SERVER_ENABLE_DBUS}"
fi
if [ -n "${SERVER_DISALLOW_OTHER_STACKS}" ]; then
  avahi_set "server" "disallow-other-stacks" "${SERVER_DISALLOW_OTHER_STACKS}"
fi
if [ -n "${SERVER_ALLOW_POINT_TO_POINT}" ]; then
  avahi_set "server" "allow-point-to-point" "${SERVER_ALLOW_POINT_TO_POINT}"
fi
if [ -n "${SERVER_CACHE_ENTRIES_MAX}" ]; then
  avahi_set "server" "cache-entries-max" "${SERVER_CACHE_ENTRIES_MAX}"
fi
if [ -n "${SERVER_CLIENTS_MAX}" ]; then
  avahi_set "server" "clients-max" "${SERVER_CLIENTS_MAX}"
fi
if [ -n "${SERVER_OBJECTS_PER_CLIENT_MAX}" ]; then
  avahi_set "server" "objects-per-client-max" "${SERVER_OBJECTS_PER_CLIENT_MAX}"
fi
if [ -n "${SERVER_ENTRIES_PER_ENTRY_GROUP_MAX}" ]; then
  avahi_set "server" "entries-per-entry-group-max" "${SERVER_ENTRIES_PER_ENTRY_GROUP_MAX}"
fi
if [ -n "${SERVER_RATELIMIT_INTERVAL_USEC}" ]; then
  avahi_set "server" "ratelimit-interval-usec" "${SERVER_RATELIMIT_INTERVAL_USEC}"
fi
if [ -n "${SERVER_RATELIMIT_BURST}" ]; then
  avahi_set "server" "ratelimit-burst" "${SERVER_RATELIMIT_BURST}"
fi


# wide-area section
if [ -n "${WIDE_AREA_ENABLE_WIDE_AREA}" ]; then
  avahi_set "wide-area" "enable-wide-area" "${WIDE_AREA_ENABLE_WIDE_AREA}"
fi


# publish section
if [ -n "${PUBLISH_DISABLE_PUBLISHING}" ]; then
  avahi_set "publish" "disable-publishing" "${PUBLISH_DISABLE_PUBLISHING}"
fi
if [ -n "${PUBLISH_DISABLE_USER_SERVICE_PUBLISHING}" ]; then
  avahi_set "publish" "disable-user-service-publishing" "${PUBLISH_DISABLE_USER_SERVICE_PUBLISHING}"
fi
if [ -n "${PUBLISH_ADD_SERVICE_COOKIE}" ]; then
  avahi_set "publish" "add-service-cookie" "${PUBLISH_ADD_SERVICE_COOKIE}"
fi
if [ -n "${PUBLISH_PUBLISH_ADDRESSES}" ]; then
  avahi_set "publish" "publish-addresses" "${PUBLISH_PUBLISH_ADDRESSES}"
fi
if [ -n "${PUBLISH_PUBLISH_HINFO}" ]; then
  avahi_set "publish" "publish-hinfo" "${PUBLISH_PUBLISH_HINFO}"
fi
if [ -n "${PUBLISH_PUBLISH_WORKSTATION}" ]; then
  avahi_set "publish" "publish-workstation" "${PUBLISH_PUBLISH_WORKSTATION}"
fi
if [ -n "${PUBLISH_PUBLISH_DOMAIN}" ]; then
  avahi_set "publish" "publish-domain" "${PUBLISH_PUBLISH_DOMAIN}"
fi
if [ -n "${PUBLISH_PUBLISH_DNS_SERVERS}" ]; then
  avahi_set "publish" "publish-dns-servers" "${PUBLISH_PUBLISH_DNS_SERVERS}"
fi
if [ -n "${PUBLISH_PUBLISH_RESOLV_CONF_DNS_SERVERS}" ]; then
  avahi_set "publish" "publish-resolv-conf-dns-servers" "${PUBLISH_PUBLISH_RESOLV_CONF_DNS_SERVERS}"
fi
if [ -n "${PUBLISH_PUBLISH_AAAA_ON_IPV4}" ]; then
  avahi_set "publish" "publish-aaaa-on-ipv4" "${PUBLISH_PUBLISH_AAAA_ON_IPV4}"
fi
if [ -n "${PUBLISH_PUBLISH_A_ON_IPV6}" ]; then
  avahi_set "publish" "publish-a-on-ipv6" "${PUBLISH_PUBLISH_A_ON_IPV6}"
fi


# reflector section
if [ -n "${REFLECTOR_ENABLE_REFLECTOR}" ]; then
  avahi_set "reflector" "enable-reflector" "${REFLECTOR_ENABLE_REFLECTOR}"
fi
if [ -n "${REFLECTOR_REFLECT_IPV}" ]; then
  avahi_set "reflector" "reflect-ipv" "${REFLECTOR_REFLECT_IPV}"
fi


# rlimits section
if [ -n "${RLIMITS_RLIMIT_AS}" ]; then
  avahi_set "rlimits" "rlimit-as" "${RLIMITS_RLIMIT_AS}"
fi
if [ -n "${RLIMITS_RLIMIT_CORE}" ]; then
  avahi_set "rlimits" "rlimit-core" "${RLIMITS_RLIMIT_CORE}"
fi
if [ -n "${RLIMITS_RLIMIT_DATA}" ]; then
  avahi_set "rlimits" "rlimit-data" "${RLIMITS_RLIMIT_DATA}"
fi
if [ -n "${RLIMITS_RLIMIT_FSIZE}" ]; then
  avahi_set "rlimits" "rlimit-fsize" "${RLIMITS_RLIMIT_FSIZE}"
fi
if [ -n "${RLIMITS_RLIMIT_NOFILE}" ]; then
  avahi_set "rlimits" "rlimit-nofile" "${RLIMITS_RLIMIT_NOFILE}"
fi
if [ -n "${RLIMITS_RLIMIT_STACK}" ]; then
  avahi_set "rlimits" "rlimit-stack" "${RLIMITS_RLIMIT_STACK}"
fi
if [ -n "${RLIMITS_RLIMIT_NPROC}" ]; then
  avahi_set "rlimits" "rlimit-nproc" "${RLIMITS_RLIMIT_NPROC}"
fi


# Execute the provided command
if [ $# == 0 ] || [ "${1:0:1}" == "-" ]; then
  exec avahi-daemon "$@"
else
  exec "$@"
fi
