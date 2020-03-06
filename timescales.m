clear all; close all
% EOSC 340 - plots up relevant climate timescales


% Timecales
scales = {
        ' This Course';...
        ' Photosynthesis + Respiration';...
        ' Fashion';...
        ' Governments';...
        ' Commerce';...
        ' Methane Atmospheric Life';...
        ' Infrastructure';...
        ' Culture';...
        ' A Human Life';...
        ' Carbon Atmospheric Life';...
        ' Surface Ocean Infiltration + Response';...
        ' Deep Ocean Circulation';...
%         ' Human Civilization';...
        ' Ice sheet and Sea Level Response';...
        ' Carbonate Rock Reactions';...
        ' Milankovitch Cycles';...
        ' PETM/Carbon Spike Recovery';...
        ' Tectonics, Weathering, Volcanoes';...
        ' Solar Luminosity';...
         };
     
times = [
        0.1 0.25 0;... % This Course
        0.25 1 1;...  % Photoshynthesis + Respiration
        0.25 2 0;...  % Fashion
        1 5 0;...     % Governments
        0.25 10 0;... % Commerce
        7 12 1;...    % Atmospheric Methan Residence Time
        1 50 0;...    % Infrastructure
        10 80 0;...   % Culture
        0.1 100 0;...   % A Human Life
        40 200 1;...  % Atmospheric carbon residence time
        10 300 1;...  % Surface Ocean Infiltration + Response
        4e2 1e3 1;... % Deep Ocean Circulation
%         0 1e4 0;...   % Human Civilization
        5e2 1e4 1;... % Ice sheet and sea level response
        5e3 5e4 1;... % Carbonate rock reactions
        2e4 1e5 1;... % Milankovitch
        2e4 2e5 1;... % PETM/Carbon spike recovery
        1e5 5e8 1;... % Tectonics: Weathering and Volcanic emissions
        1e8 4e9 1;... % Solar Luminosity
        ];
  
% Plot params
bar_height = 0.8;

col1 = [0 0.6 0.9];
col2 = [0 0.6 0.2];

fs = 14;
% Zooms
stops = [8 18];
zooms = [8 15 19];
xt1 = [1 10 30 100 300 1e3];

xt2 = [10 1e2 3e2 1e3 1e4 3e4]; 
xt2lab = {'10' '100' '300' '1 Thousand' '10 Thousand' '30 Thousand'};

xt3 = [1e4 3e4 1e5 1e6 1e7 1e8 1e9];
xt3lab = {'10 Thousand' '30 Thousand' '100 Thousand' '1 Million' '10 Million' '100 Million' '1 Billion'};

xt4 = [1e7 1e8 1e9];
xt4lab = {'10 Million' '100 Million' '1 Billion'};

figdir = '/home/crowell/Kahuna/phd-docs/lecture/climate-timescales';
%%
zcount = 1;
figure('position',[50 50 1500 750])
tightSubplot(1,1,1,[],[],[0.04 0.04 0.1 0.05])
for ii=1:size(times,1)
    y = ii - 0.9;
    x = times(ii,1);
    w = times(ii,2)-times(ii,1);
    if times(ii,3)
        col = col2;
    else
        col = col1;
    end
    rectangle('Position',[x y w bar_height],'FaceColor',col)
    hold on

    xlabel('Timescale [years]')
    text(times(ii,2),y+bar_height/2,scales{ii},'HorizontalAlignment','left'...
        ,'VerticalAlignment','middle','FontSize',fs)
    set(gca,'YTick',9)
    set(gca,'YTickLabel',[])
    grid on

    if ii<=9
        xt = xt1;
        xlim([0 130])
        set(gca,'XTick',xt)
        xtl = get(gca,'XTickLabel');
    elseif ii<=13
        xt = xt2;
        xtl = xt2lab;
        xlim([0 times(ii,2)*1.3])
    elseif ii<=16
        xt = xt3;
        xtl = xt3lab;
        xlim([0 times(ii,2)*1.3])
    else
        xt = xt4;
        xtl = xt4lab;
        xlim([0 times(ii,2)*1.3])
    end
    
    ylim([-0.25 18.25])
    set(gca,'XTick',xt)
    set(gca,'XTickLabel',xtl)
    set(gca,'FontSize',fs)

    fname = sprintf('Timescale_%i',times(ii,2));
    pause(0.1)
    printpdf(fname,figdir,[30 15])
end


% Last bit
set(gca,'XScale','log')
set(gca,'XTick',logspace(0,10,11))
set(gca,'XTickLabel',logspace(0,10,11))
% rectangle('Position',[times(8,1) 7.5 diff(times(8,1:2)) bar_height],'FaceColor',col)
xlim([0 1e12])
printpdf('logscales',figdir,[30 15])
% for ii=1:size(times,1)
%     xlim([0 times(ii,2)*2])
% 
%     ylim([-0.25 18.25])
% %     if ii>zooms(zcount)
% %         zcount = zcount +1;
% %     end
% %     yl = zooms(zcount);
% % 
% %     ylim([-0.25 yl+0.25])
%     pause
% end