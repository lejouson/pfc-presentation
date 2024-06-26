string base_name, base_version;	base_name="gis-pfc"; base_version="0.5";
message "Preloading the gis-pfc file, version "&base_version;



verbatimtex
%&latex
\documentclass{minimal}
\usepackage[T1]{fontenc}
\usepackage[nofontinfo]{lucidabr}
\begin{document}
\fontsize{11pt}{13.2pt}\selectfont
etex



% ==================================================================
def amplifier =
begingroup
save r;
path r;

r = (0, -1/2)--(sqrt(3)/2, 0)--(0, 1/2)--cycle;

(r)
endgroup

enddef;
% ==================================================================



% ==================================================================
def resistor =
begingroup
save r;
path r;

r = (-0.525, 0)--(-0.5, 0)--(-0.4, 0.1)--(-0.2, -0.1)--
    (0, 0.1)--(0.2, -0.1)--(0.4, 0.1)--(0.5, 0)--(0.525, 0);

(r)
endgroup

enddef;
% ==================================================================



% ==================================================================
def capacitor =
begingroup
save f, r;
picture f; path r;

f = nullpicture;
r = (-0.4, 0)--(0.4, 0);
addto f doublepath r shifted (0, 0.1);
addto f doublepath r shifted (0, -0.1);

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def ground =
begingroup
save c,f;
numeric c; picture f;

c = sqrt(3)/4;
f = nullpicture;
addto f doublepath (-1/2, 0)--(1/2, 0);
addto f doublepath (-1/2 + c/2, -1/2)--(1/2 - c/2, -1/2);
addto f doublepath (-1/2 + c/4, -1/4)--(1/2 - c/4, -1/4);

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def loudspeaker =
begingroup
save f;
picture f;

f = nullpicture;
addto f doublepath (-1, -2/3)--(0, -2/3)--(0, 2/3)--(-1, 2/3)--
    cycle;
addto f doublepath (0, -2/3)--(1, -4/3)--(1, 4/3)--(0, 2/3)--cycle;

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def switchC (expr escala)=
begingroup
save c,n,f,r,x,y;
numeric c,x[],y[]; pen n[]; picture f; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f = nullpicture;

r0 = fullcircle scaled (1/4);
r1 = (0, 0)--(1 + 1/8, 0);
z0 = fullcircle scaled 2 shifted (-1/2, 0) intersectionpoint
    halfcircle scaled (1/4) shifted (1/2, 0);
c = angle (z0 shifted (1/2, 0));
addto f doublepath r1 rotated c shifted (-1/2, 0) scaled escala
    withpen n2;
addto f contour r0 shifted (-1/2, 0) scaled escala withpen n0
    withcolor white;
addto f contour r0 shifted (1/2, 0) scaled escala withpen n0
    withcolor white;
addto f doublepath r0 shifted (-1/2, 0) scaled escala withpen n1;
addto f doublepath r0 shifted (1/2, 0) scaled escala withpen n1;

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def switchO (expr escala)=
begingroup
save n,f,r;
pen n[]; picture f; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f = nullpicture;

r0 = fullcircle scaled (1/4);
r1 = (0, 0)--(1 + 1/8, 0);
addto f doublepath r1 rotated 30 shifted (-1/2, 0) scaled escala
    withpen n2;
addto f contour r0 shifted (-1/2, 0) scaled escala withpen n0
    withcolor white;
addto f contour r0 shifted (1/2, 0) scaled escala withpen n0
    withcolor white;
addto f doublepath r0 shifted (-1/2, 0) scaled escala withpen n1;
addto f doublepath r0 shifted (1/2, 0) scaled escala withpen n1;

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def switchT (expr escala)=
begingroup
save c,n,f,r,x,y;
numeric c,x[],y[]; pen n[]; picture f; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f = nullpicture;

% ··································································
% Utilizo la relación establecida en el estandar ieee315 en el que
% la relación entre la distancia que separa a la recta que atraviesa
% los conectores fijos del conector móvil y la distancia que separa
% a cada uno de los conectores fijos es de 9/7. La longitud de la
% patilla móvil dada esta relación y una primera distancia de 1
% (segunda distancia de 1/(9/7) = 7/9) es de aproximadamente
% sqrt(1 + (7/9)^2) = sqrt(130/81).
r0 = fullcircle scaled (1/4);
z0 = fullcircle scaled (2 * sqrt(1 + 49/324)) shifted (-1/2, 0)
    intersectionpoint halfcircle scaled (-1/4) shifted (1/2, 7/18);
