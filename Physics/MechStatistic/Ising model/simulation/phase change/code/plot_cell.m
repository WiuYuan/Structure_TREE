function plot_cell(x, y, d, color)
xx = [x, x, x+d, x+d];
yy = [y, y+d, y+d, y];
fill(xx, yy, color);
end