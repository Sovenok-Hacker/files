#!/data/data/com.termux/files/usr/bin/bash
echo "MsfInstaller by Sovenok-Hacker"
echo "Потребуется около 1GB памяти и интернета!!! Вы уверены что хотите продолжить?!"
echo       
             
            /\
            \/
echo "Установка компонентов..." 

echo "####################################"
pkg install ruby
pkg install gem
gem install bundle
apt install autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config postgresql-contrib wget make ruby-dev libgrpc-dev ncurses-utils termux-tools -y
echo "####################################"
echo "Скачивание и Распаквка..."

curl -L https://github.com/rapid7/metasploit-framework/archive/4.14.28.tar.gz | tar xz

cd metasploit-framework-4.14.28

sed 's|git ls-files|find -type f|' -i metasploit-framework.gemspec

echo "Установка bundler..."
gem install bundler

echo "Установка nokogiri..."
gem install nokogiri -- --use-system-libraries


gem unpack network_interface -v 0.0.1
cd network_interface-0.0.1
sed 's|git ls-files|find -type f|' -i network_interface.gemspec
curl -L https://wiki.termux.com/images/6/6b/Netifaces.patch -o netifaces.patch
patch -p1 < netifaces.patch
gem build network_interface.gemspec
echo "Установка network_interface"
gem install network_interface-0.0.1.gem
cd ..
rm -r network_interface-0.0.1

gem unpack grpc -v 1.4.1
cd grpc-1.4.1
curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
curl -L https://wiki.termux.com/images/b/bf/Grpc_extconf.patch -o extconf.patch
patch -p1 < extconf.patch
gem build grpc.gemspec
echo "grpc is installing"
gem install grpc-1.4.1.gem
cd ..
rm -r grpc-1.4.1

echo "Установка необходимых компонентов..."
bundle install -j5

$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
cd $HOME
echo cd metasploit-framework-4.14.28 > console.sh
echo ./msfconsole > console.sh
echo cd $HOME > console.sh
cd $HOME
echo "Metasploit установлен, для запуска введите команды: cd cd metasploit-framework-4.14.28, ./msfconsole ИЛИ командой: bash console.sh"
exec bash