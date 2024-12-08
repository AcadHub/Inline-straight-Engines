% Thermal Efficiency and Heat Loss in Inline Engine

% This code is inspired by a article on inline straight engines at https://www.academicblock.com/technology/car-engine-technology/inline-straight-engines

% Input parameters (user-defined or constant values)
engine_temperature = input('Enter the engine temperature (in Kelvin): '); % Temperature of the engine (T)
fuel_energy_content = input('Enter the fuel energy content (in J/kg): '); % Energy content of the fuel (J/kg)
fuel_mass_flow_rate = input('Enter the fuel mass flow rate (in kg/s): '); % Fuel mass flow rate (kg/s)
combustion_efficiency = input('Enter the combustion efficiency (between 0 and 1): '); % Combustion efficiency (0-1)
ambient_temperature = input('Enter the ambient temperature (in Kelvin): '); % Ambient temperature (T_ambient)

% Constants (example values for air and fuel)
specific_heat_capacity = 1005; % Specific heat capacity of air (J/kg·K)
heat_capacity_ratio = 1.4; % Ratio of specific heats for air (gamma)
gas_constant = 287; % Gas constant for air (J/kg·K)

% Heat input (from fuel)
heat_input = fuel_mass_flow_rate * fuel_energy_content; % Total heat input from fuel (J/s)

% Ideal thermal efficiency (Carnot efficiency)
% Based on the Carnot efficiency formula: eta = 1 - T_ambient / T_engine
thermal_efficiency_ideal = 1 - ambient_temperature / engine_temperature;

% Actual thermal efficiency considering combustion efficiency
thermal_efficiency_actual = thermal_efficiency_ideal * combustion_efficiency;

% Calculate heat loss to the environment (heat not converted to useful work)
heat_loss = (1 - thermal_efficiency_actual) * heat_input;

% Display results
fprintf('\nThermal Efficiency of the Engine:\n');
fprintf('--------------------------------\n');
fprintf('Ideal Thermal Efficiency: %.2f%%\n', thermal_efficiency_ideal * 100);
fprintf('Actual Thermal Efficiency: %.2f%%\n', thermal_efficiency_actual * 100);

fprintf('\nHeat Loss:\n');
fprintf('-----------\n');
fprintf('Total Heat Loss to Environment: %.2f W (J/s)\n', heat_loss);

% Plotting heat flow and efficiency
% Create a figure to visualize the efficiency and heat flow
figure;

% Heat flow (input, useful work, and loss)
subplot(2, 1, 1);
bar([heat_input, heat_input * thermal_efficiency_actual, heat_loss], 'FaceColor', [0.2 0.6 0.2]);
set(gca, 'xticklabel', {'Heat Input', 'Useful Work (Output)', 'Heat Loss'});
title('Heat Flow in Inline Engine');
ylabel('Heat (J/s)');
grid on;

% Efficiency comparison (Ideal vs Actual)
subplot(2, 1, 2);
bar([thermal_efficiency_ideal, thermal_efficiency_actual] * 100, 'FaceColor', [0.8 0.2 0.2]);
set(gca, 'xticklabel', {'Ideal Efficiency', 'Actual Efficiency'});
title('Efficiency Comparison');
ylabel('Efficiency (%)');
grid on;

