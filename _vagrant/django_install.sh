export DEBIAN_FRONTEND=noninteractive

# Create and activate virtualenv.
cd /home/vagrant
virtualenv -p python3 venv
. venv/bin/activate

# Install requirements and migrate.
cd /home/vagrant/django_mysql_fields
pip3 install -U pip
pip3 install -r requirements.txt
./manage.py migrate