c = angle (z0 shifted (1/2, 0));
r1 = (0, 0)--(1 + 1/8, 0);
addto f doublepath r1 rotated c shifted (-1/2, 0) scaled escala
    withpen n2;	    % roto primero y desplazo luego así no pierdo el
		    % origen
addto f contour r0 shifted (-1/2, 0) scaled escala withpen n0
    withcolor white;
addto f contour r0 shifted (1/2, 7/18) scaled escala withpen n0
    withcolor white;
addto f contour r0 shifted (1/2, -7/18) scaled escala withpen n0
    withcolor white;
addto f doublepath r0 shifted (-1/2, 0) scaled escala withpen n1;
addto f doublepath r0 shifted (1/2, 7/18) scaled escala withpen n1;
addto f doublepath r0 shifted (1/2, -7/18) scaled escala withpen n1;

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def switchPI (expr escala)=
begingroup
save n,f,r;
pen n[]; picture f; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f = nullpicture;

r0 = fullcircle scaled 1/4;
r1 = (-1/2, 1/2)--(1/2, 1/2);
r2 = (0, 1/2)--(0, 1);
addto f doublepath r1 scaled escala withpen n2;
addto f doublepath r2 scaled escala withpen n2;
addto f contour r0 shifted (-1/2, 0) scaled escala
    withpen n0 withcolor white;
addto f contour r0 shifted (1/2, 0) scaled escala
    withpen n0 withcolor white;
addto f doublepath r0 shifted (-1/2, 0) scaled escala withpen n1;
addto f doublepath r0 shifted (1/2, 0) scaled escala withpen n1;

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def tlc (expr escala)=
begingroup
save i,n,f,r;
numeric i; pen n[]; picture f; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f = nullpicture;

r0 = (-3.5, -5)--(3.5, -5)--(3.5, 5)--(-3.5, 5)--cycle;
addto f contour r0 scaled escala withpen n0 withcolor white;
r1 = (0, -2/3)--(1/2, -2/3)--(1/2, 2/3)--(0, 2/3)--cycle;
for i = -3, -1, 1, 3 :
    addto f contour r1 shifted (3.5, i)
	scaled escala withpen n0 withcolor white;
    addto f contour r1 xscaled -1 shifted (-3.5, i)
	scaled escala withpen n0 withcolor white;
    addto f doublepath r1 shifted (3.5, i)
	scaled escala withpen n1;
    addto f doublepath r1 xscaled -1 shifted (-3.5, i)
	scaled escala withpen n1;
endfor
r2 = halfcircle scaled 2 yscaled -1;
r3 = (1, 1)--r2--(-1, 1);
addto f doublepath r3 shifted (0, 4) scaled escala withpen n1;
addto f doublepath r0 scaled escala withpen n2;
addto f also thelabel(btex 1 etex, escala * (-2.5, 3));
addto f also thelabel(btex 2 etex, escala * (-2.5, 1));
addto f also thelabel(btex 3 etex, escala * (-2.5, -1));
addto f also thelabel(btex 4 etex, escala * (-2.5, -3));
addto f also thelabel(btex 5 etex, escala * (2.5, -3));
addto f also thelabel(btex 6 etex, escala * (2.5, -1));
addto f also thelabel(btex 7 etex, escala * (2.5, 1));
addto f also thelabel(btex 8 etex, escala * (2.5, 3));
addto f also thelabel(btex \textsc{tlc555} etex, (0, 0)) rotated 90
    shifted (0, -escala);

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def cdub (expr escala)=
begingroup
save i,n,f,r;
numeric i; pen n[]; picture f; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f = nullpicture;

r0 = (-3.5, -9)--(3.5, -9)--(3.5, 9)--(-3.5, 9)--cycle;
addto f contour r0 scaled escala withpen n0 withcolor white;
r1 = (0, -2/3)--(1/2, -2/3)--(1/2, 2/3)--(0, 2/3)--cycle;
for i = -7 step 2 until 7 :
    addto f contour r1 shifted (3.5, i)
	scaled escala withpen n0 withcolor white;
    addto f contour r1 xscaled -1 shifted (-3.5, i)
	scaled escala withpen n0 withcolor white;
    addto f doublepath r1 shifted (3.5, i)
	scaled escala withpen n1;
    addto f doublepath r1 xscaled -1 shifted (-3.5, i)
	scaled escala withpen n1;
