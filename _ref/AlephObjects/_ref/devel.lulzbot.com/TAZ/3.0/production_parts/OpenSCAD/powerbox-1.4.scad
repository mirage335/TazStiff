module psu(){
union(){
	difference(){
		translate([-114/2,0,-8])cube([114,200,50]);
		translate([-55,-0.01,2.01])cube([110,18,40]);
	}
	translate([-38,-0.01,2.01])cube([90,18,9]);
	translate([-37.5,2,2.01])
		for( i=[0:8]) translate([i*10,0,0])
		cube([9,10,10]);
}
translate([-65,32,5])rotate([0,90,0])cylinder(r=2,$fn=15,h=130);
translate([-35,32,30])rotate([0,90,0])cylinder(r=2,$fn=15,h=100);
translate([-114/2+32,32,-16])rotate([0,0,0])cylinder(r=2,$fn=15,h=15);
translate(){
translate([-57,1.5+6,30-12])rotate([0,90,0])oval();
translate([-57,1.5+6+7,30-12])rotate([0,90,0])oval();
translate([-57,1.5+6+14,30-12])rotate([0,90,0])oval();
translate([55,1.5+6,30-12])rotate([0,90,0])oval();
translate([55,1.5+6+7,30-12])rotate([0,90,0])oval();
translate([55,1.5+6+14,30-12])rotate([0,90,0])oval();
}
}

*%psu();
*enclosure();
module plug(){
cube([28,41,32],center=true);
for(i=[-1,1])translate([-18*i,-11,0])rotate([90,0,0])cylinder(r=5.3/2,h=10,$fn=25);
}
module switch(){
cylinder(r=20.5/2,h=39);
translate([0,-2.4/2,0])cube([11.5,2.4,39]);
}
module rswitch(){
translate([0,0,39/2])cube([28,14,39],true);
}

module clover(d=2,x=1.2){
for(i=[-1,1])
	for(j=[-1,1])
		translate([i*x,j*x])
			cylinder(r=d,h=30);

}

module ring(d=10,h=4,o=1.5){
difference(){
cylinder(r=d,h=h,center=true,$fn=30);
cylinder(r=d-o,h=h+1,center=true,$fn=30);


}
}
module oval(rad=3,len=21,w=2,fn=20){
translate([len/2,0,0])cylinder(r=rad/2,h=w,$fn=fn);
translate([-len/2,0,0])cylinder(r=rad/2,h=w,$fn=fn);
translate([0,0,w/2])cube([len,rad,w],center=true);
}
module enclosure(){
difference(){
union(){
translate([-109/2,-46,0])cube([109,64,40]);
translate([-115.5/2,-46,0])cube([115.5,45,40]);
translate([-109/2-7,-46,0])cube([4,85,40]); // extented Y by 1
difference(){
	translate([-109/2-7,19,-2.5])cube([4,20,20]);
	translate([-109/2-7.25,17,-3]) rotate([-25,0,0]) cube([4.5,10,5]);
}
translate([109/2+3,-46,0])cube([4,85,40]); // extended Y by 1
difference(){	
	translate([109/2+3,19,-2.5])cube([4,20,20]);
	translate([109/2+2.75,17,-3]) rotate([-25,0,0]) cube([4.5,10,5]);
}
translate([34.5+7,-46,-7.999])cube([20,20,8]);
translate([-61.5,-46,-7.999])cube([20,20,8]);
}
translate([-101/2,-42,3])cube([101,60.1,34]);
translate([-110/2,0,-5])cube([110,30,34]);
translate([-115/2,-42,3])cube([115,31.1,34]);
translate([-115/2,-43,3])cube([61,31.1,34]);
translate([-22.8,-32,3])rotate([0,0,60])cube([40,40,34]);
translate([22.8,-32,3])rotate([0,0,30])cube([40,40,34]);

translate([-101/2,0.01,-0.01])cube([103,18,16]);
translate([-43,10,20])cylinder(r=5,h=30,$fn=50);

translate([27,-26,20])plug();
translate([-15,-8,20])rotate([90,-90,0])rswitch();

//Side mounting holes
//Moved all holes 1.8 in Y and 2.5 in Z. Enlarged the holes by 1
translate([-65,33.8,2.5])rotate([0,90,0])cylinder(r=2.7,$fn=15,h=15); 
translate([56,33.8,2.5])rotate([0,90,0])cylinder(r=2.7,$fn=15,h=15);
translate([56,33.8,27.5])rotate([0,90,0])cylinder(r=2.7,$fn=15,h=15);

translate([-52.5,-20,22])rotate([90,-90,0])cylinder(r=9.8/2,h=30);
translate([-66,42,15])rotate([45,0,0])cube([10,20,40]);
translate([56,42,28])rotate([45,0,0])cube([10,20,40]);
translate([-103,0,0])rotate([0,0,90]){
translate([-38,-43,22])rotate([0,90,0])ring(5.5,5,2);
translate([-30,-43,22])rotate([0,90,0])ring(5.5,5,2);
}
}
}

rotate([90,0,0])enclosure();