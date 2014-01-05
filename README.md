awesome (version 3.5)
=========

##Description
This contains two different types of configuration files that I use with awesome: one with a laptop and one with a desktop.

###Laptop
The laptop configuration is pretty minimalistic; essentially only adds the necessities for laptop usage (it assumes  you are using a program like *wicd-client* or *nm-applet* to handle networking and do not need an awesome specific widget. The laptop configuration includes a modified menubar (with shutdown and restart options), an audio widget and a power widget.

###Desktop
The desktop configuration is made with dual monitors in mind. The first monitor contains the following widgets:
+ Audio widget
+ Update widget (Arch)
+ Uptime widget
+ Network widget
+ Memory widget
+ CPU widget

The second monitor contains:
+ Clock
+ Gmail widget (only present with new emails)

##Installation

    cd ~/.config
    git clone https://github.com/brollb/awesome.git
    cd awesome
    ln -s rc.lua.desktop rc.lua

This will set the desktop configuration file as your current configuration. For the laptop configuration, replace *rc.lua.desktop* with *rc.lua.laptop* in the above code.

**Note**: If you are using the desktop version, you will need to set the name of the network interface that you want the network widget to monitor (line 213 or so).