endfor
r2 = halfcircle scaled 2 yscaled -1;
r3 = (1, 1)--r2--(-1, 1);
addto f doublepath r3 shifted (0, 8) scaled escala withpen n1;
addto f doublepath r0 scaled escala withpen n2;
addto f also thelabel(btex 1 etex, escala * (-2.5, 7));
addto f also thelabel(btex 2 etex, escala * (-2.5, 5));
addto f also thelabel(btex 3 etex, escala * (-2.5, 3));
addto f also thelabel(btex 4 etex, escala * (-2.5, 1));
addto f also thelabel(btex 5 etex, escala * (-2.5, -1));
addto f also thelabel(btex 6 etex, escala * (-2.5, -3));
addto f also thelabel(btex 7 etex, escala * (-2.5, -5));
addto f also thelabel(btex 8 etex, escala * (-2.5, -7));
addto f also thelabel(btex 9 etex, escala * (2.5, -7));
addto f also thelabel(btex 10 etex, escala * (2.5, -5));
addto f also thelabel(btex 11 etex, escala * (2.5, -3));
addto f also thelabel(btex 12 etex, escala * (2.5, -1));
addto f also thelabel(btex 13 etex, escala * (2.5, 1));
addto f also thelabel(btex 14 etex, escala * (2.5, 3));
addto f also thelabel(btex 15 etex, escala * (2.5, 5));
addto f also thelabel(btex 16 etex, escala * (2.5, 7));
addto f also thelabel(btex \textsc{cd4049ub} etex, (0, 0))
    rotated 90 shifted (0, 0);

(f)
endgroup

enddef;
% ==================================================================



% ==================================================================
def pin (expr escala)=
begingroup
save c,n,f,r;
numeric c[]; pen n[]; picture f[]; path r[];
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f0 = nullpicture;

% ··································································
% estoy contento con el resultado pero podría haber sido mucho más
% fácil definirlo
c0 = 1/2;			c1 = 1;
c2 = c1 + 1/4;			c3 = 17/20;
r0 = (-c0, -c0)--(c0, c0);
r1 = (-c0, c0)--(c0, -c0);
r2 = (-c0, -c0)--(c0, -c0)--(c0, c0)--(-c0, c0)--cycle;
r3 = r2 scaled sqrt(c3);
r4 = r2 scaled (c3**2);
r5 = r0 scaled (c3**4);
r6 = r1 scaled (c3**4);
r7 = (-c1/2, -c2/2)--(c1/2, -c2/2){right}..{up}(c2/2, -c1/2)-- %
	(c2/2, c1/2){up}..{left}(c1/2, c2/2)-- %
	(-c1/2, c2/2){left}..{down}(-c2/2, c1/2)-- %
	(-c2/2, -c1/2){down}..{right}cycle;
addto f0 contour r7 scaled escala withpen n0;
addto f0 contour r3 scaled escala withpen n0 withcolor white;
addto f0 contour r4 scaled escala withpen n0;
addto f0 doublepath r5 scaled escala withpen n2 withcolor white;
addto f0 doublepath r6 scaled escala withpen n2 withcolor white;

% ··································································
% cierro la definición
(f0)
endgroup

enddef;
% ==================================================================



% ==================================================================
def conectorh (expr escala)=
begingroup
save c,d,n,f,r;
numeric c[], d[][]; pen n[]; picture f[]; path r[];
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f0 = nullpicture;

% ··································································
% constantes
c00 = escala;			c01 = 5c00/2;
c02 = 3c00;			c03 = 2c00 + c02 + 6c00;
c04 = 3c00;			c05 = 18c01;
c06 = c03 * sind(30)/cosd(30);	c07 = c06/3;
z00 = (0, 0);			z01 = (c06, 0) rotated 30;
z02 = (c07, 0) rotated 210;	z03 = (c07, 0) rotated 150;
z04 = (c06, 0) rotated 330;

% ··································································
% cubierta
r0 = (-c03/2, -c05/2){down}.. %
	{dir 30}z01 shifted (-c03/2, -c05/2 - c06)-- %
	z02 shifted (c03/2, -c05/2){dir 30}.. %
	{up}(c03/2, c07 - c05/2)--(c03/2, c05/2 - c07){up}.. %
	{dir 150}z03 shifted (c03/2, c05/2)-- %
	z04 shifted (-c03/2, c05/2 + c06){dir 150}.. %
	(-c03/2, c05/2)--cycle;
