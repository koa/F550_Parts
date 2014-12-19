
module holes(){
	linear_extrude(height=2)
		import("bottom-plate.dxf", $fn=60);
}

module base_plate(){
	difference(){
		cylinder(r=70, h=2);
		holes();
	}
}

module gewindeloch(){
	cylinder(r=1.6, h=6, $fn=10);
}

module gimbal_holes(){
	translate([22.5,22.5,0])
		gewindeloch();
	translate([-22.5,22.5,0])
		gewindeloch();
	translate([22.5,-22.5,0])
		gewindeloch();
	translate([-22.5,-22.5,0])
		gewindeloch();
}
module nose(){
	difference(){
		union(){
			cube([4.5,10,15]);
			cube([8,10,11]);
			translate([4.5,0,12.0])
				rotate([0,-45,0]){
					cube([1,10,4]);
				}
		}
		translate([4.5,0,12.0])
			rotate([0,-45,0]){
				translate([0.6,0,0])
					cube([3,10,10]);
			}
		translate([0,0,15])
		cube([4.5,10,3]);
	}
}

module buegel(){
		translate([0,0,1.5])
			cube([77,10,3], center=true);
		translate([-77/2,-5,0]){
			nose();
		}
		rotate([0,0,180])
			translate([-77/2,-5,0]){
				nose();
			}
}
module quarter_holder(){
	translate([0,5,0])
		cube([10,17,3]);
	translate([5,5,0]){
		cylinder(r=5,h=3);
	}
}
module half_holder(){
	translate([-27.5,-27.5,0]){
		quarter_holder();
	}
	translate([45-27.5,-27.5,0]){
		quarter_holder();
	}
}
module all(){
	difference(){
		translate([0,0,-10]){	
			difference(){
				union(){
					rotate([0,0,18]){
						buegel();
					}
					rotate([0,0,-18]){
						buegel();
					}
					half_holder();
					rotate([0,0,180])
						half_holder();
				}
				gimbal_holes();
			}
		}
		base_plate();
	}
}
all();
//base_plate();
//nose();
//quarter_holder();