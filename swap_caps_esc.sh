# Swap caps lock and escape for vim in console
mkdir -p /usr/local/share/kbd/keymaps
file=/usr/local/share/kbd/keymaps/caps_lock_esc_swap.map
echo "keycode 1 = Caps_Lock" > $file
echo "keycode 58 = Escape" >> $file

# Enable the keymap for the current session
echo "Enabling for current session..."
loadkeys /usr/local/share/kbd/keymaps/caps_lock_esc_swap.map

# Save these changes for all sessions
if ! [[ -f /etc/vconsole.conf ]]; then
    localectl set-keymap us
fi

echo "Adding the path to $file to KEYMAP in /etc/vconsole.conf..."
cp /etc/vconsole.conf /etc/vconsole.conf.old
sed -i 's/\(KEYMAP=.*\)/\1:\/usr\/local\/share\/kbd\/keymaps\/caps_lock_esc_swap.map/g' /etc/vconsole.conf
