$fn=50;
h = 12.5;

module roundtagle(x, y, z, r) {
    translate([r, r, 0]) minkowski() {
        cube([x - 2*r, y - 2*r-1, z]);
        cylinder(r=r, h=1);
    }
}

module standoff() {
    difference() {
        cylinder(d=2.9+2, h=h-2);
        cylinder(d=2.9, h=h-2);
    }
}

difference() {
    roundtagle(66, 55, h - 1, 5);  // outer
    translate([1.5, 1.5, 1.5]) roundtagle(66 - 3, 55 - 3, h - 1.5, 5 - 1.5); // inner
    translate([4.5, 0, 0]) cube([51, 12, h]); // battery cutout
    translate([33 - 15 / 2, 55 - 2.6, 1.5]) cube([15, 3, h - 1]);  // lanyard cutout
    translate([66-1.5, 18, h-2.5]) cube([1.5, 9.5, 2.5]);  // switch cutout
}

translate([33, 55 - 3.5, 1.5]) standoff(); 
translate([53.75, 55 - 38.425, 1.5]) standoff(); 
translate([12.75, 55 - 38.425, 1.5]) standoff();

// lanyard guard arc
translate([33, 55 - 2, 1.5]) difference() {
    cylinder(d=17, h=h -1.5);
    cylinder(d=17-3, h=h -1.5);
    translate([-8.5, 1, 0]) cube([17, 10, h-1.5]);
}
