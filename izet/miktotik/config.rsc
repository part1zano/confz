# may/25/2014 01:45:42 by RouterOS 5.26
# software id = 2FZ7-QJE3
#
/interface bridge
add admin-mac=D4:CA:6D:0D:D1:4F ageing-time=5m arp=enabled auto-mac=no \
    disabled=no forward-delay=15s l2mtu=1598 max-message-age=20s mtu=1500 \
    name=bridge-local priority=0x8000 protocol-mode=rstp transmit-hold-count=\
    6
/interface ethernet
set 0 arp=enabled auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 mac-address=00:24:54:68:0C:23 \
    master-port=none mtu=1500 name=ether1-gateway speed=100Mbps
set 1 arp=enabled auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 mac-address=D4:CA:6D:0D:D1:4F \
    master-port=none mtu=1500 name=ether2-master-local speed=100Mbps
set 2 arp=enabled auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 mac-address=D4:CA:6D:0D:D1:50 \
    master-port=ether2-master-local mtu=1500 name=ether3-slave-local speed=\
    100Mbps
set 3 arp=enabled auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 mac-address=D4:CA:6D:0D:D1:51 \
    master-port=ether2-master-local mtu=1500 name=ether4-slave-local speed=\
    100Mbps
set 4 arp=enabled auto-negotiation=yes bandwidth=unlimited/unlimited \
    disabled=no full-duplex=yes l2mtu=1598 mac-address=D4:CA:6D:0D:D1:52 \
    master-port=ether2-master-local mtu=1500 name=ether5-slave-local speed=\
    100Mbps
/interface ethernet switch
set 0 mirror-source=none mirror-target=none name=switch1
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk eap-methods=\
    passthrough group-ciphers=tkip,aes-ccm group-key-update=5m \
    interim-update=0s management-protection=disabled \
    management-protection-key="" mode=dynamic-keys name=default \
    radius-eap-accounting=no radius-mac-accounting=no \
    radius-mac-authentication=no radius-mac-caching=disabled \
    radius-mac-format=XX:XX:XX:XX:XX:XX radius-mac-mode=as-username \
    static-algo-0=none static-algo-1=none static-algo-2=none static-algo-3=\
    none static-key-0="" static-key-1="" static-key-2="" static-key-3="" \
    static-sta-private-algo=none static-sta-private-key="" \
    static-transmit-key=key-0 supplicant-identity=MikroTik tls-certificate=\
    none tls-mode=no-certificates unicast-ciphers=tkip,aes-ccm \
    wpa-pre-shared-key=afr.,bkk wpa2-pre-shared-key=afr.,bkk
/interface wireless
set 0 adaptive-noise-immunity=none allow-sharedkey=no antenna-gain=0 area="" \
    arp=enabled band=2ghz-b/g/n basic-rates-a/g=6Mbps basic-rates-b=1Mbps \
    bridge-mode=enabled channel-width=20/40mhz-ht-above compression=no \
    country=no_country_set default-ap-tx-limit=0 default-authentication=yes \
    default-client-tx-limit=0 default-forwarding=yes dfs-mode=none \
    disable-running-check=no disabled=no disconnect-timeout=3s distance=\
    indoors frame-lifetime=0 frequency=2412 frequency-mode=manual-txpower \
    frequency-offset=0 hide-ssid=yes ht-ampdu-priorities=0 ht-amsdu-limit=\
    8192 ht-amsdu-threshold=8192 ht-basic-mcs=\
    mcs-0,mcs-1,mcs-2,mcs-3,mcs-4,mcs-5,mcs-6,mcs-7 ht-guard-interval=any \
    ht-rxchains=0,1 ht-supported-mcs="mcs-0,mcs-1,mcs-2,mcs-3,mcs-4,mcs-5,mcs-\
    6,mcs-7,mcs-8,mcs-9,mcs-10,mcs-11,mcs-12,mcs-13,mcs-14,mcs-15,mcs-16,mcs-1\
    7,mcs-18,mcs-19,mcs-20,mcs-21,mcs-22,mcs-23" ht-txchains=0,1 \
    hw-fragmentation-threshold=disabled hw-protection-mode=none \
    hw-protection-threshold=0 hw-retries=7 l2mtu=2290 mac-address=\
    D4:CA:6D:0D:D1:53 max-station-count=2007 mode=ap-bridge mtu=1500 \
    multicast-helper=default name=wlan1 noise-floor-threshold=default \
    nv2-cell-radius=30 nv2-noise-floor-offset=default nv2-preshared-key="" \
    nv2-qos=default nv2-queue-count=2 nv2-security=disabled \
    on-fail-retry-time=100ms periodic-calibration=default \
    periodic-calibration-interval=60 preamble-mode=both \
    proprietary-extensions=post-2.9.25 radio-name=D4CA6D0DD153 \
    rate-selection=advanced rate-set=default scan-list=default \
    security-profile=default ssid=libastral station-bridge-clone-mac=\
    00:00:00:00:00:00 supported-rates-a/g=\
    6Mbps,9Mbps,12Mbps,18Mbps,24Mbps,36Mbps,48Mbps,54Mbps supported-rates-b=\
    1Mbps,2Mbps,5.5Mbps,11Mbps tdma-period-size=2 tx-power-mode=default \
    update-stats-interval=disabled wds-cost-range=50-150 wds-default-bridge=\
    none wds-default-cost=100 wds-ignore-ssid=no wds-mode=disabled \
    wireless-protocol=802.11 wmm-support=disabled