addto f0 doublepath r0 rotated 90 withpen n2;

% ··································································
% pines y posiciones
f1 = pin(c00);
for i = 0 upto 17 :
	d[0][i] =  c01/2 + i*c01 - c05/2;
	addto f0 also f1 shifted (d[0][i], -c02/2);
	addto f0 also f1 shifted (d[0][i], c02/2);
endfor

% ··································································
% etiquetas internas
label.bot(btex 1 etex, (d[0][0], -c00 - c02/2));
label.bot(btex 2 etex, (d[0][1], -c00 - c02/2));
label.bot(btex 3 etex, (d[0][2], -c00 - c02/2));
label.bot(btex 4 etex, (d[0][3], -c00 - c02/2));
label.bot(btex 5 etex, (d[0][4], -c00 - c02/2));
label.bot(btex 6 etex, (d[0][5], -c00 - c02/2));
label.bot(btex 7 etex, (d[0][6], -c00 - c02/2));
label.bot(btex 8 etex, (d[0][7], -c00 - c02/2));
label.bot(btex 9 etex, (d[0][8], -c00 - c02/2));
label.bot(btex 10 etex, (d[0][9], -c00 - c02/2));
label.bot(btex 11 etex, (d[0][10], -c00 - c02/2));
label.bot(btex 12 etex, (d[0][11], -c00 - c02/2));
label.bot(btex 13 etex, (d[0][12], -c00 - c02/2));
label.bot(btex 14 etex, (d[0][13], -c00 - c02/2));
label.bot(btex 15 etex, (d[0][14], -c00 - c02/2));
label.bot(btex 16 etex, (d[0][15], -c00 - c02/2));
label.bot(btex 17 etex, (d[0][16], -c00 - c02/2));
label.bot(btex 18 etex, (d[0][17], -c00 - c02/2));
label.top(btex 19 etex, (d[0][0], c00 + c02/2));
label.top(btex 20 etex, (d[0][1], c00 + c02/2));
label.top(btex 21 etex, (d[0][2], c00 + c02/2));
label.top(btex 22 etex, (d[0][3], c00 + c02/2));
label.top(btex 23 etex, (d[0][4], c00 + c02/2));
label.top(btex 24 etex, (d[0][5], c00 + c02/2));
label.top(btex 25 etex, (d[0][6], c00 + c02/2));
label.top(btex 26 etex, (d[0][7], c00 + c02/2));
label.top(btex 27 etex, (d[0][8], c00 + c02/2));
label.top(btex 28 etex, (d[0][9], c00 + c02/2));
label.top(btex 29 etex, (d[0][10], c00 + c02/2));
label.top(btex 30 etex, (d[0][11], c00 + c02/2));
label.top(btex 31 etex, (d[0][12], c00 + c02/2));
label.top(btex 32 etex, (d[0][13], c00 + c02/2));
label.top(btex 33 etex, (d[0][14], c00 + c02/2));
label.top(btex 34 etex, (d[0][15], c00 + c02/2));
label.top(btex 35 etex, (d[0][16], c00 + c02/2));
label.top(btex 36 etex, (d[0][17], c00 + c02/2));

% ··································································
% cierro la definición
(f0)
endgroup

enddef;
% ==================================================================



% ==================================================================
def conectorv (expr escala)=
begingroup
save c,d,n,f,r;
numeric c[], d[][]; pen n[]; picture f[]; path r[];
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f0 = nullpicture;

% ··································································
% constantes
c00 = escala;			c01 = 5c00/2;
c02 = 3c00;			c03 = 2c00 + c02 + 6c00;
c04 = 3c00;			c05 = 18c01;
c06 = c03 * sind(30)/cosd(30);	c07 = c06/3;
z00 = (0, 0);			z01 = (c06, 0) rotated 30;
z02 = (c07, 0) rotated 210;	z03 = (c07, 0) rotated 150;
z04 = (c06, 0) rotated 330;

% ··································································
% cubierta
r0 = (-c03/2, -c05/2){down}.. %
	{dir 30}z01 shifted (-c03/2, -c05/2 - c06)-- %
	z02 shifted (c03/2, -c05/2){dir 30}.. %
	{up}(c03/2, c07 - c05/2)--(c03/2, c05/2 - c07){up}.. %
	{dir 150}z03 shifted (c03/2, c05/2)-- %
	z04 shifted (-c03/2, c05/2 + c06){dir 150}.. %
	(-c03/2, c05/2)--cycle;
