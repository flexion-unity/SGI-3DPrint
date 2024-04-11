// (c) 2024 James Adams (muegyver), licensed under CC BY-NC-SA 4.0

include <sgi_xio_blank_common.scad>;

braces = 4;

module m_tray() translate([1/16*inch, tray_thick, 7/32*inch]) {
    difference() {
        union() {
            // Front
            translate([0, 0, tray_thick]) cube([(6+6/16)*inch, tray_thick, tray_height - tray_thick]);

            // Base
            cube([tray_width, tray_depth, tray_thick]);

            // Front Screw Supports
            hull() {
                translate([tray_width/2 - 43, 3/8*inch, tray_thick/2 + 1/16*inch]) cube([1/4*inch, 3/4*inch, 1/8*inch], center=true);
                translate([tray_width/2 - 43, 7/16*inch, tray_thick/2]) cube([3/8*inch, 3/4*inch, tray_thick], center=true);
            }
            hull() {
                translate([tray_width/2 + 43, 3/8*inch, tray_thick/2 + 1/16*inch]) cube([1/4*inch, 3/4*inch, 1/8*inch], center=true);
                translate([tray_width/2 + 43, 7/16*inch, tray_thick/2]) cube([3/8*inch, 3/4*inch, tray_thick], center=true);
            }

            // Locating pins for rear connector cover
            translate([tray_width/2 - 0.15*inch, tray_depth-0.4*inch - tray_thick, tray_thick*1.5]) cylinder(d1=2.98, d2=2.68, h=tray_thick, center=true);
            translate([tray_width/2 + 0.15*inch, tray_depth-0.4*inch - tray_thick, tray_thick*1.5]) cylinder(d1=2.98, d2=2.68, h=tray_thick, center=true);
        }

        // Hole in base to save time and plastic
        {
            cr = 1/4*inch;
            translate([0.75*inch+cr, 1.25*inch+cr, -1]) minkowski() {
                cube([tray_width-1.5*inch-cr*2, tray_depth-tray_thick-1.5*inch-1/2*inch-cr*2, tray_thick*2]);
                cylinder(d=cr, h=tray_thick, center=true);
            }
        }

        // Clearance for front panel
        translate([0, tray_thick, 0]) cube([tray_thick/2, 11/16*inch, tray_thick]);
        translate([tray_width - tray_thick/2, tray_thick, 0]) cube([tray_thick/2, 11/16*inch, tray_thick]);

        // Screw Holes in Front
        m_screw_holes();

        // Screw Holes in Base
        translate([5/16*inch, (3+6/16)*inch, 0]) union() {
            translate([ 0,             0*inch, tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
            translate([(5+12/16)*inch, 0*inch, tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
            translate([ 0,             4*inch, tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
            translate([(5+12/16)*inch, 4*inch, tray_thick/2]) cylinder(d=3.3, h=tray_thick, center=true);
        }

        // Fixing points for connector cover - For M3 bolts to pass through
        translate([tray_width/2 - 0.45*inch, tray_depth-0.4*inch - tray_thick, tray_thick/2]) cylinder(d=3.2, h=10, center=true);
        translate([tray_width/2 + 0.45*inch, tray_depth-0.4*inch - tray_thick, tray_thick/2]) cylinder(d=3.2, h=10, center=true);
    }

    // Front Braces
    for (i=[0:braces-1]) {
        s = (tray_width - tray_thick) / (braces-1) - tray_thick / (braces-1);
        translate([s*i+tray_thick, tray_thick*0.5, tray_thick*1.5]) m_brace(tray_height - tray_thick);
    }
}

m_tray();