/interface wireless manual-tx-power-table
set wlan1 manual-tx-powers="1Mbps:17,2Mbps:17,5.5Mbps:17,11Mbps:17,6Mbps:17,9M\
    bps:17,12Mbps:17,18Mbps:17,24Mbps:17,36Mbps:17,48Mbps:17,54Mbps:17,HT20-0:\
    17,HT20-1:17,HT20-2:17,HT20-3:17,HT20-4:17,HT20-5:17,HT20-6:17,HT20-7:17,H\
    T40-0:17,HT40-1:17,HT40-2:17,HT40-3:17,HT40-4:17,HT40-5:17,HT40-6:17,HT40-\
    7:17"
/interface wireless nstreme
set wlan1 disable-csma=no enable-nstreme=no enable-polling=yes framer-limit=\
    3200 framer-policy=none
/ip hotspot profile
set [ find default=yes ] dns-name="" hotspot-address=0.0.0.0 html-directory=\
    hotspot http-cookie-lifetime=3d http-proxy=0.0.0.0:0 login-by=\
    cookie,http-chap name=default rate-limit="" smtp-server=0.0.0.0 \
    split-user-domain=no use-radius=no
/ip hotspot user profile
set [ find default=yes ] idle-timeout=none keepalive-timeout=2m name=default \
    shared-users=1 status-autorefresh=1m transparent-proxy=no
/ip ipsec proposal
set [ find default=yes ] auth-algorithms=sha1 disabled=no enc-algorithms=3des \
    lifetime=30m name=default pfs-group=modp1024
/ip pool
add name=default-dhcp ranges=192.168.88.10-192.168.88.254
/ip dhcp-server
add address-pool=default-dhcp authoritative=after-2sec-delay bootp-support=\
    static disabled=no interface=bridge-local lease-time=3d name=default
/ppp profile
set 0 change-tcp-mss=yes name=default only-one=default use-compression=\
    default use-encryption=default use-mpls=default use-vj-compression=\
    default
set 1 change-tcp-mss=yes name=default-encryption only-one=default \
    use-compression=default use-encryption=yes use-mpls=default \
    use-vj-compression=default
/interface ovpn-client
add add-default-route=no auth=sha1 certificate=cert2 cipher=aes256 \
    connect-to=37.252.124.82 disabled=no mac-address=FE:8E:ED:54:31:AC \
    max-mtu=1500 mode=ip name=ovpn-out1 password="" port=1194 profile=default \
    user=user
/interface pptp-client
add add-default-route=no allow=mschap2 connect-to=37.252.124.82 \
    dial-on-demand=no disabled=yes max-mru=1460 max-mtu=1460 mrru=disabled \
    name=pptp-out1 password=772NdoSgrz profile=default-encryption user=\
    chupacabra0812
