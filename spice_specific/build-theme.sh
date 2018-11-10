#!/bin/bash
#Description: Build Adapta Theme for Cinnamon Spices
cd ..;
WORKDIR="$PWD";
BUILDDIR="$WORKDIR/spice_builds";
THEMEDIR="$HOME/.themes";
rm -r "$BUILDDIR";
mkdir "$BUILDDIR";
if [ ! -d "$THEMEDIR" ]; then
	mkdir "$THEMEDIR";
fi

./autogen.sh --enable-gtk_legacy --enable-parallel --enable-cinnamon --disable-gnome --disable-openbox --disable-mate --disable-tweetdeck --disable-xfce --disable-flashback;
make;

#Adapta
mkdir "$BUILDDIR/Adapta";
mkdir "$BUILDDIR/Adapta/gtk-2.0";
mkdir "$BUILDDIR/Adapta/gtk-3.0";
mkdir "$BUILDDIR/Adapta/gtk-3.22";
rsync -a -u  "$WORKDIR/shell/cinnamon"/ "$BUILDDIR/Adapta/cinnamon";
ln -sr "$BUILDDIR/Adapta/cinnamon/assets/thumbnail.png" "$BUILDDIR/Adapta/cinnamon/thumbnail.png"
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk3"/ "$BUILDDIR/Adapta/assets";
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk2"/ "$BUILDDIR/Adapta/gtk-2.0";
cp "$WORKDIR/gtk/gtk-3.18/gtk-contained.css" "$BUILDDIR/Adapta/gtk-3.0/gtk.css";
ln -sr "$BUILDDIR/Adapta/assets" "$BUILDDIR/Adapta/gtk-3.0/assets";
ln -sr "$BUILDDIR/Adapta/assets/thumbnail.png" "$BUILDDIR/Adapta/gtk-3.0/thumbnail.png";
cp "$WORKDIR/gtk/gtk-3.22/gtk-contained.css" "$BUILDDIR/Adapta/gtk-3.22/gtk.css";
ln -sr "$BUILDDIR/Adapta/assets" "$BUILDDIR/Adapta/gtk-3.22/assets";
ln -sr "$BUILDDIR/Adapta/assets/thumbnail.png" "$BUILDDIR/Adapta/gtk-3.22/thumbnail.png";
cp "$WORKDIR/gtk/gtk-2.0/gtkrc" "$BUILDDIR/Adapta/gtk-2.0/gtkrc";
cp "$WORKDIR/gtk/gtk-2.0/colors.rc" "$BUILDDIR/Adapta/gtk-2.0/colors.rc";
cp "$WORKDIR/gtk/gtk-2.0/3rd-party.rc" "$BUILDDIR/Adapta/gtk-2.0/3rd-party.rc";
cp "$WORKDIR/gtk/gtk-2.0/common.rc" "$BUILDDIR/Adapta/gtk-2.0/common.rc";
rsync -a -u "$WORKDIR/wm/metacity-1"/ "$BUILDDIR/Adapta/metacity-1";
cp "$WORKDIR/spice_specific/info.json" "$BUILDDIR/Adapta/info.json";
cp "$WORKDIR/COPYING" "$BUILDDIR/Adapta/COPYING";
cp "$WORKDIR/LICENSE_CC_BY_SA4" "$BUILDDIR/Adapta/LICENSE_CC_BY_SA4";
cp "$WORKDIR/spice_specific/README.md" "$BUILDDIR/Adapta/README.md";
cp "$WORKDIR/spice_specific/firefox_fix.sh" "$BUILDDIR/Adapta/firefox_fix.sh";
cp "$WORKDIR/gtk/index.theme" "$BUILDDIR/Adapta/index.theme";
cd "$BUILDDIR/Adapta";
sed -i "s|#THEMENAME|Adapta|g" info.json;
sed -i "s|#THEMENAME|Adapta|g" README.md;
sed -i "s|#DESCRIPTION|A light theme based on Material Design Guidelines|g" info.json;
sed -i "s|#DESCRIPTION|A light theme based on Material Design Guidelines|g" README.md;
rsync -a -u "$BUILDDIR/Adapta"/ "$THEMEDIR/Adapta";

