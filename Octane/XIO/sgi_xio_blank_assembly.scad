// (c) 2024 James Adams (muegyver), licensed under CC BY-NC-SA 4.0

tray = true;
front = true;
cover = true;
baffle = true;

include <sgi_xio_blank_common.scad>;

use <sgi_xio_blank_tray.scad>;
use <sgi_xio_blank_front.scad>;
use <sgi_xio_blank_cover.scad>;
use <sgi_xio_blank_baffle.scad>;

for (i=[0:1]) for (j=[0:1]) {
    rotate([0, 180 * i ,0]) {
        translate([-front_width * j, 0, 0]) {
            if (tray) m_tray();
            if (front) m_front();
            if (cover) m_cover();
            }
        if (baffle) m_baffle();
    }
}
