# cyclodial drives

recource: https://mevirtuoso.com/cycloidal-drive/

## Import into openscad 

OpenSCAD cannot use SPLINE command, so these dxf files cannot be imported into openscad directly, edit as follows

1. open *.dfx, resize sheet to drawing ([Ctrl] + D) and save a *.svg
2. change line width to 0.01 mm
3. ungroup all
4. convert all objects into path, use path tool (N)
5. close the disc, there is a gap in the segments
5. Add more points: [Ctrl] + A -> +
6. Convert segments to lines: [Ctrl] + A ->
7. save "original" as eg. "cyclodisc01a.svg"
8. save "disc" as eg. "cyclodisc01adisc.svg"
9. save "cut outs" (holes) as eg. "cyclodisc01acut.svg"

## cyclodisc02a.dxf

settings ![cyclodisc02a](cyclodisc02a_2025-08-03_21-21-06.png)

edited files using Inkscape:

+ ![cyclodisc02a.svg](cyclodisc02a.svg)
+ ![cyclodisc02adisc.svg](cyclodisc02adisc.svg)
+ no cyclodisc02acut.svg, do the cuts in openscad
  + 8 x 7.0 mm cuts for the 5 mm output shafts, output diameter: 38.4 mm
  + 18.0 mm in the center for the 18x12x4 mm ball bearing
