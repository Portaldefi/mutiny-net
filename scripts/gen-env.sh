
echo "SUBDOMAIN=\"portalnet$1.portaldefi.zone\"" > .env

echo "CADDYFILE=\"./nginx/Caddyfile2\"" >> .env

echo "EXTERNAL_IP=\"127.0.0.1\"" >> .env
echo "RPCPASSWORD=portal_pazz_321" >> .env
echo "RPCUSER=portal_user" >> .env

echo "UACOMMENT=PortalNet" >> .env
echo "SIGNETCHALLENGE=512103dc20c30c690e8c1167b565bd072973f0b8b10dc8a3a9d05a09fb35a4591523df51ae" >> .env
echo "SIGNET_MAGIC=67154f9b" >> .env
echo "ADDNODE=\"$2\"" >> .env

# for rgs_server
echo "LND_PUBKEY=\"\"" >> .env

echo "BLOCKPRODUCTIONDELAY=30" >> .env
echo "MINERENABLED=0" >> .env
echo "NBITS=1e0377ae" >> .env