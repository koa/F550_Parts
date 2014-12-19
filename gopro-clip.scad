
xc=-3.5-23.5/2;
h=3;

module gopro(){
	translate([-xc,-41/2,0]){
		translate([xc,16+23.5/2,21.5])
			cylinder(d=23.5,h=7);
		translate([-60,0,0])
			cube([60,41,21.5]);
	}
}

module mount(){
	translate([-31+2-xc,45/-2,-2]){
		cube([31,45,9.5]);
		translate([14.5,-0.5,0])
			cylinder(d=5,h=9.5);
		translate([14.5,0.5+45,0])
			cylinder(d=5,h=9.5);
	}
}

difference(){
	union(){
		translate([0,-41/2+16+23.5/2,21.5])
			cylinder(d=23.5+3*3,h=h);
		translate([-10,-27.5,21.5])
			cube([20,55,h]);
	}
	color("red"){
		gopro();
		mount();
	}
	translate([0,-23,0])
		cylinder(d=3,h=30,$fn=20);
	translate([0,23,0])
		cylinder(d=3,h=30,$fn=20);
}

