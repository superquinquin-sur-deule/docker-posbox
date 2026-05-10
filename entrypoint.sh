#!/bin/bash

set -e
cd /home/odoo/odoo

if [ ! -f odoo.conf ]; then
    python odoo.py \
        --init=base --without-demo=all --stop-after-init \
        --database=odoo \
        --db_host=${POSTGRES_HOST:-db} \
        --db_user=${POSTGRES_USER:-odoo} \
        --db_password=${POSTGRES_PASSWORD:-odoo}
fi

cat > odoo.conf << EOF
[options]
db_host = ${POSTGRES_HOST:-db}
db_user = ${POSTGRES_USER:-odoo}
db_password = ${POSTGRES_PASSWORD:-odoo}
server_wide_modules = ${ODOO_MODULES:-hw_proxy,hw_escpos,hw_telium_payment_terminal}
EOF

exec python odoo.py --config=odoo.conf
