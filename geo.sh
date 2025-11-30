geoip_old_ver=1
geoip_new_ver=$(wget --no-check-certificate -qO- -t2 -T3 https://api.github.com/repos/Loyalsoldier/geoip/releases/latest | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g;s/v//g')
geosite_old_ver=1
geosite_new_ver=$(wget --no-check-certificate -qO- -t2 -T3 https://api.github.com/repos/Loyalsoldier/domain-list-custom/releases/latest | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g;s/v//g')

geo_directories= //EXP. geo_directories=/root

echo GeoIp Current Version Is $geoip_old_ver

if
  [ "$geoip_new_ver" -gt "$geoip_old_ver" ] ; then
  echo "Got Update! Downloading..."
  wget -qO $geo_directories/geoip.dat https://github.com/Loyalsoldier/geoip/releases/download/$geoip_new_ver/geoip.dat
  echo "Geo Ip Update To $geoip_new_ver"
  sed -i "1 s/$geoip_old_ver/$geoip_new_ver/" geo.sh
else
  echo "No Update Yet"
fi

echo GeoSite Current Version Is $geosite_old_ver

if
  [ "$geosite_new_ver" -gt "$geosite_old_ver" ] ; then
  echo "Got Update! Downloading..."
  wget -qO $geo_directories/geosite.dat https://github.com/Loyalsoldier/domain-list-custom/releases/download/$geosite_new_ver/geosite.dat
  echo "Geo Site Update To $geosie_new_ver"
  sed -i "3 s/$geosite_old_ver/$geosite_new_ver/" geo.sh
else
  echo "No Update Yet"
fi
