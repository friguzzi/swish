/*
Program for entity resolution: the task is to compute the probability that two
bibliographic citations refer to the same paper.
From
F. Riguzzi. Speeding up inference for probabilistic logic programs. 
The Computer Journal, 57(3):347-363, 2014
adapted from the Cora example in alchemy (http://alchemy.cs.washington.edu/).
The transitive clauses for samebib have been removed to avoid loops.
*/
/** <examples>

?- prob(samebib(class_7,class_8),Prob). % what is the probability that citations class_7 
% and class_8 refer to the same paper?
% expected result 0.4616412208109999
?- prob(samebib(class_7,class_8),Prob),bar_r(Prob). % what is the probability that citations class_7 
% and class_8 refer to the same paper?
% expected result 0.4616412208109999


*/
:- use_module(library(pita)).
:- use_module(library(cplint_r)).

:- pita.

:- begin_lpad.

samebib(B,C):0.3 :-
        author(B,D),author(C,E),sameauthor(D,E).
% citation B refers to same paper as C with probability 0.3 if their authors 
% are the same

samebib(B,C):0.3 :-
        title(B,D),title(C,E),sameatitle(D,E).
% citation B refers to same paper as C with probability 0.3 if their titles are 
% the same

samebib(B,C):0.3 :-
        venue(B,D),venue(C,E),samevenue(D,E).
% citation B refers to same paper as C with probability 0.3 if their venues are 
% the same

samevenue(A,B):0.3 :-
	haswordvenue(A,word_06),
	haswordvenue(B,word_06).
% A is the same venue as B with probability 0.3 if they both contain the word
% word_06

