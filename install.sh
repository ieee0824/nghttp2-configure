sudo apt-get install -y git
sudo apt-get install -y \
	autoconf              \
	automake              \
	autotools-dev         \
	libtool               \
	pkg-config            \
	zlib1g-dev            \
	libcunit1-dev         \
	libssl-dev            \
	libxml2-dev           \
	libevent-dev
sudo apt-get install -y make
sudo apt-get install -y g++
sudo apt-get install -y python-dev

git clone https://github.com/tatsuhiro-t/spdylay.git
cd spdylay
sudo apt-get install autoconf automake autotools-dev libtool pkg-config zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libevent-dev
autoreconf -i
automake
autoconf
./configure
make
sudo make install

git clone https://github.com/tatsuhiro-t/nghttp2.git
autoreconf -i
automake
autoconf
./configure
make
sudo make install

ldconfig

sudo nghttpx -s -f'*,443' -b127.0.0.1,80 server.key server.crt
