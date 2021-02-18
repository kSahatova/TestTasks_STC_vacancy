clear
clc

A = 110;         % main frequency of the A string, Hz
duration = 2;    % duration of signal in seconds
fs = 48000;      % sample rate

fret = [3 2 0 0 0 3];  % define the frets for a G major chord

% Offset of the each string relatively A string
Eoffset  = -5;      
Doffset  = 5;
Goffset  = 10;
Boffset  = 14;
E2offset = 19;

% Define sequence of frequencies for each note based on the frets and the
% string offsets
 f0 = A*[ 2^((fret(1)+Eoffset)/12), 2^(fret(2)/12),...
          2^((fret(3)+Doffset)/12), 2^((fret(4)+Goffset)/12),...
          2^((fret(5)+Boffset)/12), 2^((fret(6)+E2offset)/12) ];

% Function call 
chord = karplus_strong(f0, fs, duration);

% Invert derived chord values' type into int16
chord16 = int16(chord);

% New file generation with the recieved result  
fileID = fopen('output.txt', 'w');
fprintf(fileID, 'Synthesized set of frequencies\n');
fprintf(fileID, '%0.6f \n', chord);
fclose(fileID);

% Normalize the sound for audioplayer
chord = chord - mean(chord);
chord = chord/max(abs(chord));


% To play the chord: 
 hplayer = audioplayer(chord, fs);
 play(hplayer)
 
