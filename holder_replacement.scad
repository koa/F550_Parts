module hole(){
	//cylinder(r=4/2,h=2.1, $fn=30);
	translate([0,0,2.14-4])
		rotate_extrude($fn=30)
			polygon([[0,0],[2,0],[2,6],[7/2,8],[7/2,15],[0,15]]);
}
module motor(){
	rholeY=(22.8-4)/2;
	rholeX=(19.8-4)/2;
	diameter=28.3;
	translate([0,0,-24.5-2]){
		translate([0,0,2])
			cylinder(r=diameter/2, h=17.2, $fn=50);
		translate([0,0,2+17.5])
			cylinder(r=diameter/2, h=24.5-17.5, $fn=50);
		cylinder(r=9/2, h=2);
		rotate([0,0,45])
			translate([12.3/-2,0,2+17.5])
				cube([12.3,29.2-diameter/2,24.5-17.5]);
		translate([rholeX,0,24.5+2])
			hole();
		translate([-rholeX,0,24.5+2])
			hole();
		translate([0,rholeY,24.5+2])
			hole();
		translate([0,-rholeY,24.5+2])
			hole();
	}
		cylinder(r=8/2,h=10);
}
side_step=2.5;
module motors(){
	translate([0,side_step,0])
		rotate([0,0,-90])
			motor();
	rotate([0,0,180])
		translate([0,23,48-1.5])
			rotate([90,-90,0])
				motor();
}
module arm(){
	difference(){
		union(){
			translate([0,-22,46.5])
				rotate([-90,0,0])
					cylinder(r=20,h=6)
			translate([40/-2,-22,15])
				cube([40,4,46.5-15]);
			translate([-20,-22,-18])
				cube([40,48+side_step,10]);
			translate([-20,-22,-18])
				cube([20,30,46.5+18]);
		}		
		translate([0,side_step,-7.99])
			cylinder(r=15,h=60);
		translate([-1,0,-18.5])
			cube([2,28+side_step,12]);
		gopro();
		motors();
		translate([-20.1,21+side_step,-13])
			rotate([0,90,0])
				screw();
	}
}
module gopro(){
	translate([0,-22,48-1.5])
		rotate([-90,0,0])
		translate([0,0,5])
			rotate_extrude()
				polygon([[0,28],[0,0],[9,0],[13.5,3],[30,3],[35,20],[35,30]]);
}
module screw(){
	rotate_extrude()
		polygon([[0,0],[5,0],[3,3],[3,50],[0,50]]);
	translate([-5.5,-6.5,37])
		cube([11,13,4]);
}
//gopro();
//motors();
//screw();
arm();
//hole();