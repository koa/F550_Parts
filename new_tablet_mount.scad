
use <../parts/bolt.scad>;



module sender(){
	translate([-200,-100,0])
		cube([200,200,50]);
	translate([0,0,-27.5])
		rotate([90,0,0])
			translate([0,0,-40])
				cylinder(h=80, d=5);
}
module tablet(){
	translate([0,-100,0]){
		translate([114/2-5,-10,0])
			cube([10,20,7]);
		translate([114,130,0])
			cube([10,50,10]);
		cube([114,200,9]);
	}
}

module tablet_and_transmitter(){
	color("lightblue"){
		translate([20,0,80])
		rotate([0,-45,0])
			tablet();
		sender();
	}
}

module bolt_hole_extended(l){
	bolt_hole(l);
	translate([0,0,l-1])
		cylinder(d=9,h=70);
	translate([0,0,-70+1])
		cylinder(d=9,h=70);
}
module 3drradio(){ 
        translate([26.7/-2,0,0])
                cube([26.7,51,12.5]);
        translate([26.7/-2,15,0])
                cube([26.7,35,14]);
	translate([-6,-40,4])
		cube([12,40,7]);
	translate([7-26.7/2,50-1,5+2])
		rotate([-90,0,0])
			cylinder(d=12,h=70);
}


module main_holder(){
	difference(){
		translate([0,0,-25])
			linear_extrude(height=50)
				import("new_tablet_mount.dxf");
		translate([-10.5,-31,-12])
			rotate([0,90,-30])
				bolt_hole(15.5);
		translate([-10.5,-31,12])
			rotate([0,90,-30])
				bolt_hole(15.5);
		translate([7,86,12])
			rotate([0,90,-45])
				bolt_hole_extended(25);			
		translate([7,86,-12])
			rotate([0,90,-45])
				bolt_hole_extended(25);
		translate([94,174,-12])
			rotate([0,90,-45])
				bolt_hole_extended(20);
		translate([94,174,12])
			rotate([0,90,-45])
				bolt_hole_extended(20);
		translate([25,65,-1])
			rotate([0,90,-45])
				3drradio();
		hull(){
			translate([0,74-42.5,0]){
				rotate([0,90,20])
					cylinder(d=30,h=100);
				rotate([0,90,-20])
					cylinder(d=30,h=70);
			}
		}
		translate([15,-0,-25/2])
			bolt_hole_extended(25);
		translate([15,60,-25/2])
			bolt_hole_extended(25);
		translate([85,130,-25/2])
			bolt_hole_extended(25);
		translate([0,0,0])
			linear_extrude(height=0.1)
				polygon([[0,70],[200,270],[-30,-100]]);
	}	
}
		
/*			translate([25,65,0])
				rotate([0,90,-45])
					3drradio();*/

/*projection(cut=true)
	rotate([-90,0,0])
		tablet_and_transmitter();
*/

//rotate([-90,0,0])
//	tablet_and_transmitter();


main_holder();

//3drradio();




/*translate([0,0,-27.5])
	rotate([0,-60,0])
		translate([-10,0,-5])
			cube([230,10,10]);*/