samevenue(A,B):0.3 :-
	haswordvenue(A,word_1),
	haswordvenue(B,word_1).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_10),
	haswordvenue(B,word_10).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_103),
	haswordvenue(B,word_103).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_11th),
	haswordvenue(B,word_11th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_12),
	haswordvenue(B,word_12).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_1208),
	haswordvenue(B,word_1208).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_121),
	haswordvenue(B,word_121).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_13),
	haswordvenue(B,word_13).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_13th),
	haswordvenue(B,word_13th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_14),
	haswordvenue(B,word_14).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_14th),
	haswordvenue(B,word_14th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_17),
	haswordvenue(B,word_17).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_19),
	haswordvenue(B,word_19).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_1987),
	haswordvenue(B,word_1987).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_1988),
	haswordvenue(B,word_1988).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_1989),
	haswordvenue(B,word_1989).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_1994),
	haswordvenue(B,word_1994).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_1996),
	haswordvenue(B,word_1996).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_19th),
	haswordvenue(B,word_19th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_1st),
	haswordvenue(B,word_1st).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_2),
	haswordvenue(B,word_2).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_20),
	haswordvenue(B,word_20).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_20th),
	haswordvenue(B,word_20th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_21),
	haswordvenue(B,word_21).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_21st),
	haswordvenue(B,word_21st).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_21th),
	haswordvenue(B,word_21th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_24th),
	haswordvenue(B,word_24th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_25),
	haswordvenue(B,word_25).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_26),
	haswordvenue(B,word_26).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_26th),
	haswordvenue(B,word_26th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_27),
	haswordvenue(B,word_27).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_28),
	haswordvenue(B,word_28).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_285),
	haswordvenue(B,word_285).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_28th),
	haswordvenue(B,word_28th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_295),
	haswordvenue(B,word_295).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_29th),
	haswordvenue(B,word_29th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_2nd),
	haswordvenue(B,word_2nd).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_3),
	haswordvenue(B,word_3).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_30th),
	haswordvenue(B,word_30th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_31st),
	haswordvenue(B,word_31st).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_33),
	haswordvenue(B,word_33).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_34),
	haswordvenue(B,word_34).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_341),
	haswordvenue(B,word_341).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_352),
	haswordvenue(B,word_352).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_36),
	haswordvenue(B,word_36).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_36th),
	haswordvenue(B,word_36th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_3rd),
	haswordvenue(B,word_3rd).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_4),
	haswordvenue(B,word_4).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_41),
	haswordvenue(B,word_41).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_413),
	haswordvenue(B,word_413).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_42),
	haswordvenue(B,word_42).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_43),
	haswordvenue(B,word_43).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_431),
	haswordvenue(B,word_431).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_433),
	haswordvenue(B,word_433).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_444),
	haswordvenue(B,word_444).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_48),
	haswordvenue(B,word_48).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_493),
	haswordvenue(B,word_493).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_4th),
	haswordvenue(B,word_4th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_5),
	haswordvenue(B,word_5).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_50),
	haswordvenue(B,word_50).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_53),
	haswordvenue(B,word_53).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_55),
	haswordvenue(B,word_55).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_57),
	haswordvenue(B,word_57).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_5rd),
	haswordvenue(B,word_5rd).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_5th),
	haswordvenue(B,word_5th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_61),
	haswordvenue(B,word_61).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_62),
	haswordvenue(B,word_62).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_6th),
	haswordvenue(B,word_6th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_7),
	haswordvenue(B,word_7).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_74),
	haswordvenue(B,word_74).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_7th),
	haswordvenue(B,word_7th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_8),
	haswordvenue(B,word_8).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_82),
	haswordvenue(B,word_82).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_87),
	haswordvenue(B,word_87).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_88),
	haswordvenue(B,word_88).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_89),
	haswordvenue(B,word_89).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_8th),
	haswordvenue(B,word_8th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_90),
	haswordvenue(B,word_90).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_91),
	haswordvenue(B,word_91).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_912919),
	haswordvenue(B,word_912919).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_92),
	haswordvenue(B,word_92).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_93),
	haswordvenue(B,word_93).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_94),
	haswordvenue(B,word_94).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_95),
	haswordvenue(B,word_95).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_96),
	haswordvenue(B,word_96).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_97),
	haswordvenue(B,word_97).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_9th),
	haswordvenue(B,word_9th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_a),
	haswordvenue(B,word_a).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_aaai),
	haswordvenue(B,word_aaai).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_an),
	haswordvenue(B,word_an).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_annals),
	haswordvenue(B,word_annals).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_art),
	haswordvenue(B,word_art).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_artificial),
	haswordvenue(B,word_artificial).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_by),
	haswordvenue(B,word_by).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_c),
	haswordvenue(B,word_c).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_chicago),
	haswordvenue(B,word_chicago).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_chp),
	haswordvenue(B,word_chp).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_colt),
	haswordvenue(B,word_colt).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_control),
	haswordvenue(B,word_control).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_crl),
	haswordvenue(B,word_crl).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_crypto),
	haswordvenue(B,word_crypto).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_denver),
	haswordvenue(B,word_denver).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_development),
	haswordvenue(B,word_development).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_dissertation),
	haswordvenue(B,word_dissertation).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_doctoral),
	haswordvenue(B,word_doctoral).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_e),
	haswordvenue(B,word_e).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_ecml),
	haswordvenue(B,word_ecml).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_eighth),
	haswordvenue(B,word_eighth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_eleventh),
	haswordvenue(B,word_eleventh).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_ence),
	haswordvenue(B,word_ence).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_extended),
	haswordvenue(B,word_extended).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_fifth),
	haswordvenue(B,word_fifth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_first),
	haswordvenue(B,word_first).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_focs),
	haswordvenue(B,word_focs).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_forthcoming),
	haswordvenue(B,word_forthcoming).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_fourteenth),
	haswordvenue(B,word_fourteenth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_francisco),
	haswordvenue(B,word_francisco).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_from),
	haswordvenue(B,word_from).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_hanson),
	haswordvenue(B,word_hanson).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_he),
	haswordvenue(B,word_he).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_i),
	haswordvenue(B,word_i).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_icml),
	haswordvenue(B,word_icml).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_ieee),
	haswordvenue(B,word_ieee).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_ietf),
	haswordvenue(B,word_ietf).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_ima),
	haswordvenue(B,word_ima).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_inform),
	haswordvenue(B,word_inform).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_institute),
	haswordvenue(B,word_institute).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_its),
	haswordvenue(B,word_its).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_iv),
	haswordvenue(B,word_iv).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_j),
	haswordvenue(B,word_j).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_jcss),
	haswordvenue(B,word_jcss).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_kaufmann),
	haswordvenue(B,word_kaufmann).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_langley),
	haswordvenue(B,word_langley).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_lcs),
	haswordvenue(B,word_lcs).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_lecture),
	haswordvenue(B,word_lecture).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_lippmann),
	haswordvenue(B,word_lippmann).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_m),
	haswordvenue(B,word_m).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_macro),
	haswordvenue(B,word_macro).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_manuscript),
	haswordvenue(B,word_manuscript).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_mar),
	haswordvenue(B,word_mar).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_masters),
	haswordvenue(B,word_masters).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_mit),
	haswordvenue(B,word_mit).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_ml),
	haswordvenue(B,word_ml).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_moody),
	haswordvenue(B,word_moody).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_morgan),
	haswordvenue(B,word_morgan).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_national),
	haswordvenue(B,word_national).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_neural),
	haswordvenue(B,word_neural).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_new),
	haswordvenue(B,word_new).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_nineteenth),
	haswordvenue(B,word_nineteenth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_nips),
	haswordvenue(B,word_nips).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_nips92),
	haswordvenue(B,word_nips92).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_notes),
	haswordvenue(B,word_notes).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_number),
	haswordvenue(B,word_number).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_october),
	haswordvenue(B,word_october).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_p),
	haswordvenue(B,word_p).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_pages),
	haswordvenue(B,word_pages).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_pattern),
	haswordvenue(B,word_pattern).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_phd),
	haswordvenue(B,word_phd).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_pos),
	haswordvenue(B,word_pos).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_pp),
	haswordvenue(B,word_pp).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_pre),
	haswordvenue(B,word_pre).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_preprint),
	haswordvenue(B,word_preprint).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_press),
	haswordvenue(B,word_press).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_progress),
	haswordvenue(B,word_progress).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_puting),
	haswordvenue(B,word_puting).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_r),
	haswordvenue(B,word_r).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_rep),
	haswordvenue(B,word_rep).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_retrieval),
	haswordvenue(B,word_retrieval).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_s),
	haswordvenue(B,word_s).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_san),
	haswordvenue(B,word_san).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_seventh),
	haswordvenue(B,word_seventh).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_siam),
	haswordvenue(B,word_siam).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_sigir),
	haswordvenue(B,word_sigir).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_simulation),
	haswordvenue(B,word_simulation).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_sixth),
	haswordvenue(B,word_sixth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_snowbird),
	haswordvenue(B,word_snowbird).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_st),
	haswordvenue(B,word_st).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_statistics),
	haswordvenue(B,word_statistics).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_stoc),
	haswordvenue(B,word_stoc).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_stpc),
	haswordvenue(B,word_stpc).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_systems),
	haswordvenue(B,word_systems).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_t),
	haswordvenue(B,word_t).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_technical),
	haswordvenue(B,word_technical).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_tenth),
	haswordvenue(B,word_tenth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_test),
	haswordvenue(B,word_test).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_th),
	haswordvenue(B,word_th).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_third),
	haswordvenue(B,word_third).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_thirtieth),
	haswordvenue(B,word_thirtieth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_tions),
	haswordvenue(B,word_tions).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_tm),
	haswordvenue(B,word_tm).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_to),
	haswordvenue(B,word_to).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_tr),
	haswordvenue(B,word_tr).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_twentieth),
	haswordvenue(B,word_twentieth).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_ucsc),
	haswordvenue(B,word_ucsc).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_vol),
	haswordvenue(B,word_vol).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_volume),
	haswordvenue(B,word_volume).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_winter),
	haswordvenue(B,word_winter).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_work),
	haswordvenue(B,word_work).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_works),
	haswordvenue(B,word_works).
