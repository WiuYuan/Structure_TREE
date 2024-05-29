function plot_status(status)
x = status.x;
y = status.y;
N = status.N;
s = status.sigma;
L = status.L;
figure;
hold on
axis off
axis equal
rectangle('Position', [0, 0, L, L]);
for i = 1: N
    rectangle('Position', [x(i)-s/2, y(i)-s/2, s, s], ...
        'Curvature', [1, 1]);
end
hold off
end

