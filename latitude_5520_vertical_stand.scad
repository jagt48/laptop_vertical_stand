$fn=200;

base_width = 15;
base_length = 80;
base_height = 7;
opening = 23.5;
vertical_length = base_height;
vertical_width = base_width;
vertical_height = 60;
radius = 2;

union()
{
  // Base
  minkowski()
  {
    cube([base_length,
          base_width,
          base_height - radius],
          center=true);
    //translate([0,0,-1*base_height/2])
    sphere(r=radius);
  }
  
  // Vertical supports
  // Support 1
  translate([-1*((opening + vertical_length)/2 + radius),0,vertical_height/2])
    supports(vertical_length, vertical_width, vertical_height - base_height, radius);
  
  // Support 2
  translate([((opening + vertical_length)/2 + radius),0,vertical_height/2])
    supports(vertical_length, vertical_width, vertical_height - base_height, radius);
}
//
// Module: supports
// Description: Generates the support with desired radius.
// l = Length
// w = width
// h = height
// r = radius of corners
// o = opening
//
module supports(l, w, h, r, o)
{
  minkowski()
  {
    cube([l,w,h], center=true);
    sphere(r=radius);
  }
}

