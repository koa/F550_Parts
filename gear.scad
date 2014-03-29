//include<gimbal-mount.scad>

module holes(){
	linear_extrude(height=2){
		import("bottom-plate.dxf", $fn=50);
	}
}

module base_plate(){
	difference(){
		cylinder(r=80, h=2);
		holes();
	}
}

module gear(file="gear.dxf"){
	difference(){
		translate([0,43,2]){
			rotate([15,0,0]){
				translate([0,-3,0]){
					nose_gear();
					rotate([0,0,180])
						nose_gear();
				}		
				translate([0,0,-88]){
					rotate([90,0,0])
						linear_extrude(height=6){
							import(file, $fn=20);
						}
				}
			}
		}	
		base_plate();
	}
}

module nose_2(l1,l2,h1,h2,t){   
        rotate([90,0,0])
                translate([0,0,t/-2])
                        linear_extrude(height=t)
                                polygon(points=[[0,0],[l1,0],[l1,h1],[l1+l2,h1+l2],[l1+l2-(h2-h1-l2),h2],[0,h2]], paths=[[0,1,2,3,4,5]]);
					

}

module nose_gear(){
	translate([-37,0,0]){
		nose_2(4,0.1,1,4,6);
		rotate([0,-10,0]){
			translate([-1,-3,0])
				cube([4,6,10]);			
			translate([-3,-3,7])
				cube([6,6,3]);
		}
	}
}

module both_gears(){
	gear();
	rotate([0,0,180])
		gear();
}

module schnitt(){
projection()
	rotate([0,90,0]){
		base_plate();
		both_gears();
	}
}



module gear_bottom(){
	difference(){
		translate([0,0,-143+2])
			linear_extrude(height=2){
				import("gear_bottom.dxf", $fn=50);
			}
			//cube([190,140,2]);
		both_gears();
	}
}

module spikel(){
	translate([38,1,1.2])
		rotate([-13.5,0,15])
			rotate([90,-90,0])
				translate([0,-15,30])
					linear_extrude(height=70)
						polygon([[10,0],[0,15],[-10,0]]);
				
}

module gear_stabilizer(){
	difference(){
		translate([57,0,1.5])		
			rotate([90,0,90])
				difference(){
					linear_extrude(height=50){
						//rotate([13.8,0,0])
						import("gear_stabilizer.dxf");
					}
					rotate([-11.8,0,0])
						translate([-100,-100,11])
							cube([200,80,70]);
					rotate([-14.8,0,0])
						translate([-100,-100,-76])
							cube([200,80,70]);
					spikel();
					mirror([1,0,0])
						spikel();
		}
		minkowski(){
			both_gears();
			sphere(r=0.7);
		}
	}
}

//base_plate();
//gear_bottom();
//both_gears();

//gear_stabilizer();

//gear("gear_front.dxf");
gear();