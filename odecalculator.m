function [tspan, x,u] = odecalculator(A,B,T,t_0,t_i, W, g, x_0, x_1, delta_T)

% The function odecaluculator calculates the dynamics (4) with the delta_T
% time step. 
tspan = [t_0:delta_T:T];
x = [x_0'];
x_k_1 = x_0;
u_k_1 = u_opt(A, B, T, t_0, t_i, W, g, x_0, x_1);
u = [];
for i = 1:length(tspan)
    x_k = (A*x_k_1 + B*u_k_1 + W*g)*delta_T + x_k_1;
    x = [x; x_k'];
    u = [u; u_k_1];
    x_k_1 = x(length(x),:)';
    u_k_1 = u_opt(A, B, T, t_0, tspan(i), W, g, x_0, x_1);
end

x(length(x),:) = [];

end