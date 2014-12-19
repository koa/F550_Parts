module compass(){
	translate([-43/2,-43/2,0])
		cube([43,43,10]);
	translate([-38/2,-38/2,0])
		cube([38,38,15]);
}
module buegel(){
	mirror([1,0,0])
		halter();
	halter();
	translate([49/-2,3/-2,-3])
		cube([49,3,3]);	//difference(){
	//	translate([50/-2,3/-2,-2.5])
	//		cube([50,3,15]);
	//	compass();
	//}
}
module buegel_quer(){
	rotate([0,0,90])
		buegel();
	translate([0,0,-3+0.01])
		rotate([90,0,90])
			translate([0,0,-1.5])
			linear_extrude(height=3)
				polygon([[-4,0],[4,0],[0,-3],[4,0]]);
}

module buzzer(){
	cylinder(r=30.5/2,h=5.2);
	translate([3.5/-2,-15,-15+0.01])
		cube([3.5,4.5,15]);
	translate([-2,17,-20])
		cube([4,2,40]);
	translate([-2,-19,-20])
		cube([4,2,40]);

}

module stand(h){
	difference(){
		union(){
			translate([15/-2,10/-2,-h])
				cube([15,10,h]);
			translate([0,3.5,0])
				buegel();
			translate([45/-2,10/2-14,-h])
				cube([45,14,3]);
			translate([15/2+3,10/2-14,-h+2])
				cube([5,14,2]);
			translate([15/-2-3-5,10/2-14,-h+2])
				cube([5,14,2]);
		}
		minkowski(){
			buegel_quer();
			sphere(r=0.5);
		}
		rotate([0,0,15])
			translate([4/-2,40/-2,-10])
				cube([4,40,2]);
		translate([0,0,-h/2-4])
			rotate([90,0,0])
				buzzer();
	}
}
module halter(){
	translate([43/2,0,0])
	rotate([90,0,0])
		translate([0,0,-1.5])
			linear_extrude(height=3){
				polygon([[0,0],[0,10],[-2,11],[-2,13],[3,13],[3,0],[0,0]]);
			}
}

//buegel();
//stand(h=55);
buegel_quer();

//buzzer();