% Visual Dice Roller Simulator
clear; clc; close all;

fprintf('--- Welcome to the Visual Dice Roller! ---\n');

% 1. Ask the user how many times they want to roll the die
rolls = input('Enter the number of times to roll the die (e.g., 1000): ');

% Check for valid input
if isempty(rolls) || rolls <= 0
    fprintf('Invalid number. Defaulting to 1000 rolls.\n');
    rolls = 1000;
end

% 2. Simulate rolling a 6-sided die
% randi([1, 6], rolls, 1) generates an array of random integers between 1 and 6
results = randi([1, 6], rolls, 1);

% 3. Count how many times each face (1 to 6) appeared
counts = zeros(1, 6);
for face = 1:6
    counts(face) = sum(results == face);
end

% 4. Print the text results in the terminal
fprintf('\n--- Results Summary ---\n');
for face = 1:6
    percentage = (counts(face) / rolls) * 100;
    fprintf('Face %d: %d times (%.2f%%)\n', face, counts(face), percentage);
end

% 5. Create the Visual Bar Chart
figure('Name', 'Dice Roller Statistics');
bar(1:6, counts, 'FaceColor', [0.2 0.6 0.8], 'EdgeColor', [0 0.2 0.4]);

% Customize the chart appearance
grid on;
title(sprintf('Distribution of %d Random Dice Rolls', rolls), 'FontSize', 12);
xlabel('Dice Face', 'FontSize', 10);
ylabel('Number of Times Rolled', 'FontSize', 10);
set(gca, 'XTick', 1:6); % Ensure x-axis only shows integers 1 through 6
