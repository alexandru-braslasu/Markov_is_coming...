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
## @deftypefn {} {@var{retval} =} get_adjacency_matrix (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-20

function [Adj] = get_adjacency_matrix (Labyrinth)
  [n m] = size(Labyrinth);
  Adj = sparse(n * m + 2, n * m + 2);
  Adj(n * m + 1, n * m + 1) = 1;
  Adj(n * m + 2, n * m + 2) = 1;
  for i = 1 : n
    for j = 1 : m
      x = Labyrinth(i, j);
      poz = (i - 1) * m + j;
      up = (i - 2) * m + j;
      down = i * m + j;
      left = (i - 1) * m + j - 1;
      right = (i - 1) * m + j + 1;
      if (i == 1)
        up = n * m + 1;
      elseif (i == n)
        down = n * m + 1;
      elseif (j == 1)
        left = n * m + 2;
      elseif (j == m)
        right = n * m + 2;
      endif
      if (i == 1 && j == 1)
        up = n * m + 1;
        left = n * m + 2;
      elseif (i == 1 && j == m)
        up = n * m + 1;
        right = n * m + 2;
      elseif (i == n && j == 1)
        down = n * m + 1;
        left = n * m + 2;
      elseif (i == n && j == m)
        down = n * m + 1;
        right = n * m + 2;
      endif
      if (bitand(bitshift(1, 3), x) == 0)
        Adj(poz, up) = 1;
      endif
      if (bitand(bitshift(1, 2), x) == 0)
        Adj(poz, down) = 1;
      endif
      if (bitand(bitshift(1, 1), x) == 0)
        Adj(poz, right) = 1;
      endif
      if (bitand(bitshift(1, 0), x) == 0)
        Adj(poz, left) = 1;
      endif
    endfor
  endfor
endfunction
