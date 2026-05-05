#!/bin/bash

set -e

cat > /home/odoo/odoo/odoo.conf << EOF
[options]
db_host = ${POSTGRES_HOST:-db}
db_user = ${POSTGRES_USER:-odoo}
db_password = ${POSTGRES_PASSWORD:-odoo}
server_wide_modules = ${ODOO_MODULES:-hw_proxy,hw_escpos,hw_telium_payment_terminal}
EOF

exec python /home/odoo/odoo/odoo.py -c /home/odoo/odoo/odoo.conf
