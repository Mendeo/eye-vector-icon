/*
The MIT License (MIT)

Copyright (c) Aleksandr Meniailo, Mendeo 2024 (thesolve@mail.ru, deorathemen@gmail.com)

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

$fn=36;
nRays = 8;
size = 50;
sunR = size * 0.5;

circle(r = sunR);

difference()
{
	for (i = [0 : nRays - 1])
	{
		rotate([0, 0, 360 * i / nRays])
		ray(size);
	}
	circle(r = sunR + size * 0.1);
}

module ray(ll)
{
	ww = ll / 5;
	translate([0, -ww * 0.5])
	square([ll - ww * 0.5, ww]);
	translate([ll - ww * 0.5, 0])
	circle(d = ww);
}