addto f0 doublepath r0 withpen n2;

% ··································································
% pines y posiciones
f1 = pin(c00, z00);
for i = 0 upto 17 :
	d[0][i] = c05/2 - c01/2 - i*c01;
	addto f0 also f1 shifted (-c02/2, d[0][i]);
	addto f0 also f1 shifted (c02/2, d[0][i]);
endfor

% ··································································
% etiquetas internas
label.lft(btex 1 etex, (-c00 - c02/2, d[0][0]));
label.lft(btex 2 etex, (-c00 - c02/2, d[0][1]));
label.lft(btex 3 etex, (-c00 - c02/2, d[0][2]));
label.lft(btex 4 etex, (-c00 - c02/2, d[0][3]));
label.lft(btex 5 etex, (-c00 - c02/2, d[0][4]));
label.lft(btex 6 etex, (-c00 - c02/2, d[0][5]));
label.lft(btex 7 etex, (-c00 - c02/2, d[0][6]));
label.lft(btex 8 etex, (-c00 - c02/2, d[0][7]));
label.lft(btex 9 etex, (-c00 - c02/2, d[0][8]));
label.lft(btex 10 etex, (-c00 - c02/2, d[0][9]));
label.lft(btex 11 etex, (-c00 - c02/2, d[0][10]));
label.lft(btex 12 etex, (-c00 - c02/2, d[0][11]));
label.lft(btex 13 etex, (-c00 - c02/2, d[0][12]));
label.lft(btex 14 etex, (-c00 - c02/2, d[0][13]));
label.lft(btex 15 etex, (-c00 - c02/2, d[0][14]));
label.lft(btex 16 etex, (-c00 - c02/2, d[0][15]));
label.lft(btex 17 etex, (-c00 - c02/2, d[0][16]));
label.lft(btex 18 etex, (-c00 - c02/2, d[0][17]));
label.rt(btex 19 etex, (c00 + c02/2, d[0][0]));
label.rt(btex 20 etex, (c00 + c02/2, d[0][1]));
label.rt(btex 21 etex, (c00 + c02/2, d[0][2]));
label.rt(btex 22 etex, (c00 + c02/2, d[0][3]));
label.rt(btex 23 etex, (c00 + c02/2, d[0][4]));
label.rt(btex 24 etex, (c00 + c02/2, d[0][5]));
label.rt(btex 25 etex, (c00 + c02/2, d[0][6]));
label.rt(btex 26 etex, (c00 + c02/2, d[0][7]));
label.rt(btex 27 etex, (c00 + c02/2, d[0][8]));
label.rt(btex 28 etex, (c00 + c02/2, d[0][9]));
label.rt(btex 29 etex, (c00 + c02/2, d[0][10]));
label.rt(btex 30 etex, (c00 + c02/2, d[0][11]));
label.rt(btex 31 etex, (c00 + c02/2, d[0][12]));
label.rt(btex 32 etex, (c00 + c02/2, d[0][13]));
label.rt(btex 33 etex, (c00 + c02/2, d[0][14]));
label.rt(btex 34 etex, (c00 + c02/2, d[0][15]));
label.rt(btex 35 etex, (c00 + c02/2, d[0][16]));
label.rt(btex 36 etex, (c00 + c02/2, d[0][17]));

% ··································································
% cierro la definición
(f0)
endgroup

enddef;
% ==================================================================



% ==================================================================
def sierra =
begingroup
save c,d,r;
numeric c[], d[][]; path r[];

% ··································································
% primer periodo de una función diente de sierra con Th = 2/3, Tl =
% 1/3 (T = 1).
c0 = 1/100;			c1 = 1 - c0;	% Vtl y Vth
c2 = -256/mlog(c0/c1);		c3 = 2c2/3;	% T1
c4 = c3/2;			c5 = 250;	% T2 y N
c6 = 1/250;			c7 = 256/c4;	% Paso y cte. aux.
c8 = 166;					% i / 2/3 < d[0][i]
for i = 0 upto c8 :
	d[0][i] = i*c6;
	d[1][i] = -256d[0][i]/c3;
	d[2][i] = 1 - mexp(d[1][i]);
	d[3][i] = c0 + c1*d[2][i];
