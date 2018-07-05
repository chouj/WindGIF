%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% An instance for Making movie/animation from ScreenCapture by using MATLAB

% 循环截屏生成动画视频文件

% ScreenCapture.m is required
% https://ww2.mathworks.cn/matlabcentral/fileexchange/24323-screencapture-get-a-screen-capture-of-a-figure-frame-or-component

% Author: github.com/chouj
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% web browser
[stat,h1]=web('https://earth.nullschool.net/#current/wind/surface/level/orthographic=-231.32,30.02,563');
pause(10);
[stat,h1]=web('https://earth.nullschool.net/#current/wind/surface/level/orthographic=-231.32,30.02,563');
pause(60);

% Prepare the new file.
vidObj = VideoWriter('.\windgif.mp4','MPEG-4');
vidObj.FrameRate=10;
vidObj.Quality=100;
open(vidObj);

i=1;
while(i<=100) % capture 100 times
        try
            % specify screen area rectangle accordingly
            imageData = screencapture(0,[130,5,V.Width-300,V.Height-100]); % for instance
            f = figure('Visible', 'off'); % figure unshown
            a = axes('Visible','off');
            imshow(imageData);

            M(i)=getframe;
            close all

            writeVideo(vidObj,M(i));
            
            i=i+1;
            
        catch
            i=i+1;
        end
end

close(vidObj);
close(h1);
