export DEBIAN_FRONTEND=noninteractive

# Setting Debian to use a mirror prevents hangs from redirector.
sed -i 's/httpredir.debian.org/mirror.vorboss.net/g' /etc/apt/sources.list

# Add MySQL apt-get repositories.
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys A4A9406876FCBD3C456770C88C718D3B5072E1F5
export MYSQL_MAJOR=5.6
echo "deb http://repo.mysql.com/apt/debian/ jessie mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list

apt-get update -y && apt-get upgrade -y

apt-get install -y build-essential python3 python3-dev
apt-get install -y python3-pip python-virtualenv
apt-get install -y git
apt-get install -y libreadline-dev libncurses-dev
apt-get install -y mysql-community-server libmysqlclient-dev

# Rewrite MySQL configured internal ip address.
sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf

# Create database to be used by Django.
echo "CREATE DATABASE django;" | mysql -uroot
echo "FLUSH PRIVILEGES;" | mysql -uroot