/queue type
set 0 kind=pfifo name=default pfifo-limit=50
set 1 kind=pfifo name=ethernet-default pfifo-limit=50
set 2 kind=sfq name=wireless-default sfq-allot=1514 sfq-perturb=5
set 3 kind=red name=synchronous-default red-avg-packet=1000 red-burst=20 \
    red-limit=60 red-max-threshold=50 red-min-threshold=10
set 4 kind=sfq name=hotspot-default sfq-allot=1514 sfq-perturb=5
set 5 kind=none name=only-hardware-queue
set 6 kind=mq-pfifo mq-pfifo-limit=50 name=multi-queue-ethernet-default
set 7 kind=pfifo name=default-small pfifo-limit=10
/routing bgp instance
set default as=65530 client-to-client-reflection=yes disabled=no \
    ignore-as-path-len=no name=default out-filter="" redistribute-connected=\
    no redistribute-ospf=no redistribute-other-bgp=no redistribute-rip=no \
    redistribute-static=no router-id=0.0.0.0 routing-table=""
/routing ospf instance
set [ find default=yes ] disabled=no distribute-default=never in-filter=\
    ospf-in metric-bgp=auto metric-connected=20 metric-default=1 \
    metric-other-ospf=auto metric-rip=20 metric-static=20 name=default \
    out-filter=ospf-out redistribute-bgp=no redistribute-connected=no \
    redistribute-other-ospf=no redistribute-rip=no redistribute-static=no \
    router-id=0.0.0.0
/routing ospf area
set [ find default=yes ] area-id=0.0.0.0 disabled=no instance=default name=\
    backbone type=default
/snmp community
set [ find default=yes ] addresses=0.0.0.0/0 authentication-password="" \
    authentication-protocol=MD5 encryption-password="" encryption-protocol=\
    DES name=public read-access=yes security=none write-access=no
/system logging action
set 0 memory-lines=100 memory-stop-on-full=no name=memory target=memory
set 1 disk-file-count=2 disk-file-name=log disk-lines-per-file=100 \
    disk-stop-on-full=no name=disk target=disk
set 2 name=echo remember=yes target=echo
set 3 bsd-syslog=no name=remote remote-port=514 src-address=0.0.0.0 \
    syslog-facility=daemon syslog-severity=auto target=remote
/user group
set read name=read policy="local,telnet,ssh,reboot,read,test,winbox,password,w\
    eb,sniff,sensitive,api,!ftp,!write,!policy" skin=default
set write name=write policy="local,telnet,ssh,reboot,read,write,test,winbox,pa\
    ssword,web,sniff,sensitive,api,!ftp,!policy" skin=default
set full name=full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,\
    winbox,password,web,sniff,sensitive,api" skin=default
/interface bridge port
add bridge=bridge-local disabled=no edge=auto external-fdb=auto horizon=none \
    interface=ether2-master-local path-cost=10 point-to-point=auto priority=\
    0x80
add bridge=bridge-local disabled=no edge=auto external-fdb=auto horizon=none \
    interface=wlan1 path-cost=10 point-to-point=auto priority=0x80
/interface bridge settings
set use-ip-firewall=no use-ip-firewall-for-pppoe=no use-ip-firewall-for-vlan=\
    no
/interface ethernet switch port
set 0 vlan-header=leave-as-is vlan-mode=disabled
set 1 vlan-header=leave-as-is vlan-mode=disabled
set 2 vlan-header=leave-as-is vlan-mode=disabled
set 3 vlan-header=leave-as-is vlan-mode=disabled
set 4 vlan-header=leave-as-is vlan-mode=disabled
set 5 vlan-header=leave-as-is vlan-mode=disabled
/interface l2tp-server server
set authentication=pap,chap,mschap1,mschap2 default-profile=\
    default-encryption enabled=no keepalive-timeout=30 max-mru=1460 max-mtu=\
    1460 mrru=disabled