#Adapta-Nokto
mkdir "$BUILDDIR/Adapta-Nokto";
mkdir "$BUILDDIR/Adapta-Nokto/gtk-2.0";
mkdir "$BUILDDIR/Adapta-Nokto/gtk-3.0";
mkdir "$BUILDDIR/Adapta-Nokto/gtk-3.22";
rsync -a -u  "$WORKDIR/shell/cinnamon-nokto"/ "$BUILDDIR/Adapta-Nokto/cinnamon";
ln -sr "$BUILDDIR/Adapta-Nokto/cinnamon/assets/thumbnail.png" "$BUILDDIR/Adapta-Nokto/cinnamon/thumbnail.png"
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk3"/ "$BUILDDIR/Adapta-Nokto/assets";
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk2"/ "$BUILDDIR/Adapta-Nokto/gtk-2.0";
cp "$WORKDIR/gtk/gtk-3.18/gtk-contained-dark.css" "$BUILDDIR/Adapta-Nokto/gtk-3.0/gtk.css";
ln -sr "$BUILDDIR/Adapta-Nokto/assets" "$BUILDDIR/Adapta-Nokto/gtk-3.0/assets";
ln -sr "$BUILDDIR/Adapta-Nokto/assets/thumbnail-dark.png" "$BUILDDIR/Adapta-Nokto/gtk-3.0/thumbnail.png";
cp "$WORKDIR/gtk/gtk-3.22/gtk-contained-dark.css" "$BUILDDIR/Adapta-Nokto/gtk-3.22/gtk.css";
ln -sr "$BUILDDIR/Adapta-Nokto/assets" "$BUILDDIR/Adapta-Nokto/gtk-3.22/assets";
ln -sr "$BUILDDIR/Adapta-Nokto/assets/thumbnail-dark.png" "$BUILDDIR/Adapta-Nokto/gtk-3.22/thumbnail.png";
cp "$WORKDIR/gtk/gtk-2.0/gtkrc-dark" "$BUILDDIR/Adapta-Nokto/gtk-2.0/gtkrc";
cp "$WORKDIR/gtk/gtk-2.0/colors-dark.rc" "$BUILDDIR/Adapta-Nokto/gtk-2.0/colors-dark.rc";
cp "$WORKDIR/gtk/gtk-2.0/3rd-party-dark.rc" "$BUILDDIR/Adapta-Nokto/gtk-2.0/3rd-party-dark.rc";
cp "$WORKDIR/gtk/gtk-2.0/common-dark.rc" "$BUILDDIR/Adapta-Nokto/gtk-2.0/common-dark.rc";
rsync -a -u "$WORKDIR/wm/metacity-1"/ "$BUILDDIR/Adapta-Nokto/metacity-1";
cp "$WORKDIR/spice_specific/info.json" "$BUILDDIR/Adapta-Nokto/info.json";
cp "$WORKDIR/COPYING" "$BUILDDIR/Adapta-Nokto/COPYING";
cp "$WORKDIR/LICENSE_CC_BY_SA4" "$BUILDDIR/Adapta-Nokto/LICENSE_CC_BY_SA4";
cp "$WORKDIR/spice_specific/README.md" "$BUILDDIR/Adapta-Nokto/README.md";
cp "$WORKDIR/spice_specific/firefox_fix.sh" "$BUILDDIR/Adapta-Nokto/firefox_fix.sh";
cp "$WORKDIR/gtk/index.theme-nokto" "$BUILDDIR/Adapta-Nokto/index.theme";
cd "$BUILDDIR/Adapta-Nokto";
sed -i "s|#THEMENAME|Adapta-Nokto|g" info.json;
sed -i "s|#THEMENAME|Adapta-Nokto|g" README.md;
sed -i "s|#DESCRIPTION|A dark theme based on Material Design Guidelines|g" info.json;
sed -i "s|#DESCRIPTION|A dark theme based on Material Design Guidelines|g" README.md;
rsync -a -u "$BUILDDIR/Adapta-Nokto"/ "$THEMEDIR/Adapta-Nokto";