samevenue(A,B):0.3 :-
	haswordvenue(A,word_workshop),
	haswordvenue(B,word_workshop).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_a),
	haswordauthor(B,word_a).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_andrzej),
	haswordauthor(B,word_andrzej).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_auer),
	haswordauthor(B,word_auer).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_avrim),
	haswordauthor(B,word_avrim).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_bauer),
	haswordauthor(B,word_bauer).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_bianchi),
	haswordauthor(B,word_bianchi).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_blum),
	haswordauthor(B,word_blum).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_cesa),
	haswordauthor(B,word_cesa).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_cohen),
	haswordauthor(B,word_cohen).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_d),
	haswordauthor(B,word_d).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_david),
	haswordauthor(B,word_david).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_dietterich),
	haswordauthor(B,word_dietterich).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_druker),
	haswordauthor(B,word_druker).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_e),
	haswordauthor(B,word_e).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_ehrenfeucht),
	haswordauthor(B,word_ehrenfeucht).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_eric),
	haswordauthor(B,word_eric).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_feder),
	haswordauthor(B,word_feder).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_freund),
	haswordauthor(B,word_freund).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_fyoav),
	haswordauthor(B,word_fyoav).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_g),
	haswordauthor(B,word_g).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_goldman),
	haswordauthor(B,word_goldman).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_h),
	haswordauthor(B,word_h).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_harris),
	haswordauthor(B,word_harris).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_haussler),
	haswordauthor(B,word_haussler).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_helmbold),
	haswordauthor(B,word_helmbold).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_henry),
	haswordauthor(B,word_henry).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_j),
	haswordauthor(B,word_j).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_kautz),
	haswordauthor(B,word_kautz).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_kearns),
	haswordauthor(B,word_kearns).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_l),
	haswordauthor(B,word_l).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_lewis),
	haswordauthor(B,word_lewis).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_littlestone),
	haswordauthor(B,word_littlestone).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_m),
	haswordauthor(B,word_m).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_micahel),
	haswordauthor(B,word_micahel).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_michael),
	haswordauthor(B,word_michael).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_n),
	haswordauthor(B,word_n).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_nicolo),
	haswordauthor(B,word_nicolo).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_p),
	haswordauthor(B,word_p).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_r),
	haswordauthor(B,word_r).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_rivest),
	haswordauthor(B,word_rivest).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_robert),
	haswordauthor(B,word_robert).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_ronald),
	haswordauthor(B,word_ronald).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_s),
	haswordauthor(B,word_s).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_sally),
	haswordauthor(B,word_sally).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_shapire),
	haswordauthor(B,word_shapire).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_t),
	haswordauthor(B,word_t).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_tom),
	haswordauthor(B,word_tom).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_v),
	haswordauthor(B,word_v).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_w),
	haswordauthor(B,word_w).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_william),
	haswordauthor(B,word_william).
