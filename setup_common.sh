# ******************************************************
#	Scripts for setup linux OS
#	 by Gunjae Koo (gunjae.koo@gmail.com)
# ******************************************************

# global variables
ITEM=""

# functions
function confirm() {
	# call with a prompt string or use a default
	read -r -p "Will you install $1? [y/N] " response
	case $response in
		[yY][eE][sS]|[yY])
			true
			;;
		*)
			false
			;;
	esac
}

function install_from_ppa() {
	local _NAME=$1
	local _PPA=$2
	local _ITEM=$3
	confirm ${_NAME} && sudo add-apt-repository ${_PPA} && ITEM="${ITEM} ${_ITEM}"
}

function install_from_base() {
	local _NAME=$1
	local _ITEM=$2
	confirm ${_NAME} && ITEM="${ITEM} ${_ITEM}"
}

# common parts
echo "***************************************************"
echo " Script for setting up ${OS}"
echo "	by Gunjae Koo (gunjae.koo@gmail.com)"
echo "	(NO WARRANTY, EXECUTE AT YOUR OWN RISKS OF COURSE)"
echo "***************************************************"

echo "***************************************************"
echo " Pareparation"
#echo " - setup root password"
#echo " - setup sudoers in /etc/sudoers"
echo ""
#echo " - YOU MUST RUN THIS SCRIPT IN YOUR HOME FOLDER (~)"
sudo apt-get update
sudo apt-get upgrade

echo "***************************************************"
echo " Basic applications"
install_from_base "SSH server" "openssh-server"
install_from_base "g++" "g++ g++-multilib"
install_from_base "linux-firmware" "linux-firmware"
install_from_base "cifs-utils" "cifs-utils"
echo ""

echo "***************************************************"
echo " git and subversion"
sudo apt-get install git git-core subversion
git config --global user.name "${GIT_NAME} ($HOSTNAME)"
git config --global user.email "${GIT_EMAIL}"
git config --global core.editor "vi"
echo "You can find git golbal configuration file ~/.gitconfig"
echo ""

echo "***************************************************"
echo " Dropbox"
confirm "dropbox" && \
	sudo apt-get install python-gtk2 python-gpgme && \
	sudo apt-get install libappindicator3-1 && \
	wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
	sudo dpkg -i dropbox.deb
	rm -f dropbox.deb
echo ""

echo "***************************************************"
echo " End of the common configuration"
echo " Followings will be installed..."
echo "${ITEM}"
sudo apt-get install ${ITEM}
ITEM=""
