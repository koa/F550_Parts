//include<gimbal-mount.scad>

module bolt_hole(l){
	union(){
		translate([0,0,0.1])
			cylinder(d=4.5,h=l-0.2,$fn=20);
		cylinder(d1=9,d2=8,h=4,$fn=6);
		translate([0,0,l-4])
			cylinder(d1=8,d2=9,h=4,$fn=6);
	}
}

module holes(){
	linear_extrude(height=2){
		import("bottom-plate.dxf", $fn=50);
	}
}

module base_plate(){
	linear_extrude(height=2){
		import("bottom_plate_complete.dxf", $fn=50);
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
		translate([40,0,0])
			cube([20,80,4]);
		translate([-40-20,0,0])
			cube([20,80,4]);
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
			//translate([-3,-3,7])
				//cube([6,6,3]);
		}
	}
}

module both_gears(){
	gear();
	rotate([0,0,180])
		gear("gear_front.dxf");
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
		rotate([-13.5,0,16])
			rotate([90,-90,0])
				translate([0,-15,30])
					linear_extrude(height=170)
						polygon([[10,0],[0,15],[-10,0]]);
				
}

module gear_stabilizer_intern(file){
	difference(){
		translate([57,0,1.5])		
			rotate([90,0,90])
				difference(){
					linear_extrude(height=50){
						//rotate([13.8,0,0])
						import(file);
					}
					rotate([-11.8,0,0])
						translate([-100,-200,11])
							cube([200,180,170]);
					rotate([-14.8,0,0])
						translate([-100,-200,-76])
							cube([200,180,70]);
					spikel();
					mirror([1,0,0])
						spikel();
		}
		minkowski(){
			both_gears();
			sphere(r=0.7);
		}
		translate([180/-2,70,-129])
			rotate([-20,0,0])
				cube([180, 30,50]);
		rotate([0,0,180])
		translate([180/-2,70,-129])
			rotate([-20,0,0])
				cube([180, 30,50]);
	}
}

module gear_stabilizer(){
	gear_stabilizer_intern("gear_stabilizer.dxf");
}
module gear_stabilizer_bottom(){
	gear_stabilizer_intern("gear_stabilizer_bottom.dxf");
}
module leg(){	
	rotate([0,0,30])
		rotate([90,0,0])
			translate([0,0,-5]){
				linear_extrude(height=10)
					import("leg_long_closed.dxf", $fn=100);
				//linear_extrude(height=2)
				//	import("leg_closed.dxf", $fn=100);
			}
}

module leg_complete(){
	difference(){
		leg();
		minkowski(){
			intersection(){
				rotate([0,0,30])
					translate([35,-10,-10])
					cube([60,20,20]);
				base_plate();
			}
			sphere(r=0.4);
		}
		rotate([0,0,30])
			translate([55,0,-6])
				rotate([0,0,30])
					bolt_hole(14);
	}
}

leg_complete();

//gear_bottom();
//both_gears();

//gear_stabilizer();
//gear_stabilizer_bottom();

				//	import("leg_long.dxf", $fn=100);

//gear("gear_front.dxf");
//gear();