// Wade's Extruder Gears using Parametric Involute Bevel and Spur Gears by GregFrost
// by Nicholas C. Lewis (A RepRap Breeding Program)
// addition of double helix gears by Stoffel15 - 2010
// addition of resolution controls by Kyle P. Ronan - 2013

// It is licensed under the Creative Commons - GNU GPL license.
// © 2010 by Nicholas C. Lewis
// http://www.thingiverse.com/thing:4305

// For changing the resolution of the change involute_facets and circle_facets.
//	invoulte_facets controls the number of faces on a gear tooth
// circle_facets is a multiplier that increase the number of faces cylinder used to make the gears
// Values of 5 and 1.2 respecitvely are close the original herringbone_gears.scad file
//	If you are making new gears start with 5 and 1.2 so that rendering times are faster. 
// When involute_facets =12 and circle_facets =7 it can take a few minutes to render. 
// 


use <inc/mendel_misc.inc>
use <inc/parametric_involute_gear_v5.1.scad>

//WadesL();  //this module call will make the large gear
//WadesS();  //this module call will make the small gear
WadeL_double_helix();  //this module call will make the large double helix gear
//WadesS_double_helix(); //this module call will make the small double helix gear

module WadeL_double_helix(){
	//Large WADE's Gear - Double Helix
	//rotate([0,0,-2])translate([0,0,0])color([ 100/255, 255/255, 200/255])import_stl("39t17p.stl");

	circles=5;
	teeth=47;
	pitch=268;
	twist=200;
	height=11;
	pressure_angle=30;
	involute_facets=12;	
	circle_facets=6;

	difference(){
		union(){
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =0,// height/2*0.5,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2*1.5,
			hub_diameter = 25,
			bore_diameter = 8,
			circles=circles,
			twist = twist/teeth,
			involute_facets = involute_facets,
			circle_facets = circle_facets);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2,
			hub_diameter=25,
			bore_diameter=8,
			circles=circles,
			twist=twist/teeth,
			involute_facets = involute_facets,
			circle_facets = circle_facets);
		}
		//translate([0,0,3])rotate([180,0,0])m8_hole_vert_with_hex(100);

		//Instead of making changes to mendel_misc.inc with higher resoultion,
		//the bolt hole is made the old fashion way with higher resoulution below
		union () {
			translate([0,0,10])rotate([180,0,0])cylinder(r=4.1,h=20,$fn=circle_facets*10);
			translate ([0,0,8]) rotate ([0,0,30]) hexagon(height=13.1,depth=10);
		}
		difference() {
			translate([0,0,-height/2]) rotate([0,0,0]) cylinder(h=1.5,r=(36.6),$fn=circle_facets*15);
			translate([0,0,-height/2]) rotate([0,0,0]) cylinder(h=1.5,r2=(36.6),r1=(35),$fn=circle_facets*15);
		}
	}
}
module WadesL(){
	//Large WADE's Gear
	//rotate([0,0,-2])translate([0,0,0])color([ 100/255, 255/255, 200/255])import_stl("39t17p.stl");

	involute_facets=12;	
	circle_facets=7;

	difference(){
		gear (number_of_teeth=39,
			circular_pitch=268,
			gear_thickness = 5,
			rim_thickness = 7,
			rim_width = 3,
			hub_thickness = 13,
			hub_diameter = 25,
			bore_diameter = 8,
			circles=0,
			twist = 0,
			involute_facets = involute_facets,
			circle_facets = circle_facets);
		//translate([0,0,6])rotate([180,0,0])m8_hole_vert_with_hex(100);

		//Instead of making changes to mendel_misc.inc with higher resoultion,
		//the bolt hole is made the old fashion way with higher resoulution below
		union () {
			translate([0,0,10])rotate([180,0,0])cylinder(r=4.9,h=20,$fn=circle_facets*10);
			translate ([0,0,11]) rotate ([0,0,30]) hexagon(height=14,depth=10);
		}
	}
}

module WadesS(){
	//small WADE's Gear
	//rotate([180,0,-23.5])translate([-10,-10,-18])color([ 100/255, 255/255, 200/255])import_stl("wades_gear.stl");

	involute_facets=12;	
	circle_facets=7;

	difference(){
		gear (number_of_teeth=11,
			circular_pitch=268,
			gear_thickness = 9,
			rim_thickness = 9,
			hub_thickness = 18,
			hub_diameter = 20,
			bore_diameter = 5,
			circles=0,
			twist = 0,
			involute_facets = involute_facets,
			circle_facets = circle_facets);
		translate([0,-5,16])cube([5.5,2.3,9],center = true);
		translate([0,0,14])rotate([0,90,-90])cylinder(r=1.7,h=20,$fn=circle_facets*4);
	}
}
module WadesS_double_helix(){
	//small WADE's Gear
	//rotate([180,0,-23.5])translate([-10,-10,-18])color([ 100/255, 255/255, 200/255])import_stl("wades_gear.stl");

	circles=0;
	teeth=9;
	pitch=268;
	twist=200;
	height=25;
	pressure_angle=30;
	involute_facets=12;	
	circle_facets=7;

	rotate([180,0,0]){
	difference(){
		union(){
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =  height/4,
			rim_thickness = height/4,
			rim_width = 5,
			hub_thickness = height/2*1.2,
			hub_diameter = 20,
			bore_diameter = 5,
			circles=circles,
			twist = twist/teeth,
			involute_facets = involute_facets,
			circle_facets = circle_facets);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =  height/4*1.2,
			rim_thickness =  height/4,
			rim_width = 5,
			hub_thickness = height/4,
			hub_diameter=20,
			bore_diameter=5,
			circles=circles,
			twist=twist/teeth,
			involute_facets = involute_facets,
			circle_facets = circle_facets);
		}
		translate([0,-5,12])cube([5.5,2.3,9],center = true);
		translate([0,0,11])rotate([0,90,-90])cylinder(r=1.7,h=20,$fn=circle_facets*4);
	}
	}
}
