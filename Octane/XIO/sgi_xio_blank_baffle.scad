// (c) 2024 James Adams (muegyver), licensed under CC BY-NC-SA 4.0

include <sgi_xio_blank_common.scad>;

module m_baffle() {
    baffle_width = (1+1/4)*inch;
    baffle_height = front_height - tray_thick*2 - 7/32*inch;
    baffle_depth = tray_depth - front_depth + tray_thick;
    baffle_cup_depth = inch;

    // Main brace
    difference() {
        translate([0, baffle_depth/2 + front_depth, baffle_height/2 + tray_thick/2]) {
            translate([0, 0, tray_thick/2]) cube([baffle_width, baffle_depth, tray_thick], center=true);
            translate([0, 0, baffle_height/2 + tray_thick]) cube([tray_thick, baffle_depth, baffle_height], center=true);
        }
        // Screw Holes
        translate([5/16*inch, (3+7/16)*inch + tray_thick/3, baffle_height/2 + tray_thick/2]) union() {
            translate([+3.3/2, 0,      tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
            translate([+3.3/2, 4*inch, tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
        }
        translate([-5/16*inch, (3+7/16)*inch + tray_thick/3, baffle_height/2 + tray_thick/2]) union() {
            translate([-3.3/2, 0,      tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
            translate([-3.3/2, 4*inch, tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
        }
    }

    // End cup
    translate([0, baffle_depth + front_depth + baffle_cup_depth/2, baffle_height + tray_thick]) difference() {
        cube([baffle_width, baffle_cup_depth, baffle_height + tray_thick], center=true);
        translate([0, tray_thick/2, 0]) cube([baffle_width-tray_thick*2, baffle_cup_depth-tray_thick, baffle_height + tray_thick], center=true);
    }
}

m_baffle();
