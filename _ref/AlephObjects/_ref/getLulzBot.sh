#!/bin/bash

#See devel.lulzbot.com/TAZ/README.html .

#HTTP download from LulzBot website.
wget -N -r --no-parent --reject "index.html*" --reject "*.gcode" --reject "*.stl" http://devel.lulzbot.com/TAZ/Kauri/

wget -N -r --no-parent --reject "index.html*" --reject "*.gcode" --reject "*.stl" http://devel.lulzbot.com/TAZ/Lancewood/

wget -N -r --no-parent --reject "index.html*" --reject "*.gcode" --reject "*.stl" http://devel.lulzbot.com/TAZ/nutmeg/production_parts/

wget -N -r --no-parent --reject "index.html*" --reject "*.gcode" --reject "*.stl" http://devel.lulzbot.com/TAZ/3.0/production_parts/