sameauthor(A,B):0.3 :-
	haswordauthor(A,word_y),
	haswordauthor(B,word_y).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_10),
	haswordtitle(B,word_10).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_1321),
	haswordtitle(B,word_1321).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_197),
	haswordtitle(B,word_197).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_1987),
	haswordtitle(B,word_1987).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_1989),
	haswordtitle(B,word_1989).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_1996),
	haswordtitle(B,word_1996).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_1999),
	haswordtitle(B,word_1999).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_2),
	haswordtitle(B,word_2).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_227),
	haswordtitle(B,word_227).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_29),
	haswordtitle(B,word_29).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_5),
	haswordtitle(B,word_5).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_8),
	haswordtitle(B,word_8).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_94),
	haswordtitle(B,word_94).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_a),
	haswordtitle(B,word_a).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_adaptive),
	haswordtitle(B,word_adaptive).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_adversarial),
	haswordtitle(B,word_adversarial).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_adversaries),
	haswordtitle(B,word_adversaries).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_advice),
	haswordtitle(B,word_advice).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_against),
	haswordtitle(B,word_against).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_alence),
	haswordtitle(B,word_alence).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_algo),
	haswordtitle(B,word_algo).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_algorithm),
	haswordtitle(B,word_algorithm).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_algorithmic),
	haswordtitle(B,word_algorithmic).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_almost),
	haswordtitle(B,word_almost).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_alternative),
	haswordtitle(B,word_alternative).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_an),
	haswordtitle(B,word_an).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_applying),
	haswordtitle(B,word_applying).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_approach),
	haswordtitle(B,word_approach).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_approximations),
	haswordtitle(B,word_approximations).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_are),
	haswordtitle(B,word_are).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_armed),
	haswordtitle(B,word_armed).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_article),
	haswordtitle(B,word_article).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_as),
	haswordtitle(B,word_as).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_assignment),
	haswordtitle(B,word_assignment).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_at),
	haswordtitle(B,word_at).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_att),
	haswordtitle(B,word_att).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_au),
	haswordtitle(B,word_au).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_authors),
	haswordtitle(B,word_authors).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_available),
	haswordtitle(B,word_available).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_average),
	haswordtitle(B,word_average).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_awards),
	haswordtitle(B,word_awards).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_b),
	haswordtitle(B,word_b).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bandit),
	haswordtitle(B,word_bandit).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bart),
	haswordtitle(B,word_bart).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bartlett),
	haswordtitle(B,word_bartlett).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_based),
	haswordtitle(B,word_based).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bayesian),
	haswordtitle(B,word_bayesian).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_behavior),
	haswordtitle(B,word_behavior).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_best),
	haswordtitle(B,word_best).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_biased),
	haswordtitle(B,word_biased).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_binary),
	haswordtitle(B,word_binary).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bits),
	haswordtitle(B,word_bits).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_boost),
	haswordtitle(B,word_boost).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bound),
	haswordtitle(B,word_bound).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bounded),
	haswordtitle(B,word_bounded).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_bounds),
	haswordtitle(B,word_bounds).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_by),
	haswordtitle(B,word_by).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_c),
	haswordtitle(B,word_c).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_c4),
	haswordtitle(B,word_c4).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_case),
	haswordtitle(B,word_case).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_casino),
	haswordtitle(B,word_casino).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_cation),
	haswordtitle(B,word_cation).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_characteristic),
	haswordtitle(B,word_characteristic).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_check),
	haswordtitle(B,word_check).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_circuits),
	haswordtitle(B,word_circuits).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_classi),
	haswordtitle(B,word_classi).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_classification),
	haswordtitle(B,word_classification).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_codes),
	haswordtitle(B,word_codes).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_coin),
	haswordtitle(B,word_coin).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_colt),
	haswordtitle(B,word_colt).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_comittee),
	haswordtitle(B,word_comittee).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_comments),
	haswordtitle(B,word_comments).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_consequences),
	haswordtitle(B,word_consequences).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_convergence),
	haswordtitle(B,word_convergence).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_counting),
	haswordtitle(B,word_counting).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_criptographic),
	haswordtitle(B,word_criptographic).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_cross),
	haswordtitle(B,word_cross).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_curve),
	haswordtitle(B,word_curve).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_d),
	haswordtitle(B,word_d).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_data),
	haswordtitle(B,word_data).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_derstand),
	haswordtitle(B,word_derstand).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_design),
	haswordtitle(B,word_design).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_deterministic),
	haswordtitle(B,word_deterministic).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_discrete),
	haswordtitle(B,word_discrete).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_dissertation),
	haswordtitle(B,word_dissertation).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_distributed),
	haswordtitle(B,word_distributed).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_diversity),
	haswordtitle(B,word_diversity).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_dnf),
	haswordtitle(B,word_dnf).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_donna),
	haswordtitle(B,word_donna).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_down),
	haswordtitle(B,word_down).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_drift),
	haswordtitle(B,word_drift).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_e),
	haswordtitle(B,word_e).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_economic),
	haswordtitle(B,word_economic).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_ed),
	haswordtitle(B,word_ed).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_editor),
	haswordtitle(B,word_editor).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_ef),
	haswordtitle(B,word_ef).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_electronically),
	haswordtitle(B,word_electronically).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_emerging),
	haswordtitle(B,word_emerging).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_empirical),
	haswordtitle(B,word_empirical).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_environments),
	haswordtitle(B,word_environments).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_equivalence),
	haswordtitle(B,word_equivalence).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_error),
	haswordtitle(B,word_error).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_errors),
	haswordtitle(B,word_errors).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_estimates),
	haswordtitle(B,word_estimates).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_euro),
	haswordtitle(B,word_euro).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_evaluation),
	haswordtitle(B,word_evaluation).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_exact),
	haswordtitle(B,word_exact).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_experimental),
	haswordtitle(B,word_experimental).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_experiments),
	haswordtitle(B,word_experiments).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_expert),
	haswordtitle(B,word_expert).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_extended),
	haswordtitle(B,word_extended).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_fi),
	haswordtitle(B,word_fi).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_field),
	haswordtitle(B,word_field).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_fiers),
	haswordtitle(B,word_fiers).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_finite),
	haswordtitle(B,word_finite).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_first),
	haswordtitle(B,word_first).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_fixed),
	haswordtitle(B,word_fixed).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_fourier),
	haswordtitle(B,word_fourier).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_framework),
	haswordtitle(B,word_framework).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_free),
	haswordtitle(B,word_free).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_frei),
	haswordtitle(B,word_frei).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_from),
	haswordtitle(B,word_from).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_fyoav),
	haswordtitle(B,word_fyoav).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_gambling),
	haswordtitle(B,word_gambling).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_games),
	haswordtitle(B,word_games).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_general),
	haswordtitle(B,word_general).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_group),
	haswordtitle(B,word_group).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_hans),
	haswordtitle(B,word_hans).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_hard),
	haswordtitle(B,word_hard).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_harman),
	haswordtitle(B,word_harman).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_helmbold),
	haswordtitle(B,word_helmbold).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_hierarchies),
	haswordtitle(B,word_hierarchies).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_home),
	haswordtitle(B,word_home).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_horn),
	haswordtitle(B,word_horn).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_how),
	haswordtitle(B,word_how).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_http),
	haswordtitle(B,word_http).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_hy),
	haswordtitle(B,word_hy).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_hypotheses),
	haswordtitle(B,word_hypotheses).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_hypothesis),
	haswordtitle(B,word_hypothesis).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_improve),
	haswordtitle(B,word_improve).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_indirect),
	haswordtitle(B,word_indirect).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_informational),
	haswordtitle(B,word_informational).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_is),
	haswordtitle(B,word_is).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_its),
	haswordtitle(B,word_its).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_k),
	haswordtitle(B,word_k).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_l),
	haswordtitle(B,word_l).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_label),
	haswordtitle(B,word_label).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_lae),
	haswordtitle(B,word_lae).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_langley),
	haswordtitle(B,word_langley).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_languages),
	haswordtitle(B,word_languages).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_large),
	haswordtitle(B,word_large).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_layer),
	haswordtitle(B,word_layer).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_learnable),
	haswordtitle(B,word_learnable).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_leave),
	haswordtitle(B,word_leave).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_lee),
	haswordtitle(B,word_lee).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_leee),
	haswordtitle(B,word_leee).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_leslie),
	haswordtitle(B,word_leslie).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_linear),
	haswordtitle(B,word_linear).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_llncs),
	haswordtitle(B,word_llncs).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_lower),
	haswordtitle(B,word_lower).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_m),
	haswordtitle(B,word_m).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_machines),
	haswordtitle(B,word_machines).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_macro),
	haswordtitle(B,word_macro).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_mansour),
	haswordtitle(B,word_mansour).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_manuscript),
	haswordtitle(B,word_manuscript).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_margin),
	haswordtitle(B,word_margin).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_markov),
	haswordtitle(B,word_markov).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_md5),
	haswordtitle(B,word_md5).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_mechanics),
	haswordtitle(B,word_mechanics).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_message),
	haswordtitle(B,word_message).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_methods),
	haswordtitle(B,word_methods).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_mixture),
	haswordtitle(B,word_mixture).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_model),
	haswordtitle(B,word_model).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_models),
	haswordtitle(B,word_models).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_mulae),
	haswordtitle(B,word_mulae).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_multi),
	haswordtitle(B,word_multi).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_muth),
	haswordtitle(B,word_muth).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_near),
	haswordtitle(B,word_near).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_nearly),
	haswordtitle(B,word_nearly).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_needed),
	haswordtitle(B,word_needed).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_network),
	haswordtitle(B,word_network).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_neural),
	haswordtitle(B,word_neural).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_new),
	haswordtitle(B,word_new).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_noise),
	haswordtitle(B,word_noise).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_not),
	haswordtitle(B,word_not).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_number),
	haswordtitle(B,word_number).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_oblivious),
	haswordtitle(B,word_oblivious).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_old),
	haswordtitle(B,word_old).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_one),
	haswordtitle(B,word_one).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_online),
	haswordtitle(B,word_online).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_optimal),
	haswordtitle(B,word_optimal).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_or),
	haswordtitle(B,word_or).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_order),
	haswordtitle(B,word_order).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_orders),
	haswordtitle(B,word_orders).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_orgs),
	haswordtitle(B,word_orgs).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_our),
	haswordtitle(B,word_our).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_out),
	haswordtitle(B,word_out).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_output),
	haswordtitle(B,word_output).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_over),
	haswordtitle(B,word_over).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_p),
	haswordtitle(B,word_p).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_pac),
	haswordtitle(B,word_pac).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_package),
	haswordtitle(B,word_package).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_pages),
	haswordtitle(B,word_pages).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_patrice),
	haswordtitle(B,word_patrice).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_pattern),
	haswordtitle(B,word_pattern).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_people),
	haswordtitle(B,word_people).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_persistent),
	haswordtitle(B,word_persistent).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_peter),
	haswordtitle(B,word_peter).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_play),
	haswordtitle(B,word_play).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_points),
	haswordtitle(B,word_points).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_polynomials),
	haswordtitle(B,word_polynomials).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_portfolio),
	haswordtitle(B,word_portfolio).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_potheses),
	haswordtitle(B,word_potheses).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_pp),
	haswordtitle(B,word_pp).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_precence),
	haswordtitle(B,word_precence).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_predictors),
	haswordtitle(B,word_predictors).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_primitives),
	haswordtitle(B,word_primitives).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_problem),
	haswordtitle(B,word_problem).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_problems),
	haswordtitle(B,word_problems).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_processed),
	haswordtitle(B,word_processed).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_processes),
	haswordtitle(B,word_processes).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_protocols),
	haswordtitle(B,word_protocols).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_pruning),
	haswordtitle(B,word_pruning).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_q),
	haswordtitle(B,word_q).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_queries),
	haswordtitle(B,word_queries).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_query),
	haswordtitle(B,word_query).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_r),
	haswordtitle(B,word_r).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_random),
	haswordtitle(B,word_random).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_read),
	haswordtitle(B,word_read).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_reasoning),
	haswordtitle(B,word_reasoning).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_recent),
	haswordtitle(B,word_recent).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_relations),
	haswordtitle(B,word_relations).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_repeated),
	haswordtitle(B,word_repeated).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_request),
	haswordtitle(B,word_request).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_results),
	haswordtitle(B,word_results).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_rfc),
	haswordtitle(B,word_rfc).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_rigged),
	haswordtitle(B,word_rigged).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_rigorous),
	haswordtitle(B,word_rigorous).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_ro),
	haswordtitle(B,word_ro).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_s),
	haswordtitle(B,word_s).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_saitta),
	haswordtitle(B,word_saitta).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_sanity),
	haswordtitle(B,word_sanity).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_scene),
	haswordtitle(B,word_scene).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_schapireg),
	haswordtitle(B,word_schapireg).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_schemas),
	haswordtitle(B,word_schemas).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_sequence),
	haswordtitle(B,word_sequence).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_seung),
	haswordtitle(B,word_seung).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_shapire),
	haswordtitle(B,word_shapire).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_site),
	haswordtitle(B,word_site).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_snowbird),
	haswordtitle(B,word_snowbird).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_soft),
	haswordtitle(B,word_soft).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_some),
	haswordtitle(B,word_some).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_sparse),
	haswordtitle(B,word_sparse).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_specialize),
	haswordtitle(B,word_specialize).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_split),
	haswordtitle(B,word_split).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_ssr),
	haswordtitle(B,word_ssr).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_stacked),
	haswordtitle(B,word_stacked).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_strategies),
	haswordtitle(B,word_strategies).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_strength),
	haswordtitle(B,word_strength).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_style),
	haswordtitle(B,word_style).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_sub),
	haswordtitle(B,word_sub).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_systems),
	haswordtitle(B,word_systems).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_t),
	haswordtitle(B,word_t).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_temporal),
	haswordtitle(B,word_temporal).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_test),
	haswordtitle(B,word_test).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_testing),
	haswordtitle(B,word_testing).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_text),
	haswordtitle(B,word_text).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_that),
	haswordtitle(B,word_that).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_this),
	haswordtitle(B,word_this).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_thoughts),
	haswordtitle(B,word_thoughts).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_time),
	haswordtitle(B,word_time).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_to),
	haswordtitle(B,word_to).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_top),
	haswordtitle(B,word_top).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_total),
	haswordtitle(B,word_total).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_toward),
	haswordtitle(B,word_toward).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_tree),
	haswordtitle(B,word_tree).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_typical),
	haswordtitle(B,word_typical).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_un),
	haswordtitle(B,word_un).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_under),
	haswordtitle(B,word_under).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_universal),
	haswordtitle(B,word_universal).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_unsupervised),
	haswordtitle(B,word_unsupervised).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_unsupevised),
	haswordtitle(B,word_unsupevised).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_up),
	haswordtitle(B,word_up).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_upyears),
	haswordtitle(B,word_upyears).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_use),
	haswordtitle(B,word_use).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_v),
	haswordtitle(B,word_v).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_valiant),
	haswordtitle(B,word_valiant).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_variable),
	haswordtitle(B,word_variable).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_vazirani),
	haswordtitle(B,word_vazirani).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_vc),
	haswordtitle(B,word_vc).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_vectors),
	haswordtitle(B,word_vectors).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_w),
	haswordtitle(B,word_w).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_walks),
	haswordtitle(B,word_walks).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_was),
	haswordtitle(B,word_was).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_weak),
	haswordtitle(B,word_weak).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_weakly),
	haswordtitle(B,word_weakly).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_web),
	haswordtitle(B,word_web).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_weights),
	haswordtitle(B,word_weights).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_well),
	haswordtitle(B,word_well).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_works),
	haswordtitle(B,word_works).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_workshop),
	haswordtitle(B,word_workshop).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_worst),
	haswordtitle(B,word_worst).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_www),
	haswordtitle(B,word_www).
