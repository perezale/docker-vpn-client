VPN_SERVER=vpn.pladema.net
VPN_ROUTING_IPS="10.80.0.0/24"
VPN_PASSOWRD=Cam.@.2019

docker run --net=host \
           --privileged=true \
           --device=/dev/ppp \
           --cap-add=NET_ADMIN \
           --name pptp-tunnel-$VPN_SERVER \
           -e VPN_ROUTING_IPS="$VPN_ROUTING_IPS" \
           --env-file <(cat <<-END
		VPN_PASSWORD=$VPN_PASSOWRD
		END
           ) \
           --detach \
           gzm55/vpn-client pptp vpn.pladema.net vpn-cmt-2
