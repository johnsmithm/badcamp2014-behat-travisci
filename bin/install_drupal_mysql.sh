#!/bin/bash

#
# Build an instance of Drupal using mysql.
# This assumes that you have a mysql user
# 'root' with no password.  Travis sets
# up one of these for you by default.
#
rm -rf html
#$BASEDIR/vendor/bin/drush help make
$BASEDIR/vendor/bin/drush -v
#$BASEDIR/vendor/bin/drush make -y  drupal.make html
#mkdir html
#$BASEDIR/vendor/bin/drush dl drupal-7.x
composer create-project drupal-composer/drupal-project:7.x-dev html --stability dev --no-interaction
cd html
composer require drupal/devel:~1.0
ls
#drush composer-generate @site
#composer install
#cd web
#drush -y core-quick-drupal
#cd ..
#$BASEDIR/vendor/bin/drush si -y standard --db-url=mysql://root@localhost/drupal --account-name=admin --account-pass=admin

# We might do the same thing with drush quick-drupal
drush -y core-quick-drupal --profile=standard --makefile=drupal.make --db-url=mysql://root@localhost/drupal --core=drupal-7.x behat_demo devel --browser=0 --no-server --root=html --account-name=admin --account-pass=admin
echo "done"
