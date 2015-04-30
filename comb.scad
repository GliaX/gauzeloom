module comb(){union(){

	for(i=[0:19])translate([0,20*2.5-i*5-1.8])difference(){
		translate([-1,0,0])cube([53,2.9,5],true);
		translate([-20,0.25,0])scale([2,1,1]){
		translate([-0.44,0,0])scale([2.0,0.55,1])cylinder(r=1,$fn=30,h=6,center=true);
		translate([-.6,0.8,0])mirror([1,0,0])cube([0.4,0.9,6],center=true);
	}
}

difference(){
cube([52,110,5],true);
translate([-10,0,0])cube([52,102,5.5],true);
for(i=[-20,20])for(j=[-53,53])translate([i,j,0])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.7,h=30,$fn=8,center=true);
}

}
}
module side(){
difference(){
union(){
translate([-14,55,7.5])cube([110,7,25],true);
translate([16,55,7.5])cube([50,7,45],true);
translate([40,55,7.5])cube([3,7,75],true);

}
translate([20,55,-20])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([5,55,-20])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([20,55,35])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([5,55,35])rotate([0,0,45/2])cylinder(r=1.65,h=30,$fn=8,center=true);
translate([35,55,-25])rotate([0,90,0])rotate([0,0,45/2])cylinder(r=1.75,h=30,$fn=8,center=true);
translate([35,55,40])rotate([0,90,0])rotate([0,0,45/2])cylinder(r=1.75,h=30,$fn=8,center=true);
translate([12.5,55,-10])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([-2.5,55,-10])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([12.5,55,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([-2.5,55,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.95,h=30,$fn=8,center=true);
translate([-27,53.1,0])cube([106,5,6],true);
translate([-27,53.1,15])cube([106,5,6],true);
translate([-20,56.1,0])cube([85,5,3.5],true);
translate([-20,56.1,15])cube([85,5,3.5],true);
translate([-66,58.1,15]){rotate([-65,0,0])rotate([0,0,45/2])cylinder(r=1,h=30,$fn=8,center=true);
translate([0,0,-15])rotate([65,0,0])rotate([0,0,45/2])cylinder(r=1,h=30,$fn=8,center=true);
translate([0,-7,-10])rotate([0,0,0])rotate([0,0,45/2])cylinder(r=1,h=15,$fn=8,center=true);
translate([0,-3,-19])rotate([-25,0,0])cube([1.2,15,10],true);
translate([0,-3,4])rotate([25,0,0])cube([1.2,15,10],true);
}

translate([28,58.1,15]){rotate([-65,0,0])rotate([0,0,45/2])cylinder(r=1,h=30,$fn=8,center=true);
translate([6,-1,-24.5])cube([1.2,15,20],true);
translate([2,-1,-15])cube([1.2,15,8],true);
translate([4,-1,-15])cube([4.2,15,1.2],true);
translate([0,-13,10])rotate([25,0,0])cube([1.2,35,30
],true);
}
}
}
module joinbar(){
difference(){
cube([30,101,5],true);
translate([7.5,-40,0])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);
translate([-7.5,-40,0])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);
translate([7.5,40,0])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);
translate([-7.5,40,0])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);
}
}

*translate([5,0,25])joinbar();
%translate([5,0,-10])joinbar();
*translate([0,0,50])rotate([0,0,90])
rotate([90,0,0])spool();
//rotate([-90,0,0])
%side();
%translate([0,0,15])rotate([180,0,0])side();
%translate([-$t*35,0,0]){comb();
%for(i=[1:20])translate([-21,-51.5+i*5,0])cylinder(r=0.25,h=100,center=true);
%for(i=[1:20])translate([-21,-51.5+i*5,0])rotate([0,-10,0])translate([0,0,50])cylinder(r=0.25,h=100,center=true);
}
%translate([-35+$t*35,0,15]){mirror([0,1,0])comb();
%for(i=[1:20])translate([-21,-51.2+i*5-2.5,-15])cylinder(r=0.25,h=100,center=true);
%for(i=[1:20])translate([-21,-51.2+i*5-2.5,-15])rotate([0,10,0])translate([0,0,50])cylinder(r=0.25,h=100,center=true);
}
module spool(){
rotate([90,0,0])difference(){
union(){rotate([0,90,0])rotate([0,0,45/2])cylinder(r=5,h=108,center=true,$fn=8);
translate([-55,0,0])cube([3,9.235,29.235],true);
translate([55,0,0])cube([3,9.235,29.235],true);
}
translate([64,0,0])rotate([0,90,0])rotate([0,0,45/2])cylinder(r=3.5,h=20,center=true,$fn=8);
translate([-64,0,0])rotate([0,90,0])rotate([0,0,45/2])cylinder(r=3.5,h=20,center=true,$fn=8);
translate([0,0,0])rotate([0,90,0])rotate([0,0,45/2])cylinder(r=1.6,h=120,center=true,$fn=8);
for(i=[0:39])translate([50.625-i*2.5,-4.0,0])rotate([-10,0,0])scale([0.65,1.5,1.35])cylinder(r1=1.5,r2=0,h=4,$fn=4,center=true);
translate([50.625-40.5*2.5,-4.0,0])rotate([-10,0,0])scale([0.65,1.5,1.35])cylinder(r1=1.5,r2=0,h=4,$fn=4,center=true);

}
}


difference(){
union(){translate([-40,-29,45])rotate([0,0,90])for(i=[0:40])translate([-21+i*2.5,0,0])cube([1,60,50],true);
translate([5,0,25])
cube([30,101,10],true);
translate([-22.2,0,48])rotate([0,-30,0])cube([2,101,48],true);
}


translate([-62.5,0,48])cube([60,120,50],true);
translate([-72,0,55])rotate([0,-30,0])cube([60,120,60],true);
translate([-85,0,58])rotate([0,30,0])cube([60,120,60],true);
translate([1,0,69])rotate([0,-30,0])cube([60,120,60],true);
translate([-38.5,0,35])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=26/2,h=120,center=true,$fn=8);
*%translate([-38.5,0,35])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=23/2,h=120,center=true);

translate([7.5-10,-40,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);
translate([-7.5+20,-40,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);
translate([7.5-10,40,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);
translate([-7.5+20,40,25])rotate([90,0,0])rotate([0,0,45/2])cylinder(r=1.6,h=30,$fn=8,center=true);


}
