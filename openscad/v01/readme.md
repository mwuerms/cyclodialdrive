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

## cyclodisc01a.dxf

settings ![cyclodisc01a](cyclodisc01a_2025-07-30_11-13-03.png)

edited files using Inkscape:

+ ![cyclodisc01a.svg](cyclodisc01a.svg)
+ ![cyclodisc01adisc.svg](cyclodisc01adisc.svg)
+ ![cyclodisc01acut.svg](cyclodisc01acut.svg)

## cyclodisc01b.dxf

settings ![cyclodisc01b](cyclodisc01b_2025-07-30_14-55-12.png)

edited files using Inkscape:

+ ![cyclodisc01b.svg](cyclodisc01b.svg)
+ ![cyclodisc01bdisc.svg](cyclodisc01bdisc.svg)
+ ![cyclodisc01bcut.svg](cyclodisc01bcut.svg)

