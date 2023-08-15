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
## @deftypefn {} {@var{retval} =} get_Jacobi_parameters (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-20

function [G, c] = get_Jacobi_parameters (Link)
  [n m] = size(Link);
  G = sparse(n - 2, m - 2);
  for i = 1 : (n - 2)
    for j = 1 : (m - 2)
      G(i, j) = Link(i, j);
    endfor
  endfor
  c = sparse(n - 2, 1);
  for i = 1 : (n - 2)
    c(i, 1) = Link(i, m - 1);
  endfor
endfunction