/interface ovpn-server server
set auth=sha1,md5 certificate=none cipher=blowfish128,aes128 default-profile=\
    default enabled=no keepalive-timeout=60 mac-address=FE:18:31:AC:75:F6 \
    max-mtu=1500 mode=ip netmask=24 port=1194 require-client-certificate=no
/interface pptp-server server
set authentication=mschap1,mschap2 default-profile=default-encryption \
    enabled=no keepalive-timeout=30 max-mru=1460 max-mtu=1460 mrru=disabled
/interface sstp-server server
set authentication=pap,chap,mschap1,mschap2 certificate=none default-profile=\
    default enabled=no keepalive-timeout=60 max-mru=1500 max-mtu=1500 mrru=\
    disabled port=443 verify-client-certificate=no
/interface wireless align
set active-mode=yes audio-max=-20 audio-min=-100 audio-monitor=\
    00:00:00:00:00:00 filter-mac=00:00:00:00:00:00 frame-size=300 \
    frames-per-second=25 receive-all=no ssid-all=no
/interface wireless sniffer
set channel-time=200ms file-limit=10 file-name="" memory-limit=10 \
    multiple-channels=no only-headers=no receive-errors=no streaming-enabled=\
    no streaming-max-rate=0 streaming-server=0.0.0.0
/interface wireless snooper
set channel-time=200ms multiple-channels=yes receive-errors=no
/ip accounting
set account-local-traffic=no enabled=no threshold=256
/ip accounting web-access
set accessible-via-web=no address=0.0.0.0/0
/ip address
add address=192.168.88.1/24 comment="default configuration" disabled=no \
    interface=wlan1 network=192.168.88.0
add address=10.184.196.143/24 disabled=no interface=ether1-gateway network=\
    10.184.196.0
/ip dhcp-client
add add-default-route=yes comment="default configuration" \
    default-route-distance=1 disabled=yes interface=ether1-gateway \
    use-peer-dns=yes use-peer-ntp=yes
/ip dhcp-server config
set store-leases-disk=5m
/ip dhcp-server lease
add address=192.168.88.252 client-id=\
    ff:fe:6f:9f:99:0:1:0:1:19:b7:a5:3c:b4:82:fe:6f:9f:99 disabled=no \
    mac-address=B4:82:FE:6F:9F:99 server=default
add address=192.168.88.253 disabled=no mac-address=00:24:1D:D2:50:0F server=\
    default
/ip dhcp-server network
add address=192.168.88.0/24 comment="default configuration" dhcp-option="" \
    dns-server=192.168.88.1,37.252.124.82 gateway=192.168.88.1 ntp-server="" \
    wins-server=""
/ip dns
set allow-remote-requests=yes cache-max-ttl=1w cache-size=2048KiB \
    max-udp-packet-size=4096 servers=37.252.124.82,8.8.8.8
/ip dns static
add address=192.168.88.1 disabled=no name=router ttl=1d
add address=37.252.124.82 disabled=no name=vpn ttl=1d
add address=8.8.8.8 disabled=no name=google ttl=1d
/ip firewall connection tracking
set enabled=yes generic-timeout=10m icmp-timeout=10s tcp-close-timeout=10s \
    tcp-close-wait-timeout=10s tcp-established-timeout=1d \
    tcp-fin-wait-timeout=10s tcp-last-ack-timeout=10s \
    tcp-syn-received-timeout=5s tcp-syn-sent-timeout=5s tcp-syncookie=no \
    tcp-time-wait-timeout=10s udp-stream-timeout=3m udp-timeout=10s
/ip firewall filter
add action=accept chain=input comment="default configuration" disabled=no \
    protocol=icmp
add action=accept chain=input comment="default configuration" \
    connection-state=established disabled=no
add action=accept chain=input comment="default configuration" \
    connection-state=related disabled=no
add action=drop chain=input comment="default configuration" disabled=no \
    in-interface=ether1-gateway
add action=accept chain=forward comment="default configuration" \
    connection-state=established disabled=no
add action=accept chain=forward comment="default configuration" \
    connection-state=related disabled=no
add action=drop chain=forward comment="default configuration" \
    connection-state=invalid disabled=no
