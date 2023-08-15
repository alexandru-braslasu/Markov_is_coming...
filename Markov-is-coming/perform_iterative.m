## Copyright (C) 2023 Alexandru Braslasu
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} perform_iterative (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-20

function  [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  steps = 0;
  [n m] = size(G);
  y = size(n, 3);
  err = tol + 10;
  x = x0;
  while (steps < max_steps && err > tol)
    ++steps;
    err = 0;
    sum = G * x;
    y = sum + c;
    err = norm(y - x);
    if (err > tol)
      x = y;
    endif
  endwhile
endfunction
