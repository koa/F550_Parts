module sattelite(){
	translate([20.5/-2,0,0])
		cube([20.5,26,7]);
	translate([20.5-20-2,-2,3.5])
		cube([10,10,4.5]);
	rotate([0,90,0])
		translate([-3.4+2.8/2,22.2-2.8/2,0]){		
			translate([0,0,28/-2])
				cylinder(r=2.8/2,h=28);
			translate([0,0,77/-2])
				cylinder(r=1/2,h=77);
		}
}

module taster(){
	translate([0,0,-20+0.0001])
		cylinder(r=8.5/2,h=20, $fn=40);
	cylinder(r=11/2,h=7);
	translate([0,0,-20+0.0001])
		cylinder(r=11/2,h=18);
}


module 3drradio(){ 
	translate([26.7/-2,0,0])
		cube([26.7,50,12.0]);
	translate([26.7/-2,15,0])
		cube([26.7,35,13.2]);
}

module top_plate(){
	translate([0,0,-1.7])
	linear_extrude(height=1.7)
		import("top_plate.dxf");
}

module parts(){
	color("blue"){
		translate([5,-70,0.5])
			rotate([0,0,180])
				sattelite();
		translate([15,-58,10])
			taster();
		translate([-5,-45,9])
			rotate([0,0,180])
				3drradio();
		top_plate();
		translate([10/-2,-55,-15])
			cube([10,4,20])	;
		translate([-9,-60,-15])
			cube([4,2,20]);		
		translate([-9,-80,-15])
			cube([4,2,20]);		
	}
}

//minkowski(){
//	top_plate();
//	sphere(r=0.5);
//}

module holder(b,t,h){
	translate([b/-2,t/-2,7.6])
		cube([b,t,h]);
}
module top_part(){
	difference(){
		union(){
			translate([-25,-97,7.6])
				cube([48,55,2.5]);
			translate([-5,-45,0]){
					//translate([-7.5,0,0])
					//	holder(b=7,t=7,h=16);
					//translate([-7.5,-50,0])
					//	holder(b=7,t=7,h=17);
					translate([9,-25,7.6])
						rotate([90,0,0])
							linear_extrude(height=20){
								polygon([[2,0],[2,17],[7,17],[18,0]]);
							}
					translate([-9,-45,7.6])
						rotate([90,0,180])
							linear_extrude(height=20){
								polygon([[2,0],[2,17],[7,17],[11.7,0]]);
							}
					//translate([26.7/-2,-25,0])
					//	holder(b=7,t=7,h=17);
					//translate([26.7/2,-25,0])
					//	holder(b=7,t=7,h=17);
			}
		}
		translate([48-25-8,-97+39,7.6])
			cube([8,1,2.5]);
	parts();
	}
	
}
module bottom_part(){
	difference(){
		union(){
			translate([5,0,0]){			
				translate([80/-2,-97,0])
					cube([80,10,2.5]);
				translate([30/-2,-97,0])
					cube([30,55,2.5]);
				translate([-33,-100,0])
					cube([10,5,14]);
				translate([-33+45,-100,0])
					cube([10,5,14]);
				translate([-2,-43-1,0])
					cube([10,5,14]);
				translate([-2-25,-43-1,0])
					cube([45,5,10]);
				translate([-2-25,-43-1,0])
					cube([5,5,14]);
			}
		}
		rotate([0,0,30])
			translate([35/-2,-122,-0.01])
				cube([35,20,5]);
		parts();
		minkowski(){
			top_part();
			sphere(r=0.8);
		}
		translate([5,-60,-0.01])
			cylinder(r1=3,r2=2,h=2);
	}
	
}
module base_fix(){
	difference(){
		union(){
			translate([50/-2,-75,-3.01])
				cube([50,30,3]);
			translate([5,-60,-0.5])
				cylinder(r1=3,r2=2,h=2);
		}
		minkowski(){
			parts();
			sphere(r=0.5);
		}
	}
}
//base_fix();
top_part();
//bottom_part();
//parts();
//sattelite();