


sq(1000).
idpd_polygon(4, field, 0, 0, 14*S, 0, 14*S, 9*S, 0, 9*S) :- sq(S).
idpd_xpos(field, -S) :- sq(S).
idpd_ypos(field, -8*S) :- sq(S).
idpd_color(field, 200, 200, 200).
idpd_depth(field, 15).


idpd_polygon(4, score, 0, 0, 4*S, 0, 4*S, S, 0, S) :- sq(S).
idpd_xpos(score, -S) :- sq(S).
idpd_ypos(score, -8*S) :- sq(S).
idpd_color(score, 158, 220, 107).
idpd_depth(score, 12).
idpd_text(score, "Score").
idpd_polygon(4, score2, 0, 0, 2*S, 0, 2*S, S, 0, S) :- sq(S).
idpd_xpos(score2, 3*S) :- sq(S).
idpd_ypos(score2, -8*S) :- sq(S).
idpd_color(score2, 158, 220, 107).
idpd_depth(score2, 12).
idpd_text_t(T, score2, X) :- score(T, X).

score(0,0).
score(T+1,S+1) :- time(T+1), score(T,S), position(T, p , X,Y),  gold(T,X,Y), not gold(T+1,X,Y). 
score(T+1,S) :-  time(T+1), score(T,S), position(T, p , X,Y), not gold(T,X,Y).
score(T+1,S) :-  time(T+1), score(T,S), position(T, p , X,Y), gold(T+1,X,Y).

idpd_image_t(T, player, monddichtl, S, S) :- position(T, p, X, Y), (T #mod 2) == 0, sq(S).
%idpd_image_t(T, player, monddichtl, S, S) :- position(T, p, X, Y), end(T2), T>T2, sq(S).
idpd_image_t(T, player, monddichtu, S, S) :- position(T, p, X, Y), (T #mod 2) == 0, sq(S), move(T-1,p, u).
idpd_image_t(T, player, mondopenu, S, S) :- position(T, p, X, Y), (T #mod 2) == 1, sq(S), move(T-1,p, u).
idpd_image_t(T, player, monddichtd, S, S) :- position(T, p, X, Y), (T #mod 2) == 0, sq(S), move(T-1,p, d).
idpd_image_t(T, player, mondopend, S, S) :- position(T, p, X, Y), (T #mod 2) == 1, sq(S), move(T-1,p, d).
idpd_image_t(T, player, monddichtr, S, S) :- position(T, p, X, Y), (T #mod 2) == 0, sq(S), move(T-1,p, r).
idpd_image_t(T, player, mondopenr, S, S) :- position(T, p, X, Y), (T #mod 2) == 1, sq(S), move(T-1,p, r).
idpd_image_t(T, player, monddichtl, S, S) :- position(T, p, X, Y), (T #mod 2) == 0, sq(S), move(T-1,p, l).
idpd_image_t(T, player, mondopenl, S, S) :- position(T, p, X, Y), (T #mod 2) == 1, sq(S), move(T-1,p, l).
idpd_xpos_t(T, player, X*S+1) :- position(T, p, X, Y), sq(S).
idpd_ypos_t(T, player, -(Y*S+1)) :- position(T, p, X, Y), sq(S).
idpd_depth_t(T, player, 7) :- position(T, p, X, Y).

drawghost(T,G,S,X,Y) :- position(T, G, X, Y), sq(S), not pacmansymbol(G).
idpd_image_t(T, G, G, S, S) :- drawghost(T,G,S,X,Y).
idpd_xpos_t(T, G, X*S+1) :- drawghost(T,G,S,X,Y).
idpd_ypos_t(T, G, -(Y*S+1)) :- drawghost(T,G,S,X,Y).
idpd_depth_t(T, G, 6) :- drawghost(T,G,S,X,Y).

pacmansymbol(p).


idpd_ellipse_t(T, gold, X, Y, S/5, S/2) :- gold(T,X,Y), sq(S).
idpd_xpos_t(T, gold, X, Y, X*S+S/3) :- gold(T,X,Y), sq(S).
idpd_ypos_t(T, gold, X, Y, -(Y*S-S/5)) :- gold(T,X,Y), sq(S).
idpd_color_t(T, gold, X, Y, 167, 136, 47) :- gold(T,X,Y).
idpd_depth_t(T, gold, X, Y, 9) :- gold(T,X,Y).


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


