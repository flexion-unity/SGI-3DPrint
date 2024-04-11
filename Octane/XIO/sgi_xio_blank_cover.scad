// (c) 2024 James Adams (muegyver), licensed under CC BY-NC-SA 4.0

include <sgi_xio_blank_common.scad>;

module m_cover() {
    cover_width = (1+6/16)*inch;
    translate([1/16*inch, 0, 7/32*inch]) difference() {
        translate([tray_width/2, tray_depth+6/8*inch,  4/16*inch]) {
            difference() {
                union() {
                    // Main mount
                    translate([0, -(1+1/16)*inch, +3/32*inch]) minkowski() {
                        cube([cover_width - 1/16*inch*2, inch, 4/16*inch], center=true);
                        cylinder(r=1/16*inch, h=4/16*inch, center=true);
                    }

                    // Step
                    translate([0, -(11/32)*inch, +3/32*inch - tray_thick/2]) {
                        cube([cover_width, 5/8*inch, 8/16*inch + tray_thick], center=true);
                    }

                    // Outside
                    translate([0, 2/16*inch, 0]) minkowski() {
                        cube([(1+2/16)*inch, 11/16*inch, 10/16*inch], center=true);
                        cylinder(r=1/8*inch, h=1/16*inch, center=true);
                    }
                }

                // Hollow Base and inside
                minkowski() {
                    cube([(1+2/16)*inch, 7/16*inch, 10/16*inch], center=true);
                    cylinder(r=1/16*inch, h=2/16*inch, center=true);
                }

                // Open End
                translate([0, 1/4*inch, 0]) cube([(1+4/16)*inch, 1/2*inch, 12/16*inch], center=true);

                // Flatten End
                translate([0, 10/16*inch, 0]) cube([2*inch, 1/2*inch, 12/16*inch], center=true);
            }
        }
        // Screw holes - To be tapped M3x0.5
        translate([tray_width/2 - 0.45*inch, tray_depth-0.4*inch, tray_thick*1.5]) cylinder(d=3, h=inch, center=true);
        translate([tray_width/2 + 0.45*inch, tray_depth-0.4*inch, tray_thick*1.5]) cylinder(d=3, h=inch, center=true);
        // Screw access
        //translate([tray_width/2 - 0.8*inch, tray_depth-0.4*inch, tray_thick*4.5]) cylinder(d=6, h=1/2*inch, center=true);
        //translate([tray_width/2 + 0.8*inch, tray_depth-0.4*inch, tray_thick*4.5]) cylinder(d=6, h=1/2*inch, center=true);
        // Locating pin holes
        translate([tray_width/2 - 0.15*inch, tray_depth-0.4*inch, tray_thick*1.5]) cylinder(d=3.2, h=tray_thick*1.5, center=true);
        translate([tray_width/2 + 0.15*inch, tray_depth-0.4*inch, tray_thick*1.5]) cylinder(d=3.2, h=tray_thick*1.5, center=true);
    }
}

m_cover();
