/*
The MIT License (MIT)
Copyright (c) Aleksandr Meniailo, Mendeo 2022 (thesolve@mail.ru, deorathemen@gmail.com)
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

iconWidth = 40;
squareHeight = 20;
iconThickness = 3;

PHI = (sqrt(5) + 1) / 2;

translate([-iconWidth / 2, 0])
square([iconWidth, iconThickness]);

translate([-iconWidth / 2, 0])
square([iconThickness, squareHeight]);

translate([iconWidth / 2 - iconThickness, 0])
square([iconThickness, squareHeight]);

translate([0, squareHeight / PHI])
arrow();

module arrow()
{
	hArrowStand = squareHeight / PHI;
	translate([-iconThickness, 0])
	square([iconThickness * 2, hArrowStand]);

	translate([0, hArrowStand])
	triangle(iconThickness * 4);
}

module triangle(width)
{
	polygon([[-width / 2, 0], [width / 2, 0], [0, sqrt(3) * width / 2]]);
}