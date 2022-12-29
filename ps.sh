
wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks

WINEPREFIX=/home/tom/apps/Adobe-Photoshop wineboot

rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "10" >> /home/tom/apps/progress.mimifile

WINEPREFIX=/home/tom/apps/Adobe-Photoshop ./winetricks win10

curl -L "https://drive.google.com/uc?export=download&id=1qcmyHzWerZ39OhW0y4VQ-hOy7639bJPO" > allredist.tar.xz
#mkdir allredist

rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "20" >> /home/tom/apps/progress.mimifile

tar -xf allredist.tar.xz
rm -rf allredist.tar.xz

rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "25" >> /home/tom/apps/progress.mimifile

curl -L "https://lulucloud.mywire.org/FileHosting/GithubProjects/AdobePhotoshop2021.tar.xz" > AdobePhotoshop2021.tar.xz

rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "50" >> /home/tom/apps/progress.mimifile

tar -xf AdobePhotoshop2021.tar.xz
rm -rf AdobePhotoshop2021.tar.xz


rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "70" >> /home/tom/apps/progress.mimifile


WINEPREFIX=/home/tom/apps/Adobe-Photoshop ./winetricks fontsmooth=rgb gdiplus msxml3 msxml6 atmlib corefonts dxvk win10

rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "80" >> /home/tom/apps/progress.mimifile


WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2010/vcredist_x64.exe /q /norestart
WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2010/vcredist_x86.exe /q /norestart

WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2012/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2012/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2013/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2013/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2019/VC_redist.x64.exe /install /quiet /norestart
WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine allredist/redist/2019/VC_redist.x86.exe /install /quiet /norestart


rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "90" >> /home/tom/apps/progress.mimifile

chmod +x allredist/setup_vkd3d_proton.sh 
WINEPREFIX=/home/tom/apps/Adobe-Photoshop ./allredist/setup_vkd3d_proton.sh install


mkdir /home/tom/apps/Adobe-Photoshop/drive_c/Program\ Files/Adobe
mv Adobe\ Photoshop\ 2021 /home/tom/apps/Adobe-Photoshop/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021

touch /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo '#!/usr/bin/env bash' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo 'SCR_PATH="pspath"' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo 'CACHE_PATH="pscache"' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo 'RESOURCES_PATH="$SCR_PATH/resources"' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo 'WINE_PREFIX="$SCR_PATH/prefix"' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo 'FILE_PATH=$(winepath -w "/home/tom/apps")' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo 'export WINEPREFIX="'/home/tom/apps'/Adobe-Photoshop"' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
#echo 'WINEPREFIX='/home/tom/apps'/Adobe-Photoshop DXVK_LOG_PATH='/home/tom/apps'/Adobe-Photoshop DXVK_STATE_CACHE_PATH='/home/tom/apps'/Adobe-Photoshop wine64 ' /home/tom/apps'/Adobe-Photoshop/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021/photoshop.exe $FILE_PATH' >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
echo 'WINEPREFIX='/home/tom/apps'/Adobe-Photoshop DXVK_LOG_PATH='/home/tom/apps'/Adobe-Photoshop DXVK_STATE_CACHE_PATH='/home/tom/apps'/Adobe-Photoshop wine64 ' /home/tom/apps'/Adobe-Photoshop/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021/photoshop.exe >> /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh
chmod +x /home/tom/apps/Adobe-Photoshop/drive_c/launcher.sh

WINEPREFIX=/home/tom/apps/Adobe-Photoshop winecfg -v win10


mv allredist/photoshop.png ~/.local/share/icons/photoshop.png


touch ~/.local/share/applications/photoshop.desktop
echo '[Desktop Entry]' >> ~/.local/share/applications/photoshop.desktop
echo 'Name=Photoshop CC 2021' >> ~/.local/share/applications/photoshop.desktop
echo 'Exec=bash -c "'/home/tom/apps'/Adobe-Photoshop/drive_c/launcher.sh %F"' >> ~/.local/share/applications/photoshop.desktop
echo 'Type=Application' >> ~/.local/share/applications/photoshop.desktop
echo 'Comment=Photoshop CC 2021 (Wine)' >> ~/.local/share/applications/photoshop.desktop
echo 'Categories=Graphics;' >> ~/.local/share/applications/photoshop.desktop
echo 'Icon=photoshop' >> ~/.local/share/applications/photoshop.desktop
echo 'StartupWMClass=photoshop.exe' >> ~/.local/share/applications/photoshop.desktop

rm -rf allredist
rm -rf winetricks


rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "95" >> /home/tom/apps/progress.mimifile

curl -L "https://download.adobe.com/pub/adobe/photoshop/cameraraw/win/12.x/CameraRaw_12_2_1.exe" > CameraRaw_12_2_1.exe
WINEPREFIX=/home/tom/apps/Adobe-Photoshop wine CameraRaw_12_2_1.exe
rm -rf CameraRaw_12_2_1.exe

rm -rf /home/tom/apps/progress.mimifile
touch /home/tom/apps/progress.mimifile
echo "100" >> /home/tom/apps/progress.mimifile
