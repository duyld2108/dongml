#!/bin/bash
output() {
        printf "\E[0;33;40m"
        echo $1
        printf "\E[0m"
}
output "";
output "Upgrade OS"
sudo apt-get update
output "Upgrade OS - Done!"
output "Install CPUminer"
sudo apt-get install -y build-essential libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev automake git screen
cd /root/
git clone https://github.com/JayDDee/cpuminer-opt cpuminer-opt
cd cpuminer-opt
./build.sh
output "Install CPUminer - Done!"
output "Create bash file"
cd /root/cpuminer-opt
echo "" > autorun.sh
echo "#!/bin/bash" >> autorun.sh
echo "cd /root/cpuminer-opt" >> autorun.sh
echo "./cpuminer -a lyra2z330 -o stratum+tcp://hxx-pool1.chainsilo.com:3032 -u duyld2108.azu -p x" >> autorun.sh
chmod 0777 autorun.sh
output "Create bash file - Done!"
output "Add cronjob"
crontab -l | grep -v '@reboot /root/cpuminer-opt/autorun.sh' | crontab -
crontab -l > mycron
echo "@reboot /root/cpuminer-opt/autorun.sh" >> mycron
crontab mycron
rm mycron
sudo service cron restart
output "Xong roi nhe Dong ml"