#Adapta-Eta
mkdir "$BUILDDIR/Adapta-Eta";
mkdir "$BUILDDIR/Adapta-Eta/gtk-2.0";
mkdir "$BUILDDIR/Adapta-Eta/gtk-3.0";
mkdir "$BUILDDIR/Adapta-Eta/gtk-3.22";
rsync -a -u  "$WORKDIR/shell/cinnamon"/ "$BUILDDIR/Adapta-Eta/cinnamon";
ln -sr "$BUILDDIR/Adapta-Eta/cinnamon/assets/thumbnail.png" "$BUILDDIR/Adapta-Eta/cinnamon/thumbnail.png"
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk3"/ "$BUILDDIR/Adapta-Eta/assets";
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk2"/ "$BUILDDIR/Adapta-Eta/gtk-2.0";
cp "$WORKDIR/gtk/gtk-3.18/gtk-contained.css" "$BUILDDIR/Adapta-Eta/gtk-3.0/gtk.css";
ln -sr "$BUILDDIR/Adapta-Eta/assets" "$BUILDDIR/Adapta-Eta/gtk-3.0/assets";
ln -sr "$BUILDDIR/Adapta-Eta/assets/thumbnail.png" "$BUILDDIR/Adapta-Eta/gtk-3.0/thumbnail.png";
cp "$WORKDIR/gtk/gtk-3.22-eta/gtk-contained.css" "$BUILDDIR/Adapta-Eta/gtk-3.22/gtk.css";
ln -sr "$BUILDDIR/Adapta-Eta/assets" "$BUILDDIR/Adapta-Eta/gtk-3.22/assets";
ln -sr "$BUILDDIR/Adapta-Eta/assets/thumbnail.png" "$BUILDDIR/Adapta-Eta/gtk-3.22/thumbnail.png";
cp "$WORKDIR/gtk/gtk-2.0/gtkrc-eta" "$BUILDDIR/Adapta-Eta/gtk-2.0/gtkrc";
cp "$WORKDIR/gtk/gtk-2.0/colors.rc" "$BUILDDIR/Adapta-Eta/gtk-2.0/colors.rc";
cp "$WORKDIR/gtk/gtk-2.0/3rd-party-eta.rc" "$BUILDDIR/Adapta-Eta/gtk-2.0/3rd-party-eta.rc";
cp "$WORKDIR/gtk/gtk-2.0/common-eta.rc" "$BUILDDIR/Adapta-Eta/gtk-2.0/common-eta.rc";
rsync -a -u "$WORKDIR/wm/metacity-1"/ "$BUILDDIR/Adapta-Eta/metacity-1";
cp "$WORKDIR/spice_specific/info.json" "$BUILDDIR/Adapta-Eta/info.json";
cp "$WORKDIR/COPYING" "$BUILDDIR/Adapta-Eta/COPYING";
cp "$WORKDIR/LICENSE_CC_BY_SA4" "$BUILDDIR/Adapta-Eta/LICENSE_CC_BY_SA4";
cp "$WORKDIR/spice_specific/README.md" "$BUILDDIR/Adapta-Eta/README.md";
cp "$WORKDIR/spice_specific/firefox_fix.sh" "$BUILDDIR/Adapta-Eta/firefox_fix.sh";
cp "$WORKDIR/gtk/index.theme-eta" "$BUILDDIR/Adapta-Eta/index.theme";
cd "$BUILDDIR/Adapta-Eta";
sed -i "s|#THEMENAME|Adapta-Eta|g" info.json;
sed -i "s|#THEMENAME|Adapta-Eta|g" README.md;
sed -i "s|#DESCRIPTION|A compact light theme based on Material Design Guidelines|g" info.json;
sed -i "s|#DESCRIPTION|A compact light theme based on Material Design Guidelines|g" README.md;
rsync -a -u "$BUILDDIR/Adapta-Eta"/ "$THEMEDIR/Adapta-Eta";

