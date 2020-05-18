#!/usr/bin/env sh


if [ -f /auth.txt ]; then
    echo "Mongo authentication is already set up"
else
    echo "Setting up mongo mongo authentication ..."
    # Wait for few seconds until the mongo server is up
    sleep 20
    mongo admin -u "${MONGO_INITDB_ROOT_USERNAME}" -p "${MONGO_INITDB_ROOT_PASSWORD}" --eval "db.createUser({user: 'admin', pwd: '${MONGO_ADMIN_PASS}', roles: [{role: 'userAdminAnyDatabase', db: 'admin'}]});"
    echo "Authentication setup done..."
    # Wait for few seconds until replication takes effect
    # sleep 20
    # echo "Seeding done..."
    touch /auth.txt
fi
