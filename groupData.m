
    for index=1:12

        cidade=[];

        if index == 1
            load address\ARAXA.csv;
            cidade = ARAXA ;
            citySave='ARAXA';
        elseif index == 2
            load address\BARBALHA.csv;
            cidade = BARBALHA ;
            citySave='BARBALHA';
        elseif index == 3
            load address\BELOHORIZONTE.csv;
            cidade = BELOHORIZONTE ;
            citySave='BELOHORIZONTE';
        elseif index == 4
            load address\BELEM.csv;
            cidade = BELEM ;
            citySave='BELEM';
        elseif index == 5
            load address\CAPARAO.csv;
            cidade = CAPARAO ;
            citySave='CAPARAO';
        elseif index == 6
            load address\CUIABA.csv;
            cidade = CUIABA ;
            citySave='CUIABA';
        elseif index == 7
            load address\CURITIBA.csv;
            cidade = CURITIBA ;
            citySave='CURITIBA';
        elseif index == 8
            load address\MANAUS.csv;
            cidade = MANAUS ;
            citySave='MANAUS';
        elseif index == 9
            load address\NATAL.csv;
            cidade = NATAL ;
            citySave='NATAL';
        elseif index == 10
            load address\SAOPAULO.csv;
            cidade = SAOPAULO ;
            citySave='SAOPAULO';
        elseif index == 11
            load address\SAOSIMAO.csv;
            cidade = SAOSIMAO ;
            citySave='SAOSIMAO';
        elseif index == 12
            load address\Cabrobo.csv;
            cidade = Cabrobo;
            citySave='CABROBO';
        end
       
        dadosMensais = [];
        Tmax=[];
        Tmin=[];
        Tmean=[];
        Chuva=0;
        cont=1;

        for i=1:size(cidade)-1

            if cidade(i,2) == cidade(i+1,2)
                Chuva=Chuva+cidade(i,4);
                Tmin(cont,1)=cidade(i,6);
                Tmax(cont,1)=cidade(i,5);
                Tmean(cont,1)=cidade(i,7);
                cont=cont+1;
            else

                aux=[cidade(i,1) cidade(i,2) Chuva max(Tmax) min(Tmin) mean(Tmean)];
                [l,c]=size(aux);
                if c<6

                else
                    dadosMensais=[dadosMensais; aux];
                    cont=1;
                    Tmax=[];
                    Tmin=[];
                    Tmean=[];
                    Chuva=0;
                end

            end

        end
        csvwrite(strcat(citySave,'DadosMensais.csv'),dadosMensais)    
        dadosTrimestrais = [];
        Tmax=0;
        Tmin=0;
        Tmean=0;
        Chuva=0;
        cont=0;
        for i=1:size(dadosMensais)-2
            if dadosMensais(i,2) == 1 || dadosMensais(i,2) == 4 || dadosMensais(i,2) == 7 || dadosMensais(i,2) == 10
                Chuva=Chuva+sum(dadosMensais(i:i+2,3));
                Tmin=min(dadosMensais(i:i+2,5));
                Tmax=max(dadosMensais(i:i+2,4));
                Tmean=mean(dadosMensais(i:i+2,6));

                if dadosMensais(i,2) == 1
                    aux=[dadosMensais(i,1) 1 Chuva Tmax Tmin Tmean];
                    dadosTrimestrais=[dadosTrimestrais; aux];
                elseif dadosMensais(i,2) == 4
                    aux=[dadosMensais(i,1) 2 Chuva Tmax Tmin Tmean];
                    dadosTrimestrais=[dadosTrimestrais; aux];
                elseif dadosMensais(i,2) == 7
                    aux=[dadosMensais(i,1) 3 Chuva Tmax Tmin Tmean];
                    dadosTrimestrais=[dadosTrimestrais; aux];
                elseif dadosMensais(i,2) == 10
                    aux=[dadosMensais(i,1) 4 Chuva Tmax Tmin Tmean];
                    dadosTrimestrais=[dadosTrimestrais; aux];
                end
            else
                Tmax=0;
                Tmin=0;
                Tmean=0;
                Chuva=0;
            end

        end
        csvwrite(strcat(citySave,'dadosTrimestrais.csv'),dadosTrimestrais)  
        dadosAnuais = [];
        Tmax=[];
        Tmin=[];
        Tmean=[];
        Chuva=[];
        cont=0;
        for i=1:size(dadosMensais)-1
            if dadosMensais(i,1) == dadosMensais(i+1,1) 
                Chuva=Chuva+sum(dadosMensais(i,3));
                Tmax=[Tmax;dadosMensais(i,4)];
                Tmin=[Tmin;dadosMensais(i,5)];
                Tmean=[Tmean;(dadosMensais(i,6))];
            else
                aux=[dadosMensais(i,1) Chuva max(Tmax) min(Tmin) mean(Tmean)];
                dadosAnuais=[dadosAnuais; aux];
                Tmax=[];
                Tmin=[];
                Tmean=[];
                Chuva=[];
            end
        end
        csvwrite(strcat(citySave,'dadosAnuais.csv'),dadosAnuais)  
    end