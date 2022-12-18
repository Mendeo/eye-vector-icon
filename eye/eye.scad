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

$fn = 100;

eyeWidth = 40;
eyeHeight = 20;
eyeThickness = 1;

PHI = (sqrt(5) + 1) / 2;

translate([0, -eyeHeight / 2])
parabola(eyeHeight / 2, eyeWidth, eyeThickness);
translate([0, eyeHeight / 2])
mirror([0, 1])
parabola(eyeHeight/ 2, eyeWidth, eyeThickness);


circle(d = eyeHeight / PHI);

difference()
{
	circle(d = eyeHeight);
	circle(d = eyeHeight - 2 * eyeThickness);
}


module parabola(h, w, t)
{
	k = 4 * h / (w * w);
	wExtra = sqrt((h + t) / k); //На какую ширину нужно сделать параболу, чтобы высота увеличилась на t.
	dx = wExtra * 2 / $fn;
	points = [for (i = [0 : $fn]) let(x = -wExtra + i * dx, y = k * x * x) [x, y]];

	difference()
	{
		polygon(points);
		offset(delta = -1)
		polygon(points);
		translate([-wExtra, h])
		square([2 * wExtra, t + 1]);
	}
}