/ip firewall mangle
add action=mark-routing chain=prerouting disabled=no new-routing-mark=vpn \
    passthrough=yes src-address=192.168.88.0/24
add action=mark-routing chain=prerouting disabled=no dst-address=\
    192.168.100.18 new-routing-mark=billing passthrough=yes src-address=\
    192.168.88.0/24
/ip firewall nat
add action=masquerade chain=srcnat comment="default configuration" disabled=\
    no out-interface=ether1-gateway
add action=masquerade chain=srcnat comment=ovpn disabled=no out-interface=\
    ovpn-out1 routing-mark=vpn
add action=masquerade chain=srcnat comment=pptp disabled=no out-interface=\
    pptp-out1 routing-mark=vpn
add action=dst-nat chain=dstnat disabled=yes dst-port=2222 protocol=tcp \
    to-addresses=192.168.88.253 to-ports=22
/ip firewall service-port
set ftp disabled=no ports=21
set tftp disabled=no ports=69
set irc disabled=no ports=6667
set h323 disabled=no
set sip disabled=no ports=5060,5061 sip-direct-media=yes
set pptp disabled=no
/ip hotspot service-port
set ftp disabled=no ports=21
/ip neighbor discovery
set ether1-gateway disabled=yes
set ether2-master-local disabled=no
set ether3-slave-local disabled=no
set ether4-slave-local disabled=no
set ether5-slave-local disabled=no
set wlan1 disabled=yes
set bridge-local disabled=no
set pptp-out1 disabled=yes
set ovpn-out1 disabled=yes
/ip proxy
set always-from-cache=no cache-administrator=webmaster cache-hit-dscp=4 \
    cache-on-disk=no enabled=no max-cache-size=unlimited \
    max-client-connections=600 max-fresh-time=3d max-server-connections=600 \
    parent-proxy=0.0.0.0 parent-proxy-port=0 port=8080 serialize-connections=\
    no src-address=0.0.0.0
/ip route
add comment=ovpn disabled=no distance=1 dst-address=0.0.0.0/0 gateway=\
    172.16.32.5 routing-mark=vpn scope=30 target-scope=10
add comment=pptp disabled=yes distance=1 dst-address=0.0.0.0/0 gateway=\
    172.16.32.1 routing-mark=vpn scope=30 target-scope=10
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=10.184.196.1 scope=\
    30 target-scope=10
/ip service
set telnet address="" disabled=yes port=23
set ftp address="" disabled=yes port=21
set www address="" disabled=no port=80
set ssh address="" disabled=no port=22
set www-ssl address="" certificate=none disabled=yes port=443
set api address="" disabled=yes port=8728
set winbox address="" disabled=yes port=8291
/ip smb
set allow-guests=yes comment=MikrotikSMB domain=MSHOME enabled=yes \
    interfaces=all
/ip smb shares
set [ find default=yes ] comment="default share" directory=/pub disabled=no \
    max-sessions=10 name=pub
/ip smb users
set [ find default=yes ] disabled=no name=guest password="" read-only=yes
/ip socks
set connection-idle-timeout=2m enabled=no max-connections=200 port=1080
/ip traffic-flow
set active-flow-timeout=30m cache-entries=4k enabled=no \
    inactive-flow-timeout=15s interfaces=all
/ip upnp
set allow-disable-external-interface=yes enabled=no show-dummy-rule=yes
/mpls
set dynamic-label-range=16-1048575 propagate-ttl=yes
/mpls interface
set [ find default=yes ] disabled=no interface=all mpls-mtu=1508
/mpls ldp
set distribute-for-default-route=no enabled=no hop-limit=255 loop-detect=no \
    lsr-id=0.0.0.0 path-vector-limit=255 transport-address=0.0.0.0 \
    use-explicit-null=no
/port firmware
set directory=firmware ignore-directip-modem=no
/ppp aaa
set accounting=yes interim-update=0s use-radius=no
/queue interface
set ether1-gateway queue=only-hardware-queue
set ether2-master-local queue=only-hardware-queue
set ether3-slave-local queue=only-hardware-queue
set ether4-slave-local queue=only-hardware-queue
set ether5-slave-local queue=only-hardware-queue
set wlan1 queue=wireless-default
set ovpn-out1 queue=default
/radius incoming
set accept=no port=3799
/routing bfd interface
set [ find default=yes ] disabled=no interface=all interval=0.2s min-rx=0.2s \
    multiplier=5
