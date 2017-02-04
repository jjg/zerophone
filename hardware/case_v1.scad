BB_LENGTH = 75;
BB_WIDTH = 41;
BB_HEIGHT = 20;
CASE_THICKNESS = 3;

union(){
    difference(){
        // exterior box
        translate([3,3,0]){
            $fn=25;
            minkowski(){
                cube([BB_WIDTH, BB_HEIGHT,  BB_LENGTH]);
                translate([0,0,0]){
                    cylinder(r=3, h=1);
                }
            }
        }
        // cut-out for board + battery
        translate([CASE_THICKNESS, CASE_THICKNESS, CASE_THICKNESS]){
            cube([BB_WIDTH, BB_HEIGHT, BB_LENGTH + (CASE_THICKNESS * 2)]);
        }
        // cut-outs for cooling (I should be able to calc. this, but I can't yet
        translate([5.5,0,0]){
            for(a=[0:5:25]){
                translate([a,-(CASE_THICKNESS-1),20]){
                    rotate([0,30,0]){
                        cube([2,(CASE_THICKNESS + 2), 20]);
                    }
                }
            }
        }
    }
    // support blocks
    translate([CASE_THICKNESS,CASE_THICKNESS,CASE_THICKNESS]){
        cube([5,20,8]);
    }
    translate([BB_WIDTH-2,CASE_THICKNESS,CASE_THICKNESS]){
        cube([5,20,8]);
    }
}