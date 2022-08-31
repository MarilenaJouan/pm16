#!/bin/bash

# Script was based on: https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-ubuntu-20-04
# First argument: Client identifier

CA_DIR=/home/headnode/EasyRSA-v3.0.6/pki
CLIENT_CRT_DIR=/home/headnode/EasyRSA-v3.0.6/pki/issued
CLIENT_KEY_DIR=/home/headnode/EasyRSA-v3.0.6/pki/private
TA_DIR=/home/headnode/EasyRSA-v3.0.6
OUTPUT_DIR=/home/headnode
BASE_CONFIG=/home/headnode/${1}.conf


cat ${BASE_CONFIG} > ${OUTPUT_DIR}/${1}.ovpn

echo -e '<ca>' >> ${OUTPUT_DIR}/${1}.ovpn 
cat "${CA_DIR}/ca.crt" >> ${OUTPUT_DIR}/${1}.ovpn 
echo -e '</ca>\n<cert>' >> ${OUTPUT_DIR}/${1}.ovpn 
cat "${CLIENT_CRT_DIR}/${1}.crt" >> ${OUTPUT_DIR}/${1}.ovpn 
echo -e '</cert>\n<key>' >> ${OUTPUT_DIR}/${1}.ovpn 
cat "${CLIENT_KEY_DIR}/${1}.key" >> ${OUTPUT_DIR}/${1}.ovpn 
echo -e '</key>\n<tls-crypt>' >> ${OUTPUT_DIR}/${1}.ovpn 
cat "${TA_DIR}/ta.key" >> ${OUTPUT_DIR}/${1}.ovpn 
echo -e '</tls-crypt>' >> ${OUTPUT_DIR}/${1}.ovpn  
