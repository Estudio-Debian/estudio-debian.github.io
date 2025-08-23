#!/bin/bash
set -e
amd_support() {
	if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
		sudo mkdir -p /etc/apt/keyrings
		wget -q --show-progress -O- https://repo.radeon.com/rocm/rocm.gpg.key | sudo gpg --dearmor --yes -o /etc/apt/keyrings/rocm.gpg
		printf 'deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/6.4.1 noble main' | sudo tee /etc/apt/sources.list.d/rocm.list >/dev/null
		printf 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' | sudo tee /etc/apt/preferences.d/rocm-pin-600 >/dev/null
		sudo apt update 2>/dev/null
		sudo apt install -y --reinstall amd64-microcode plocate rocm
	elif [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
		sudo apt install -y --reinstall amd64-microcode rocminfo
	fi
}

intel_support() {
	printf '#TODO'
}

nvidia_support() {
	printf '#TODO'
}

install_resolve() {
	if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
		wget -q --show-progress https://archive.debian.org/debian/pool/main/libj/libjpeg8/libjpeg8_8b-1_amd64.deb
		sudo apt install -y --reinstall ./libjpeg8_8b-1_amd64.deb
		#ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so.62 /usr/lib/x86_64-linux-gnu/libjpeg.so.8
	fi
	sudo apt install -y --reinstall libapr1 libaprutil1 libasound2t64 libgl1 libglib2.0-0 libglu1-mesa libxcb-composite0 libxcb-cursor0 libxcb-xinerama0 libxcb-xinput0 mesa-opencl-icd ocl-icd-opencl-dev
	sudo usermod -aG render,video "$USER"
	cd /tmp
	unzip -o "$HOME"/Downloads/DaVinci_Resolve_*_Linux.zip
	sudo SKIP_PACKAGE_CHECK=1 "$PWD"/DaVinci_Resolve_*_Linux.run -i -y
}

fix_pango() {
#	if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
#		mkdir -p /tmp/pango
#		rm -f /tmp/pango/*.deb
#		cd /tmp/pango
#		for pkg in libpango-1.0-0 libpangoft2-1.0-0 libpangocairo-1.0-0; do
#			wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/"$(curl -sSL http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/ | grep -oP "${pkg}_[^\"']+?amd64\.deb" | sort -V | tail -n1)"
#		done
#		wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/main/g/gdk-pixbuf/"$(curl -sSL http://archive.ubuntu.com/ubuntu/pool/main/g/gdk-pixbuf/ | grep -oP 'libgdk-pixbuf-2.0-0_[^"]+?amd64\.deb' | sort -V | tail -n1)"
#		find /tmp/pango -type f -name '*.deb' -exec dpkg-deb -x {} /tmp/pango/libs \;
#		sudo cp /tmp/pango/libs/usr/lib/x86_64-linux-gnu/lib* /opt/resolve/libs/
#	elif [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == debian ]; then
#		mkdir -p /tmp/pango
#		rm -f /tmp/pango/*.deb
#		cd /tmp/pango
#		wget -q --show-progress https://snapshot.debian.org/archive/debian/20230724T030435Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_amd64.deb
#		wget -q --show-progress https://snapshot.debian.org/archive/debian/20230724T030435Z/pool/main/p/pango1.0/libpango-1.0-0_1.50.12+ds-1_amd64.deb
#		wget -q --show-progress https://snapshot.debian.org/archive/debian/20230724T030435Z/pool/main/p/pango1.0/libpangocairo-1.0-0_1.50.12+ds-1_amd64.deb
#		wget -q --show-progress https://snapshot.debian.org/archive/debian/20230724T030435Z/pool/main/p/pango1.0/libpangoft2-1.0-0_1.50.12+ds-1_amd64.deb
#		wget -q --show-progress https://snapshot.debian.org/archive/debian/20230723T214924Z/pool/main/g/gdk-pixbuf/libgdk-pixbuf-2.0-0_2.42.10%2Bdfsg-1%2Bb1_amd64.deb
#		find /tmp/pango -type f -name '*.deb' -exec dpkg-deb -x {} /tmp/pango/libs \;
#		sudo cp /tmp/pango/libs/usr/lib/x86_64-linux-gnu/lib* /opt/resolve/libs/
#	fi
	sudo rm /opt/resolve/libs/libgio-2.0.so*
	sudo rm /opt/resolve/libs/libglib-2.0.so*
	sudo rm /opt/resolve/libs/libgmodule-2.0.so*
}

link_ocl_libs() {
	sudo ln -fs "$(locate libamdocl64.so | head -n1)" /opt/resolve/libs/
	sudo ln -fs /usr/lib/x86_64-linux-gnu/libOpenCL.so /opt/resolve/libs/
}

fix_launcher() {
	if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ]; then
		sudo sed -i 's|Icon=applications-system|Icon=gnome-logs|g' /usr/share/applications/com.blackmagicdesign.resolve-CaptureLogs.desktop
		sudo ln -sf /opt/resolve/graphics/DV_Panels.png /usr/share/icons/hicolor/128x128/apps/davinci-panels.png
		sudo sed -i 's|Icon=/opt/resolve/graphics/DV_Panels.png|Icon=davinci-panels|g' /usr/share/applications/com.blackmagicdesign.resolve-Panels.desktop
		sudo ln -sf /opt/resolve/graphics/DV_Resolve.png /usr/share/icons/hicolor/128x128/apps/resolve.png
		sudo sed -i 's|Icon=/opt/resolve/graphics/DV_Resolve.png|Icon=resolve|g' /usr/share/applications/com.blackmagicdesign.resolve.desktop
		sudo ln -sf /opt/resolve/graphics/DV_Uninstall.png /usr/share/icons/hicolor/128x128/apps/DV_Uninstall.png
		sudo sed -i 's|Icon=/opt/resolve/graphics/DV_Uninstall.png|Icon=DV_Uninstall|g' /usr/share/applications/com.blackmagicdesign.resolve-Installer.desktop
		mkdir -p "$HOME"/.icons/Papirus-Dark/128x128/apps
		ln -fs /usr/share/icons/Papirus-Dark/128x128/actions/computerjanitor.svg "$HOME"/.icons/Papirus-Dark/128x128/apps/DV_Uninstall.svg
	fi
	printf '\nStartupWMClass=resolve' | sudo tee -a /usr/share/applications/com.blackmagicdesign.resolve.desktop >/dev/null
}

# shellcheck disable=SC2144
if [ -f "$HOME"/Downloads/DaVinci_Resolve_*_Linux.zip ]; then
	gpu_info="$(lspci | grep -E "VGA|3D")"
	if printf "%s" "$gpu_info" | grep -q NVIDIA >/dev/null; then
		nvidia_support
		install_resolve
		fix_pango
		fix_launcher

	elif printf "%s" "$gpu_info" | grep -q AMD >/dev/null; then
		amd_support
		install_resolve
		if [ "$(grep '^ID=' /etc/os-release | cut -d '=' -f2)" == ubuntu ]; then
			link_ocl_libs
		fi
		fix_pango
		fix_launcher

	elif printf "%s" "$gpu_info" | grep -q Intel >/dev/null; then
#		printf 'Intel'
#		printf 'Sua GPU não é compatível com o DaVinci Resolve'
		intel_support
		install_resolve
		fix_pango
		fix_launcher
	fi
else
	printf 'Você precisa baixar o instalador do Resolve antes de rodar este script\n\n'
	xdg-open https://www.blackmagicdesign.com/products/davinciresolve
fi