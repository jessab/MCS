


sq(1000).
idpd_polygon(4, field, 0, 0, 15*S, 0, 15*S, 14*S, 0, 14*S) :- sq(S).
idpd_xpos(field, -S) :- sq(S).
idpd_ypos(field, -12*S) :- sq(S).
idpd_color(field, 200, 200, 200).
idpd_depth(field, 15).


idpd_image(player, monddichtl, S-50, S-50) :- position(p, X, Y), sq(S).
idpd_xpos( player, X*S+25) :- position( p, X, Y), sq(S).
idpd_ypos( player, -(Y*S)+25) :- position( p, X, Y), sq(S).
idpd_depth( player, 7) :- position( p, X, Y).

drawghost(G,S,X,Y) :- position( G, X, Y), sq(S), not pacmansymbol(G).
idpd_image( G, G, S-50, S-50) :- drawghost(G,S,X,Y).
idpd_xpos( G, X*S+25) :- drawghost(G,S,X,Y).
idpd_ypos( G, -(Y*S)+25) :- drawghost(G,S,X,Y).
idpd_depth( G, 5) :- drawghost(G,S,X,Y).

pacmansymbol(p).


idpd_ellipse(gold, X, Y, S/5, S/2) :- gold(X,Y), sq(S).
idpd_xpos( gold, X, Y, X*S+S/3) :- gold(X,Y), sq(S).
idpd_ypos( gold, X, Y, -(Y*S-S/5)) :- gold(X,Y), sq(S).
idpd_color( gold, X, Y, 167, 136, 47) :- gold(X,Y).
idpd_depth( gold, X, Y, 9) :- gold(X,Y).


square(X,Y) :- xco(X), yco(Y), not nopos(X,Y).
idpd_polygon(4, square, X, Y, 0, 0, 0, S, S, S, S, 0) :- square(X, Y), sq(S).
idpd_xpos(square, X, Y, X*S) :- square(X, Y), sq(S).
idpd_ypos(square, X, Y, -Y*S) :- square(X, Y), sq(S).
idpd_pencolor(square, X, Y, 158, 173, 107) :- square(X, Y).
idpd_color(square, X, Y, 158, 210, 107) :- square(X, Y).
idpd_depth(square, X, Y, 10) :- square(X, Y).


idpd_depth(wall, X, Y, D, 5):- wall(X, Y, D).
idpd_color(wall, X, Y, D, 0, 0, 255):- wall(X, Y, D).

idpd_polygon(2, wall, X, Y, l, 0,0,0,S) :- wall(X, Y, l), sq(S).
idpd_xpos(wall, X, Y, l, X*S) :- wall(X, Y, l), sq(S).
idpd_ypos(wall, X, Y, l, -Y*S) :- wall(X, Y, l), sq(S).

idpd_polygon(2, wall, X, Y, r, 0,0,0,S) :- wall(X, Y, r), sq(S).
idpd_xpos(wall, X, Y, r, (X+1)*S) :- wall(X, Y, r), sq(S).
idpd_ypos(wall, X, Y, r, -Y*S) :- wall(X, Y, r), sq(S).

idpd_polygon(2, wall, X, Y, d, 0,0,S,0) :- wall(X, Y, d), sq(S).
idpd_xpos(wall, X, Y, d, X*S) :- wall(X, Y, d), sq(S).
idpd_ypos(wall, X, Y, d, -(Y-1)*S) :- wall(X, Y, d), sq(S).

idpd_polygon(2, wall, X, Y, u, 0,0,S,0) :- wall(X, Y, u), sq(S).
idpd_xpos(wall, X, Y, u, X*S) :- wall(X, Y, u), sq(S).
idpd_ypos(wall, X, Y, u, -Y*S) :- wall(X, Y, u), sq(S).