endfor
c9 = d[0][c8];
for i = (c8 + 1) upto c5 :
	d[0][i] = i*c6;
	d[1][i] = (c9 - d[0][i])*c7;
	d[2][i] = 1 - mexp(d[1][i]);
	d[3][i] = c1 - c1*d[2][i];
endfor
r0 = (d[0][0], d[3][0]) for i = 1 upto c8 :
	..(d[0][i], d[3][i]) endfor -- %
	for i = (c8 + 1) upto (c5 - 1) :
		(d[0][i], d[3][i]).. endfor %
	(d[0][c5], d[3][c5]);

% ··································································
% cierro la definición
(r0)
endgroup

enddef;
% ==================================================================



% ==================================================================
def osciloscopio(expr escala, desplazamiento) =
begingroup
save c,n,f,r,x,y;
numeric c[],x[],y[]; pen n[]; picture f[]; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f0 = nullpicture;
f1 = nullpicture;
f2 = nullpicture;
f3 = nullpicture;

% ··································································
% constantes necesarias para formar la cuadrícula
c0 = 1;				c1 = 5c00; % cuadro pequeño/grande
c2 = c0/2;			c3 = 10c1; % tick/ancho total
c4 = 8c1;				   % alto total
r0 = (0, 0)--(c2, 0);		r1 = (-c2/2, 0)--(c2/2, 0);
% ejes externos
addto f0 doublepath (-c3/2, -c4/2)--(c3/2, -c4/2)--(c3/2, c4/2)-- %
	(-c3/2, c4/2)--cycle;
% ejes centrados
for i = -c3/2, (c3/2 - c2) :
	for j = (c0 - c4/2) step c0 until (c4/2 - c0) :
		addto f0 doublepath r0 shifted (i, j);
	endfor
endfor
for i = -c4/2, (c4/2 - c2) :
	for j = (c0 - c3/2) step c0 until (c3/2 - c0):
		addto f0 doublepath r0 rotated 90 shifted (j, i);
	endfor
endfor

% ··································································
% cuadrícula punteada
for i = (c0 - c4/2) step c0 until -c0 :
	addto f0 doublepath r1 shifted (0, i);
	for j = (c1 - c3/2) step c1 until -c1 :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (j, i);
	endfor
	for j = c1 step c1 until (c3/2 - c1) :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (j, i);
	endfor
endfor
for i = (c0 - c3/2) step c0 until -c0 :
	addto f0 doublepath r1 rotated 90 shifted (i, 0);
	for j = (c1 - c4/2) step c1 until -c1 :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (i, j);
	endfor
	for j = c1 step c1 until (c4/2 - c1) :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (i, j);
	endfor
endfor
for i = c0 step c0 until (c4/2 - c0) :
	addto f0 doublepath r1 shifted (0, i);
	for j = (c1 - c3/2) step c1 until -c1 :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (j, i);
	endfor
	for j = c1 step c1 until (c3/2 - c1) :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (j, i);
	endfor
endfor
for i = c0 step c0 until (c3/2 - c0) :
	addto f0 doublepath r1 rotated 90 shifted (i, 0);
	for j = (c1 - c4/2) step c1 until -c1 :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (i, j);
	endfor
	for j = c1 step c1 until (c4/2 - c1) :
		addto f1 contour makepath(n1 scaled (1/escala)) %
			shifted (i, j);
	endfor
endfor
% punto central
addto f1 contour makepath(n1 scaled (1/escala)) shifted (0, 0);

% ··································································
% marcos o ventanas externas
c5 = 3c0;			c6 = c3/2 + c5;
c7 = c4/2 + c5;			c8 = c6 + c0/2;
c9 = c7 + c0/2;
r2 = (-c6, -c7)--(c6, -c7)--(c6, c7)--(-c6, c7)--cycle;
r3 = (-c6, -c9)--(c6, -c9){right}..{up}(c8, -c7)--(c8, c7){up}.. %
	{left}(c6, c9)--(-c6, c9){left}..{down}(-c8, c7)-- %
	(-c8, -c7){down}..{right}cycle;
addto f2 contour r3;
addto f2 contour r2 withcolor white;

% ··································································
% cierro la definición
addto f3 also f2 scaled escala shifted desplazamiento withpen n0;
addto f3 also f0 scaled escala shifted desplazamiento withpen n1;
addto f3 also f1 scaled escala shifted desplazamiento;
(f3)
endgroup

enddef;
% ==================================================================