sameatitle(A,B):0.3 :-
	haswordtitle(A,word_x),
	haswordtitle(B,word_x).

/* data regarding citations class_7 and class_8 */
venue(class_7,venue_proceedings_26th_symposium_theory_computing_).
venue(class_8,venue_proceedings_twenty_sixth_symposium_theory_computing_).
author(class_7,author_blum_a_).
author(class_8,author_blum_a_).
title(class_7,title_weakly_learning_learning_dnf_characterizing_statistical_query_using_fourier_analysis_).
title(class_8,title_weakly_learning_learning_dnf_characterizing_statistical_query_using_fourier_analysis_).

haswordvenue(venue_proceedings_26th_symposium_theory_computing_,word_26th).
haswordvenue(venue_proceedings_26th_symposium_theory_computing_,word_pos).
haswordvenue(venue_proceedings_26th_symposium_theory_computing_,word_test).

haswordvenue(venue_proceedings_twenty_sixth_symposium_theory_computing_,word_pos).
haswordvenue(venue_proceedings_twenty_sixth_symposium_theory_computing_,word_sixth).
haswordvenue(venue_proceedings_twenty_sixth_symposium_theory_computing_,word_test).

haswordtitle(title_weakly_learning_learning_dnf_characterizing_statistical_query_using_fourier_analysis_,word_dnf).
haswordtitle(title_weakly_learning_learning_dnf_characterizing_statistical_query_using_fourier_analysis_,word_fourier).
haswordtitle(title_weakly_learning_learning_dnf_characterizing_statistical_query_using_fourier_analysis_,word_query).
haswordtitle(title_weakly_learning_learning_dnf_characterizing_statistical_query_using_fourier_analysis_,word_test).
haswordtitle(title_weakly_learning_learning_dnf_characterizing_statistical_query_using_fourier_analysis_,word_weakly).

haswordauthor(author_blum_a_,word_a).
haswordauthor(author_blum_a_,word_blum).

:- end_lpad.
