
echo "***************************************************"
echo " Utilities and system toools"
install_from_base "synaptic" "synaptic"
install_from_base "gdebi" "gdebi"
install_from_ppa "y-ppa-manager" "ppa:webupd8team/y-ppa-manager" "y-ppa-manager"
install_from_ppa "grub-customizer" "ppa:danielrichter2007/grub-customizer" "grub-customizer"
install_from_base "gparted" "gparted"
install_from_base "bleachbit" "bleachbit"
install_from_base "unity-tweak-tool" "unity-tweak-tool"
echo""

echo "***************************************************"
echo " Themes, icons and fonts"
install_from_ppa "plank" "ppa:ricotz/docky" "plank"
install_from_ppa "flatabulous-theme" "ppa:noobslab/themes" "flatabulous-theme"
confirm "arc-theme" && \
	sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/arc-theme.list" && \
	wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key && sudo apt-key add - < Release.key && \
	sudo apt-get update && sudo apt-get install arc-theme
install_from_ppa "arc-icons" "ppa:noobslab/icons" "arc-icons"
install_from_ppa "paper theme" "ppa:snwh/pulp" "gnome-themes-standard paper-gtk-theme paper-icon-theme paper-cursor-theme"
install_from_base "nanum-fonts" "fonts-nanum fonts-nanum-coding"
install_from_base "un-fonts" "fonts-unfonts-core fonts-unfonts-extra"
install_from_base "inconsolata, roboto" "fonts-inconsolata fonts-roboto"
install_from_base "noto-fonts" "fonts-noto"
install_from_base "noto-fonts-cjk" "fonts-noto-cjk"
echo ""

echo "Followings will be installed..."
echo "${ITEM}"
sudo apt-get update
sudo apt-get install ${ITEM}
ITEM=""

echo "***************************************************"
echo " Desktop environments"
install_from_ppa "xfce desktop" "ppa:xubuntu-dev/xfce-4.12" "xfce4 xfce4-goodies"
#install_from_ppa "budgie desktop" "ppa:evolve-os/ppa" "budgie-desktop"
install_from_ppa "cinnamon" "ppa:moorkai/cinnamon" "cinnamon"
echo ""

echo "Followings will be installed..."
echo "${ITEM}"
sudo apt-get update
sudo apt-get install ${ITEM}
ITEM=""

echo "***************************************************"
echo " Applications"
#install_from_ppa "terminix" "ppa:webupd8team/terminix" "terminix"
install_from_ppa "caffeine (prevent screen saver)" "ppa:caffeine-developers/ppa" "caffeine"
install_from_ppa "audacity" "ppa:ubuntuhandbook1/audacity" "audacity"
install_from_ppa "WineHQ" "ppa:wine/wine-builds" "wine-staging"
install_from_ppa "PlayOnLinux" "ppa:noobslab/apps" "playonlinux"
install_from_ppa "atom editor" "ppa:webupd8team/atom" "atom"
install_from_ppa "clementine music player" "ppa:me-davidsansome/clementine" "clementine"
install_from_ppa "sayonara music player" "ppa:lucioc/sayonara" "sayonara"
install_from_ppa "tomahawk music player" "ppa:tomahawk/ppa" "tomahawk"
install_from_ppa "darktable" "ppa:pmjdebruijn/darktable-release" "darktable exiv2"
install_from_ppa "digiKam5" "ppa:philip5/extra" "digikam5"
install_from_ppa "handbrake" "ppa:stebbins/handbrake-releases" "handbrake"
install_from_ppa "LibreOffice (version 5.2)" "ppa:libreoffice/ppa" "libreoffice libreoffice-style-breeze" && sudo apt-get purge libreoffice&
install_from_ppa "Kodi (XBMC)" "ppa:team-xbmc/ppa" "kodi kodi-audioencoder*"
install_from_ppa "mpv" "ppa:mc3man/mpv-tests" "mpv"
install_from_ppa "smplayer" "ppa:rvm/smplayer" "smplayer smtube smplayer-themes smplayer-skins"
install_from_ppa "sunflower file manager" "ppa:atareao/sunflower" "sunflower python-vte"
install_from_ppa "Calibre" "ppa:n-muench/programs-ppa" "calibre"
install_from_ppa "Texlive 2016" "ppa:jonathonf/texlive" "texlive"
install_from_ppa "TexStudio" "ppa:blahota/texstudio" "texstudio"
install_from_ppa "notepadqq" "ppa:notepadqq-team/notepadqq" "notepaddqq"

confirm "codelite (programming IDE)" && \
	sudo apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc && \
	sudo apt-add-repository 'deb https://repos.codelite.org/ubuntu/ trusty universe' && \
	ITEM="${ITEM} codelite wxcrafter"
confirm "VirtualBox" && \
	echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list && \
	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - && \
	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - && \
	ITEM="${ITEM} virtualbox-5.1"
confirm "Mendeley desktop" &&
	wget -O mendeley64.deb http://www.mendeley.com/repositories/ubuntu/stable/amd64/mendeleydesktop-latest && \
	sudo dpkg -i mendeley64.deb && \
	rm mendeley64.deb
confirm "Plex media server" && \
	wget -O plex_media_server.deb https://downloads.plex.tv/plex-media-server/1.3.3.3148-b38628e/plexmediaserver_1.3.3.3148-b38628e_amd64.deb && \
	sudo dpkg -i plex_media_server.deb && \
	sudo apt-get -f install && \
	rm plex_media_server.deb
echo""

echo "***************************************************"
echo " Games"
install_from_ppa "ppsspp" "ppa:ppsspp/stable" "ppsspp"
install_from_ppa "PS2X" "ppa:gregory-hainaut/pcsx2.official.ppa" "pcsx2"
install_from_ppa "dolphin emulator" "ppa:dolphin-emu/ppa" "dolphin-emu"
install_from_base "dosbox" "dosbox"

echo "Followings will be installed..."
echo "${ITEM}"
sudo apt-get update
sudo apt-get install ${ITEM}
ITEM=""