% ==================================================================
def transductor(expr escala) =
begingroup
save c,n,f,r,x,y;
numeric c[],x[],y[]; pen n[]; picture f[]; path r[];
interim bboxmargin := 0;
n0 = pencircle scaled 0.15u;
n1 = pencircle scaled 0.25u;
n2 = pencircle scaled 0.35u;
n3 = pencircle scaled 0.5u;
f0 = nullpicture;
f1 = nullpicture;
f2 = nullpicture;
f3 = nullpicture;
f4 = nullpicture;
f5 = nullpicture;
f6 = nullpicture;

% ··································································
% agarre
% dimensiones de las barras
c00 = v;		c01 = v;
z00 = 1/2(-c00, -c01);	z01 = 1/2(c00, -c01);	
z02 = 1/2(c00, c01);	z03 = 1/2(-c00, c01);	
r0 = z00--z02;		r1 = z01--z03;
% dimensiones del agarre y separación entre barras
c02 = 3u;	c03 = v;	c04 = u;
c05 = u/50;	% Espacio adicional para el corte
z04 = 1/2(-c02, -c03);	z05 = 1/2(c02 - c05, -c03);
z06 = 1/2(c02 - c05, c03);	z07 = 1/2(-c02, c03);
r3 = z04--z05--z06--z07--cycle;
for i = -1 upto c03/c04 + 1:
	addto f0 doublepath r0 shifted (0, i*c04 - c03/2);
	addto f0 doublepath r1 shifted (0, i*c04 - c03/2);
endfor
clip f0 to r3;

% ··································································
% contorno del transistor
% dimensiones del transistor
c06 = v;				c07 = 4c02;
z08 = (-c07/2, -7c06/20);		z14 = (x08, -y08);
z09 = (-c07/3, -9c06/20);		z15 = (x09, -y09);
z10 = (c07/6, -c06/2);			z16 = (x10, -y10);
z11 = (x10 + c02, -c06/2);		z17 = (x11, -y11);
z12 = (x11 + c07/12, -9c06/20);		z18 = (x12, -y12);
% pista No 1: c07/6 = 2c07/12, -3c06/8 = -15c06/40
z13 = (x11 + c07/6, -3c06/8);	z19 = (x13, -y13);
r4 = z08{down}..z09..{dir 340}z10--z11--z12{up}..{up}z18--z17--%
    z16{dir 200}..z15..z14{down}--cycle;
r5 = z12..z13--z19..z18--cycle;

% ··································································
% tornillo
% dimensiones e inclinación de las barras
c08 = 8u;			c09 = 75;
r6 = (-c08/2, 0)--(c08/2, 0);	r6 := r6 rotated c09;
% dimensiones del tornillo (alto, ancho, separación entre barras y
% offset)
c10 = c08/3;	c11 = 2.5u;	c12 = 1.25u;	c13 = c11/5;
for i = 0 upto c11/c12:
	addto f1 doublepath r6 shifted (i*c12 - c11/2, 0);
endfor
z20 = 1/2(-3c13 - c11, c13/5 - c10);	z21 = (-x20, y20);
z22 = -z20;				z23 = (x20, -y20);
r7 = z20.. %
	for i=0 upto c11/c12: %
		{dir 295}(i*c12 + x20 + 3c13/4, -c10/2){dir 25}.. % 
	endfor %
	z21--z22{dir 205}.. %
	for i=c11/c12 - 1 downto -1: %
		{dir 75}(i*c12 + 3c13/4, c10/2){dir 205}.. %
	endfor %
	z23--cycle;
clip f1 to r7;

% ··································································
% transductor completo
f0 := f0 shifted (x10 + (x11 - x10)/2, 0);
f1 := f1 shifted (-c07/2 - c11/20, 0);
r7 := r7 shifted (-c07/2 - c11/20, 0);
r5 := r5 shifted (-u/2, 0);
addto f5 contour r7 withcolor white;
addto f2 also f1;
addto f2 doublepath r7;
addto f3 contour r5; % withcolor 0.6white;
addto f3 contour r4 withcolor white;
addto f4 doublepath r4;
addto f6 also f5 scaled escala withpen n0;
addto f6 also f2 scaled escala withpen n1;
addto f6 also f3 scaled escala withpen n0;
addto f6 also f0 scaled escala withpen n0;
addto f6 also f4 scaled escala withpen n1;
(f6)
endgroup

enddef;
% ==================================================================
