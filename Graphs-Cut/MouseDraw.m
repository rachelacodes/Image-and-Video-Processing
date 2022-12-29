function  MouseDraw(action)

  global FigHandle InitialX InitialY I11;

 if nargin == 0, action = 'start';   end
 
 switch(action)

    case 'start',
        FigHandle = figure('WindowButtonDownFcn','MouseDraw down');
         imshow(I11,'border','tight');
         I11_data = getframe(FigHandle);
         I11 = I11_data.cdata;

    case 'down',
        if strcmp(get(FigHandle, 'SelectionType'), 'normal')    
            set(FigHandle,'pointer','hand');      
            CurPiont = get(gca, 'CurrentPoint');
            InitialX = CurPiont(1,1);
            InitialY = CurPiont(1,2);

            set(gcf, 'WindowButtonMotionFcn', 'MouseDraw move');
            set(gcf, 'WindowButtonUpFcn', 'MouseDraw up');

        end

    case 'move',
        CurPiont = get(gca, 'CurrentPoint');
        X = CurPiont(1,1);
        Y = CurPiont(1,2);

        x_gap = 0.1;    
        y_gap = 0.1;    
        if X > InitialX
            step_x = x_gap;
        else
            step_x = -x_gap;
        end
        if Y > InitialY
            step_y = y_gap;
        else
            step_y = -y_gap;
        end  

        if abs(X-InitialX) < 0.01        
            iy = InitialY:step_y:Y;
            ix = X.*ones(1,size(iy,2));
        else
            ix = InitialX:step_x:X ;    

            iy = (Y-InitialY)/(X-InitialX).*(ix-InitialX)+InitialY;   
        end
        ImageX = [ix, X]; 
        ImageY = cat(2, iy, Y);
        line(ImageX,ImageY, 'marker', '.', 'markerSize',14, ...
            'LineStyle', '-', 'LineWidth', 2, 'Color', 'Red');

        InitialX = X;       
        InitialY = Y;       

    case 'up',

        set(gcf, 'WindowButtonMotionFcn', '');

        set(gcf, 'WindowButtonUpFcn', '');

end
