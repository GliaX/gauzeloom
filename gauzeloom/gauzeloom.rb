#!/usr/bin/ruby1.9.3
require "rubygems"
require "crystalscad"
require "require_all"
include CrystalScad

require_all "lib/**/*.rb"

# To run this project and refresh any changes to the code, run the following command
# in a terminal (make sure you are in the same directory as this file): 
#  observr gauzeloom.observr
#
# This will generate gauzeloom.scad which you can open in OpenSCAD.
# In OpenSCAD make sure that you have the menu item
# Design -> Automatic Reload and Compile 
# activated. 
 

[Side,Comb,GuideComb,SideWall,GauzeloomAssembly].each do |obj| 
	save_all(obj)
end

@@bom.save("bom.txt")

