rotate([0,-90,0])difference(){
intersection(){
rotate([90,0,0])rotate([0,0,45/2])cylinder(r=12,h=85,$fn=8,center=true);
union(){translate([0,-32.5,0])rotate([90,0,0])rotate([0,0,45/2])cylinder(r1=28,r2=0,h=25,$fn=8,center=true);
rotate([90,0,0])rotate([0,0,45/2])cylinder(r=12,h=40,$fn=8,center=true);
mirror([0,1,0])translate([0,-32.5,0])rotate([90,0,0])rotate([0,0,45/2])cylinder(r1=28,r2=0,h=25,$fn=8,center=true);
}
}

translate([-20.5/2,0,0])cube([20.5,56,1.5],true);
translate([20.5/2,0,0])cube([20.5,58,20.5],true);
translate([20.5/2,0,0])cube([20.5,61.5,4.5],true);
cube([5,61.5,4.2],true);
rotate([90,0,0])cylinder(h=58,r=20.75/2,$fn=60,center=true);

}

*cube([61,4,4]);