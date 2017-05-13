close all;
clear all;
clc;
xvals = linspace(-0.30, -0.79, 1000); %x axis plane size
yvals = linspace(-0.40, -0.69, 1000); %y axis plane size
xlength = length(xvals); % length of the real component
ylength = length(yvals); % length of the imaginary component
fractal = zeros(xlength, ylength); % the final image array
                        % to store the iteration count
                        % that results in color

                        
for i=1:xlength 
    for j=1:ylength % iterate through the components
        x = xvals(i); % pick a real value
        y = yvals(j); % pick an imaginary value
        complex_no = complex(x, y); % create a complex number
        fractal(i,j)=mbrot(complex_no,100);
                    % and check it for convergence/divergence
    end
end


image(fractal.') % show the fractal. the ' transposes the array
    % without it the image will display sideways
    % so its just for convenience
colormap(pink)

function itercount = mbrot(complex_no, max)
    z = complex(0,0); % initialize z = 0+0i
    for itercount=1:max % iterate till max no of iterations
        z = (z*z)+complex_no; % z squared + c
        if abs(z) > 4 % if absolute value is greater than 4
            break % exit loop else continue till you reach 
                  % the max no. of iterations
        end       % then return the iterations reached
                   % in case the z diverges, then iteration
                  % count will be less than max
                  % whereas if it does not diverage, iteration
                  % count will be equal to max.
    end
end



