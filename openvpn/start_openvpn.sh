# Start VPN in terminal as root (debugging purpose)
echo "==============================================================================="
echo "   VPN WILL ONLY WORK IF YOU HAVE PREVIOUSLY AUTHENTICATED IN A HL WEB APP    "
echo "==============================================================================="
mydir=`pwd`
/usr/sbin/openvpn --cd $mydir --script-security 2 --config $mydir/Hacking-Lab-2.0.ovpn

