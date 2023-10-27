function [MagMax,BW]=parbode(MagW,MagW0,W)
% Exercici 1 pràctica 1 de Control Automàtic.
%
% MagW      Mòdul de la resposta en freqüència.
% MagW0	    Mòdul de la resposta en freqüència per w=0.
% W         Vector de freqüència.
%
% MagMax    Valor màxim (de pic) de la resposta en freqüència.
% BW	    Band Width, Ample de banda.
%
% Exemple:  [MagMax,BW]=parbode(mag,1,w)

MagMax=max(MagW);		% Càlcul del pics de les resp. en freqüència.

MagdB=20*log10(MagW);		% Pasa el vector de mòdul a dB's.
MagW0dB=20*log10(MagW0);	% Mòdul en dB per W=0.

[f,c]=size(MagW);
for col=1:c
	n=1;
	while (MagdB(n,col)>(-MagW0dB-3))
		n=n+1;
	end;
	BW(col)=W(n);
end

end