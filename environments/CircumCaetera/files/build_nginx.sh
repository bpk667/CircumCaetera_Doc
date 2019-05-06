# Download ModSecurity-nginx connector
cd /opt/
git clone https://github.com/SpiderLabs/ModSecurity-nginx

# Install nginx
wget http://nginx.org/download/nginx-1.14.2.tar.gz
tar xvzf nginx-1.14.2.tar.gz 
cd nginx-1.14.2
./configure --with-compat --add-dynamic-module=../ModSecurity-nginx
make
make install

#Configure nginx
cp /opt/nginx-1.14.2/conf/nginx.conf /usr/local/nginx/conf/
cp /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.orig.conf
sed -i 's/^.*user.*nobody.*$/user www-data;/' /usr/local/nginx/conf/nginx.conf 
sed -i 's/^worker_processes +1;/worker_processes auto;/' /usr/local/nginx/conf/nginx.conf 
sed -i '/error_log.*info/s/^#//' /usr/local/nginx/conf/nginx.conf 
sed -i '/^#pid/s/.*/pid \/run\/nginx.pid;/' /usr/local/nginx/conf/nginx.conf

#Configure ModSecurity
mkdir -p /usr/local/nginx/conf/modsec
cd /usr/local/nginx/conf/modsec
cat >> /usr/local/nginx/conf/modsec/main.conf <<EOL
# From https://github.com/SpiderLabs/ModSecurity/blob/master/
# modsecurity.conf-recommended
#
# Edit to set SecRuleEngine On
Include "/usr/local/nginx/conf/modsec/modsecurity.conf"
# Basic test rule
SecRule ARGS:testparam "@contains test" "id:1234,deny,status:403"
EOL
cp /opt/ModSecurity/modsecurity.conf-recommended /usr/local/nginx/conf/modsec/modsecurity.conf
sed -i 's/SecRuleEngine DetectionOnly/SecRuleEngine On/' /usr/local/nginx/conf/modsec/modsecurity.conf 

loadmodule="load_module modules\/ngx_http_modsecurity_module.so;"
sed -i '/^pid/s/$/\n\n'"${loadmodule}"'\n/' /usr/local/nginx/conf/nginx.conf
enablemodsecurity="modsecurity_rules_file \/usr\/local\/nginx\/conf\/modsec\/main.conf;"
sed -i '/^ \+server /s/$/\n\t'"${enablemodsecurity}"'\n/' /usr/local/nginx/conf/nginx.conf
enablemodsecurity="modsecurity on;"
sed -i '/^ \+server /s/$/\n\t'"${enablemodsecurity}"'/' /usr/local/nginx/conf/nginx.conf

# Copy nginx modules
mkdir /usr/local/nginx/conf/modules
cp /opt/nginx-1.14.2/objs/ngx_http_modsecurity_module.so /usr/local/nginx/conf/modules/
cp /opt/ModSecurity/unicode.mapping /usr/local/nginx/conf/modsec/unicode.mapping

# Test and startup nginx
/usr/local/nginx/sbin/nginx -t
/usr/local/nginx/sbin/nginx

cat << EOF
--
All good
Test nginx: curl localhost
Test ModSecurity: curl localhost?testparam=test
show nginx logs: tail /usr/local/nginx/logs/access.log
show modSecurity related logs: tail /usr/local/nginx/logs/error.log
--
EOF
