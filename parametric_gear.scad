function distance(a, b) = sqrt( (a[0] - b[0])*(a[0] - b[0]) +
                                (a[1] - b[1])*(a[1] - b[1]) +
                                (a[2] - b[2])*(a[2] - b[2]) );

function length2(a) = sqrt( a[0]*a[0] + a[1]*a[1] );

function normalized(a) = a / (max(distance([0,0,0], a), 0.00001));

function normalized_axis(a) = a == "x" ? [1, 0, 0]:
                   a == "y" ? [0, 1, 0]:
                   a == "z" ? [0, 0, 1]: normalized(a);

function angleOfNormalizedVector(n) = [0, -atan2(n[2], length2([n[0], n[1]])), atan2(n[1], n[0]) ];

function angle(v) = angleOfNormalizedVector(normalized(v));

function angleBetweenTwoPoints(a, b) = angle(normalized(b-a));

module line(start, end, height, thik){
	l=distance(start,end);
	r=angleBetweenTwoPoints(start,end);
	translate(start)
		rotate(r){
			translate([0,thik/-2,0])
				cube([l,thik,height]);
			//cylinder(d=thik,h=height,$fn=10);
			//translate([l,0,0])
			//	cylinder(d=thik,h=height,$fn=10);
		}
}
module zig_zag(i, step, start1, start2, vec1, vec2,height, thik){
	p1=i*vec1+start1;
	p2=(i+step/2)*vec2+start2;
	p3=(i+step)*vec1+start1;
	line(p1,p2,height,thik);
	line(p2,p3,height,thik);
}

start1=[0,0,0];
end1=[100,3,0];
start2=[0,10,0];
end2=[100,7,0];
h=5;
t=2;
step_count=6;

line(start1,end1,h,t);
line(start2,end2,h,t);
step=1/step_count;
for(i=[0:step:1-step]){
	zig_zag(i,step,start1, start2, end1-start1, end2-start2,h,t);
}