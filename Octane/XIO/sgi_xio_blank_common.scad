// (c) 2024 James Adams (muegyver), licensed under CC BY-NC-SA 4.0

$fn = $preview?90:180;
inch = 25.4;

tray_thick = 3/32*inch;
tray_width = (6+6/16)*inch;
tray_depth = 9*inch;
tray_height = (21/32)*inch;

front_width = 6.5*inch;
front_depth = 11/16*inch;
front_height = 15/16*inch;

module m_screw_holes(clear=false) {
    lower_size = clear?3.5:3;
    upper_size = clear?3.5:2.5;

    // Lower - For original #6 self-tapping screws
    translate([tray_width/2 - 43, 1/4*inch, tray_thick/2]) rotate([90, 0, 0]) cylinder(d=lower_size, h=1/2*inch, center=true);
    translate([tray_width/2 + 43, 1/4*inch, tray_thick/2]) rotate([90, 0, 0]) cylinder(d=lower_size, h=1/2*inch, center=true);

    // Upper - To be tapped M3x0.5
    translate([tray_width/2 - 2.5*inch, tray_thick/2, tray_height-5.1]) rotate([90, 0, 0]) cylinder(d=upper_size, h=1/2*inch, center=true);
    translate([tray_width/2 + 2.5*inch, tray_thick/2, tray_height-5.1]) rotate([90, 0, 0]) cylinder(d=upper_size, h=1/2*inch, center=true);
}

module m_brace(size) {
    hull() {
        translate([0,                 0, -tray_thick])         cube([tray_thick, tray_thick, tray_thick], center=true);
        translate([0, size - tray_thick, -tray_thick])         cube([tray_thick, tray_thick, tray_thick], center=true);
        translate([0,                 0, size - tray_thick*2]) cube([tray_thick, tray_thick, tray_thick], center=true);
    }
}
