
# For [client] section
HAWKBIT_SERVER ?= "10.10.0.254:8080"
GATEWAY_TOKEN ?= "cb115a721af28f781b493fa467819ef5"

# For [device] section
MAC_ADDRESS ?= "ff:ff:ff:ff:ff:ff"
HW_REVISION ?= "4"
MODEL ?= "RaspberryPi-4"
PRODUCT ?= "RaspberryPi"
SERIALNUMBER ?= "N/A"

do_install_append () {
	sed -i -e "3 s/10.10.0.254:8080/${HAWKBIT_SERVER}/g" ${D}${sysconfdir}/${PN}/config.conf
	sed -i -e "18 s/auth_token/#auth_token/g" ${D}${sysconfdir}/${PN}/config.conf
	sed -i -e "21 s/#gateway_token/gateway_token/g" ${D}${sysconfdir}/${PN}/config.conf
	sed -i -e "21 s/cb115a721af28f781b493fa467819ef5/${GATEWAY_TOKEN}/g" ${D}${sysconfdir}/${PN}/config.conf

	sed -i -e "50 s/ff:ff:ff:ff:ff:ff/${MAC_ADDRESS}/g" ${D}${sysconfdir}/${PN}/config.conf
	sed -i -e "51 s/2/${HW_REVISION}/g" ${D}${sysconfdir}/${PN}/config.conf
	sed -i -e "52 s/T1/${MODEL}/g" ${D}${sysconfdir}/${PN}/config.conf
	echo "product                   = ${PRODUCT}" >> ${D}${sysconfdir}/${PN}/config.conf
	echo "serialnumber              = ${SERIALNUMBER}" >> ${D}${sysconfdir}/${PN}/config.conf
}