/routing mme
set bidirectional-timeout=2 gateway-class=none gateway-keepalive=1m \
    gateway-selection=no-gateway origination-interval=5s preferred-gateway=\
    0.0.0.0 timeout=1m ttl=50
/routing rip
set distribute-default=never garbage-timer=2m metric-bgp=1 metric-connected=1 \
    metric-default=1 metric-ospf=1 metric-static=1 redistribute-bgp=no \
    redistribute-connected=no redistribute-ospf=no redistribute-static=no \
    routing-table=main timeout-timer=3m update-timer=30s
/snmp
set contact="" enabled=no engine-id="" location="" trap-generators="" \
    trap-target="" trap-version=1
/system clock
set time-zone-name=Europe/Moscow
/system clock manual
set dst-delta=+00:00 dst-end="jan/01/1970 00:00:00" dst-start=\
    "jan/01/1970 00:00:00" time-zone=+04:00
/system identity
set name=MikroTik
/system leds
set 0 disabled=no interface=wlan1 leds=wlan-led type=wireless-status
/system logging
set 0 action=memory disabled=no prefix="" topics=info
set 1 action=memory disabled=no prefix="" topics=error
set 2 action=memory disabled=no prefix="" topics=warning
set 3 action=echo disabled=no prefix="" topics=critical
/system note
set note="" show-at-login=yes
/system ntp client
set enabled=yes mode=unicast primary-ntp=128.138.141.172 secondary-ntp=\
    95.104.193.133
/system resource irq
set 0 cpu=auto
set 1 cpu=auto
set 2 cpu=auto
set 3 cpu=auto
/system routerboard settings
set boot-device=nand-if-fail-then-ethernet boot-protocol=bootp cpu-frequency=\
    600MHz force-backup-booter=no silent-boot=no
/system upgrade mirror
set check-interval=1d enabled=no primary-server=0.0.0.0 secondary-server=\
    0.0.0.0 user=""
/system watchdog
set auto-send-supout=no automatic-supout=yes no-ping-delay=5m watch-address=\
    none watchdog-timer=yes
/tool bandwidth-server
set allocate-udp-ports-from=2000 authenticate=yes enabled=no max-sessions=100
/tool e-mail
set address=37.252.124.82 from=<router@bein.link> password=fgihad5 port=25 \
    starttls=no user=che
/tool graphing
set page-refresh=300 store-every=5min
/tool graphing interface
add allow-address=0.0.0.0/0 disabled=no interface=all store-on-disk=yes
/tool mac-server
set [ find default=yes ] disabled=yes interface=all
add disabled=no interface=ether2-master-local
add disabled=no interface=ether3-slave-local
add disabled=no interface=ether4-slave-local
add disabled=no interface=ether5-slave-local
add disabled=no interface=wlan1
add disabled=no interface=bridge-local
/tool mac-server mac-winbox
set [ find default=yes ] disabled=yes interface=all
add disabled=no interface=ether2-master-local
add disabled=no interface=ether3-slave-local
add disabled=no interface=ether4-slave-local
add disabled=no interface=ether5-slave-local
add disabled=no interface=wlan1
add disabled=no interface=bridge-local
/tool mac-server ping
set enabled=yes
/tool sms
set allowed-number="" channel=0 keep-max-sms=0 receive-enabled=no secret=""
/tool sniffer
set file-limit=1000KiB file-name="" filter-ip-address="" filter-ip-protocol=\
    "" filter-mac-address="" filter-mac-protocol="" filter-port="" \
    filter-stream=yes interface=all memory-limit=100KiB memory-scroll=yes \
    only-headers=no streaming-enabled=no streaming-server=0.0.0.0
/tool traffic-generator
set latency-distribution-scale=10 test-id=0
/user aaa
set accounting=yes default-group=read exclude-groups="" interim-update=0s \
    use-radius=no
