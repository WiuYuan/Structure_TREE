function plot_lattice(status)
[m, n] = size(status);
figure;
hold on
axis off
for i = 1: m
    for j = 1: n
        if status(i, j) == 1
            plot_cell(i, j, 1, 'black');
        else
            plot_cell(i, j, 1, 'white');
        end
    end
end
hold off
end

