#!/bin/bash

set -e

cat > /home/odoo/odoo/odoo.conf << EOF
[options]
db_host = ${DB_HOST:-db}
db_user = ${DB_USER:-odoo}
db_password = ${DB_PASSWORD:-odoo}
server_wide_modules = ${ODOO_MODULES:-hw_proxy,hw_escpos,hw_telium_payment_terminal}
EOF

exec python /home/odoo/odoo/odoo.py -c /home/odoo/odoo/odoo.conf