#Adapta-Nokto-Eta
mkdir "$BUILDDIR/Adapta-Nokto-Eta";
mkdir "$BUILDDIR/Adapta-Nokto-Eta/gtk-2.0";
mkdir "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.0";
mkdir "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.22";
rsync -a -u  "$WORKDIR/shell/cinnamon-nokto"/ "$BUILDDIR/Adapta-Nokto-Eta/cinnamon";
ln -sr "$BUILDDIR/Adapta-Nokto-Eta/cinnamon/assets/thumbnail.png" "$BUILDDIR/Adapta-Nokto-Eta/cinnamon/thumbnail.png"
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk3"/ "$BUILDDIR/Adapta-Nokto-Eta/assets";
rsync -a -u "$WORKDIR/gtk/asset/assets-gtk2"/ "$BUILDDIR/Adapta-Nokto-Eta/gtk-2.0";
cp "$WORKDIR/gtk/gtk-3.18/gtk-contained-dark.css" "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.0/gtk.css";
ln -sr "$BUILDDIR/Adapta-Nokto-Eta/assets" "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.0/assets";
ln -sr "$BUILDDIR/Adapta-Nokto-Eta/assets/thumbnail-dark.png" "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.0/thumbnail.png";
cp "$WORKDIR/gtk/gtk-3.22-eta/gtk-contained-dark.css" "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.22/gtk.css";
ln -sr "$BUILDDIR/Adapta-Nokto-Eta/assets" "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.22/assets";
ln -sr "$BUILDDIR/Adapta-Nokto-Eta/assets/thumbnail-dark.png" "$BUILDDIR/Adapta-Nokto-Eta/gtk-3.22/thumbnail.png";
cp "$WORKDIR/gtk/gtk-2.0/gtkrc-dark-eta" "$BUILDDIR/Adapta-Nokto-Eta/gtk-2.0/gtkrc";
cp "$WORKDIR/gtk/gtk-2.0/colors-dark.rc" "$BUILDDIR/Adapta-Nokto-Eta/gtk-2.0/colors-dark.rc";
cp "$WORKDIR/gtk/gtk-2.0/3rd-party-dark-eta.rc" "$BUILDDIR/Adapta-Nokto-Eta/gtk-2.0/3rd-party-dark-eta.rc";
cp "$WORKDIR/gtk/gtk-2.0/common-dark-eta.rc" "$BUILDDIR/Adapta-Nokto-Eta/gtk-2.0/common-dark-eta.rc";
rsync -a -u "$WORKDIR/wm/metacity-1"/ "$BUILDDIR/Adapta-Nokto-Eta/metacity-1";
cp "$WORKDIR/spice_specific/info.json" "$BUILDDIR/Adapta-Nokto-Eta/info.json";
cp "$WORKDIR/COPYING" "$BUILDDIR/Adapta-Nokto-Eta/COPYING";
cp "$WORKDIR/LICENSE_CC_BY_SA4" "$BUILDDIR/Adapta-Nokto-Eta/LICENSE_CC_BY_SA4";
cp "$WORKDIR/spice_specific/README.md" "$BUILDDIR/Adapta-Nokto-Eta/README.md";
cp "$WORKDIR/spice_specific/firefox_fix.sh" "$BUILDDIR/Adapta-Nokto-Eta/firefox_fix.sh";
cp "$WORKDIR/gtk/index.theme-nokto-eta" "$BUILDDIR/Adapta-Nokto-Eta/index.theme";
cd "$BUILDDIR/Adapta-Nokto-Eta";
sed -i "s|#THEMENAME|Adapta-Nokto-Eta|g" info.json;
sed -i "s|#THEMENAME|Adapta-Nokto-Eta|g" README.md;
sed -i "s|#DESCRIPTION|A compact dark theme based on Material Design Guidelines|g" info.json;
sed -i "s|#DESCRIPTION|A compact dark theme based on Material Design Guidelines|g" README.md;
rsync -a -u "$BUILDDIR/Adapta-Nokto-Eta"/ "$THEMEDIR/Adapta-Nokto-Eta";

#cleanup
cd "$WORKDIR";
make clean;
