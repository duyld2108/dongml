#!/bin/bash
output() {
        printf "\E[0;33;40m"
        echo $1
        printf "\E[0m"
}
output "";
output "Create bash file"
cd /root/cpuminer-opt
echo "" > autorun.sh
echo "#!/bin/bash" >> autorun.sh
echo "cd /root/cpuminer-opt" >> autorun.sh
echo "./cpuminer -a lyra2z330 -o stratum+tcp://xpool.cf:4555 -u HV67gWNk7siaZXwQw58fYJghMbEmA3dRWb -p c=HXX" >> autorun.sh
chmod 0777 autorun.sh
ouput "Add cronjob"
crontab -l > mycron
echo "@reboot /root/cpuminer-opt/autorun.sh" >> mycron
crontab mycron
rm mycron
