// (c) 2024 James Adams (muegyver), licensed under CC BY-NC-SA 4.0

include <sgi_xio_blank_common.scad>;

module m_front() {
    difference() {
        translate([0/16*inch,          0,         0]) cube([front_width, front_depth, front_height]);
        translate([1/32*inch, tray_thick, 1/32*inch]) cube([front_width - 1/16*inch, front_depth, front_height - 1/16*inch]);
        translate([1/16*inch,          0, 7/32*inch]) m_screw_holes(clear=true);

        // Guide Clearance
        translate([0,                       front_depth - 5/16*inch, 0]) cube([3/16*inch, 5/16*inch, 3/16*inch]);
        translate([front_width - 3/16*inch, front_depth - 5/16*inch, 0]) cube([3/16*inch, 5/16*inch, 3/16*inch]);
    }
}

m_front();
