module cut_case(){
	projection(cut=true)
		rotate([0,90,0])
			translate([-100,0,0])
				import("Nexus7CaseV2.STL");
}

module 3drradio(){ 
        translate([26.7/-2,0,0])
                cube([26.7,50,12.0]);
        translate([26.7/-2,15,0])
                cube([26.7,35,13.2]);
}

module clip_profile(){
	linear_extrude(height=40)
		polygon([[0.1,0],[-0.7,-2],[0.1,-3]]);
}

module clip_side(){
		translate([5,-10,-2.5])
			rotate([90,0,0])
				clip_profile();
}

module clip(){
//	clip_side();
	translate([5,0,0])
	mirror([1,0,0])
			clip_side();
}
module clip_3dr(){
	translate([0,33.83+5,76.31+5])
		rotate([-45,180,0]){
			translate([0,50,5])
				rotate([90,0,0])
					clip_profile();
		}
}

module side(){
	difference(){
		rotate([90,0,90])
			linear_extrude(height=5) 
				import("tablet_mount.dxf", $fn=20);
		clip();
		clip_3dr();
	}
	
}

module side_small(){
	difference(){
		rotate([90,0,90])
			linear_extrude(height=5) 
				import("tablet_mount_small.dxf", $fn=100);
		clip();
		clip_3dr();
	}
	
}

module both_sides(){
	translate([62/2,0,0])
		side();
	mirror([1,0,0])
		translate([62/2,0,0])
			side();
}
module base_stabilizer(){
	difference(){
		union(){
			translate([75/-2,-80,-1.5-5])
				cube([75,40,5]);
			translate([70/-2,-40,-1.5-5])
				cube([70,40,5]);
		}
		minkowski(){
			both_sides();
			sphere(r=0.5);
		}
	}
}

module back_stablilizer(){
	difference(){
		translate([0,33.83+5,76.31+5])
			rotate([-45,180,0]){
				translate([0,0,5]){
					difference(){
						union(){
							translate([90/-2,-15,-5])
								cube([90,80,5]);
							translate([25/2-3,25,0])
								cube([10,10,15]);
							mirror([1,0,0])
								translate([25/2-3,25,0])
									cube([10,10,15]);
						}
						translate([0,0,-2])
							3drradio();
					}
//				translate([0,0,-2])
//					3drradio();
				}
		}
		minkowski(){
			both_sides();
			sphere(r=0.5);
		}
		
	}
}
back_stablilizer();
//clip_3dr();
both_sides();
base_stabilizer();
//side();
//side_small();
//cut_case();