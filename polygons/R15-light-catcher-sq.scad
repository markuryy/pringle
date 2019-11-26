use <../lib/tile_fns.scad>
use <../lib/forms.scad>
colors=["gainsboro","silver","dimgray","bisque","rosybrown","lightsteelblue","yellowgreen","lightcoral","red","green","gold","pink"];
scale=2;
inset=0.2;
n=25;
m=7;

tiles = R15_tiles(n,m);
// echo(tiles);

light_square(90,2) 
   fill_tiles(inset_group(scale_tiles(tiles,scale),inset));

// Mann/McLoud/VonDerau 2015
function R15() =
   let(d=sqrt(2+sqrt(3)))
   [[d,105],[1,90],[1,150],[2,60],[1,135]];
   
function R15_tiles(n,m) =
let(tile =peri_to_tile(R15()))
let(assembly= [
    [[0,0]],
    [[0,4,1],[0,4]],
    [[0,0,1],[0,0]],
    [[0,4,1],[2,3]],
    [[0,0],[3,0]],
    [[0,2],[4,4]],
    [[0,4],[5,4]], 
    [[0,4],[6,2]],
    [[0,1,1],[6,1]],
    [[0,3,1],[8,4]],
    [[0,0],[9,0]],
    [[0,4,1],[10,4]]
    ])
    
let(unit=group_tiles([tile],assembly))

let(dx=-tile_offset(unit,[0,3],[1,2]))
let(dy=tile_offset(unit,[1,0],[11,0]))

let(tiles=tesselate_tiles(unit,n,m,dx,dy))

centre_group(flatten(tiles));
  

