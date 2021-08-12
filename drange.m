function lis = drange()
    fds = fileDatastore('*.txt','ReadFcn',@importdata);
    fullFileNames = fds.Files;
    numFiles = length(fullFileNames);
    lis = [];
    for k = 1:numFiles
        fields_per_line = 5;
        fmt = repmat('%s',1,fields_per_line);
        fid = fopen(fullFileNames{k}, 'rt');
        filebycolumn = textscan(fid, fmt, 'Delimiter', char(9));
        fclose(fid);
        fieldarray = horzcat(filebycolumn{:});
        travel = str2num(char(fieldarray(2:end,3)));
        range = (max(travel)-min(travel))*0.16;
        if range < 10000
            lis = [lis; range];
        else
            disp(fullFileNames{k})
            disp(range)
        end
    end
end