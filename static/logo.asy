import unicode;
import roundedpath;

pen  BACKGROUND = white; // background color
real DIM        = 2;     // rectangle size
real ROUND      = .1;    // rounding of the corners
real BORDER     = .05;   // border of letters
real SHADOW     = .2;    // amount of shadow outside the rectangle
real DELTA      = .11;   // amount of shadow inside the rectangle
real SEP        = .2;    // amount of space between letters
real EPS        = 0.005; // amount of overlapping of the circular shadows (to prevent empty lines)

unitsize(10cm);

// rectangle
path rect(pair c, real w, real h) {
	return c -- (c.x + w, c.y) -- (c.x + w, c.y + h) -- (c.x, c.y + h) -- cycle;
}

// rectangle with rounded corners
path rrect(pair c, real w, real h, real rc) {
	return roundedpath(rect(c, w, h), rc);
}

// quarter-circular shade, with center and radius
void shade_corner(pair c, real r, int dir, pen pena = black, pen penb = BACKGROUND) {
	path brect;
	if (dir == 0) // NW
		brect = rect(c, r, -r);
	else if (dir == 1) // NE
		brect = rect(c, -r, -r);
	else if (dir == 2) // SE
		brect = rect(c, -r, r);
	else if (dir == 3) // SW
		brect = rect(c, r, r);

	radialshade(brect,
		pena, c, 0,
		penb, c, r
	);
}

// lateral shade
void shade_side(pair a, pair b, real r, pen pena = black, pen penb = BACKGROUND) {
	path brect = shift(a) * rotate(-Degrees(atan2(b.x-a.x, b.y-a.y))) * rect((0,0), r, length(a - b));
	pair c = shift(a) * rotate(-Degrees(atan2(b.x-a.x, b.y-a.y))) * (r, 0);

	axialshade(brect,
		pena, a,
		penb, c
	);
}

// rounded rectangular shade, with rounding delta
void shading_rect(pair c, real w, real h, real delta, pen pena = black, pen penb = BACKGROUND) {
	shade_side(
		c + (0, 0),
		c + (w, 0),
		delta,

		pena, penb
	);
	shade_side(
		c + (w, 0),
		c + (w, h),
		delta,

		pena, penb
	);
	shade_side(
		c + (w, h),
		c + (0, h),
		delta,

		pena, penb
	);
	shade_side(
		c + (0, h),
		c + (0, 0),
		delta,

		pena, penb
	);

	shade_corner(c + (0, 0) + (EPS, EPS), delta + EPS, 1, pena, penb);
	shade_corner(c + (w, 0) + (-EPS, EPS), delta + EPS, 0, pena, penb);
	shade_corner(c + (w, h) + (-EPS, -EPS), delta + EPS, 3, pena, penb);
	shade_corner(c + (0, h) + (EPS, -EPS), delta + EPS, 2, pena, penb);
}

path   F = shift(-0.2,0) * ((0,-0.5) -- (0.75,-0.5) -- (0.75,0) -- (0,0) -- (0,0.5) -- (1,0.5) -- (1,1) -- (-0.5,1) -- (-0.5,-1) -- (0,-1) -- cycle);
path   C = shift(0.1,0) * (arc((0,0), 1, 30, 330) -- arc((0,0), 0.5, 330, 30) -- cycle);
path[] P = shift(-0.2,0) * ((xscale(1.25)*arc((0,0.2), 0.8, -90, 90) -- (-0.5,1) -- (-0.5,-1) -- (0,-1) -- cycle) ^^ (xscale(1.7)*arc((0,0.2), 0.3, 90, -90) -- cycle));


// draw a letter
void make_letter(pair c, string s, pen bg = gray(.6), pen f = Palatino(), pen fg = white, pen sh = gray(.4), pen pena = gray(.3), pen penb = BACKGROUND) {
    c = c * (SEP+DIM);
	path p = rrect(c, DIM, DIM, ROUND);
	shading_rect(c + (SHADOW + DELTA, DELTA), DIM - SHADOW - 2*DELTA, DIM - SHADOW - 2*DELTA, SHADOW+DELTA, pena, penb);
	fill(p, bg);

    if (s == "F") filldraw(shift(c + (DIM,DIM)/2) * scale(0.86) * F, fg, sh+15);
    if (s == "C") filldraw(shift(c + (DIM,DIM)/2) * scale(0.86) * C, fg, sh+15);
    if (s == "P") filldraw(shift(c + (DIM,DIM)/2) * scale(0.86) * P, fg, sh+15);
}

// draw letters background
void background(int xsize, int ysize, pen bg = BACKGROUND) {
    fill(rect((-SHADOW,-SHADOW), (SEP+DIM)*(xsize-1)+DIM+2*SHADOW, (SEP+DIM)*(ysize-1)+DIM+2*SHADOW), bg);
}


background(2, 2);
make_letter((0,1), "F",
    bg = rgb("4FBBFF"),
    pena = rgb("275D7F"),
    sh = rgb("3B8CBF"));
make_letter((1,1), "C",
    bg = rgb("528DFF"),
    pena = rgb("29467F"),
    sh = rgb("3E6ABF"));
make_letter((0,0), "P",
    bg = rgb("528DFF"),
    pena = rgb("29467F"),
    sh = rgb("3E6ABF"));
make_letter((1,0), "P",
    bg = rgb("5660FF"),
    pena = rgb("2B307F"),
    sh = rgb("4148BF"));
