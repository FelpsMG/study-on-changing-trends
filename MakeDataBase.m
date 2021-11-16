function [dataBasen,dataBase] = MakeDataBase(data, fileName)
    
    [year,month,day] = datevec(data{1,1});
    start = year; %set start year
    [a,~] = size(data);
    [year,month,day]=datevec(data{a,1});
    t_end = year; %set end year

    dataBase = [];
    aux = 1;

    for i = start:t_end
        for j = 1:12
            if j==2
                for k=1:28
                    dataBase(aux,1) = i;
                    dataBase(aux,2) = j;
                    dataBase(aux,3) = k;
                    aux=aux +1;
                end
            elseif j==4 || j==6 || j==9 || j==11
                for k=1:30
                    dataBase(aux,1) = i;
                    dataBase(aux,2) = j;
                    dataBase(aux,3) = k;
                    aux=aux +1;
                end
            else
                for k=1:31
                    dataBase(aux,1) = i;
                    dataBase(aux,2) = j;
                    dataBase(aux,3) = k;
                    aux=aux +1;
                end
                
            end
            
        end
    end

    j=1;
    [m,n] = size(data);
    aux = 1;
    for i=1:length(dataBase)
        aux = j;
        while aux<=m
            [year,month,day] = datevec(data{aux,1});
            if year == dataBase(i,1) && month == dataBase(i,2) && day == dataBase(i,3)
               dataBase(i,4) = data{aux,2}; 
               dataBase(i,5) = data{aux,3};
               dataBase(i,6) = data{aux,4};

               j=aux+1;
               aux = 100000;
               break;
            else
              
               dataBase(i,4) = -99;
               dataBase(i,5) = -99;
               dataBase(i,6) = -99;
            end
            aux = aux + 1;
        end
    end

    xlswrite(fileName,dataBase);

%% Code to delete missing dataBase rows
%    m = 1;
%    while m <= length(dataBase)
%       for n = 2:length(dataBase(1,:))
%            if dataBase(m,n) == -99
%                dataBase(m,:) = [];
%                m = m - 1;
%                break
%            end
%        end
%        m = m + 1;
%    end  
    
    
%% Code to normalize dataBase
%    for i = 1:length(dataBase(1,:))
% 	   dataBasen(:,i) = ((dataBase(:,i) - min(dataBase(:,i)))/(max(dataBase(:,i)) - min(dataBase(:,i)))) * 0.6 + 0.2;
%    end

end