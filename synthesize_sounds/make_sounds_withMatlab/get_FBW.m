% get_FBW
% Louis Goldstein
% 20 October 2009
% read FBW table in .xls format
% interpolate across any blank columns
% Input arguments:
% filename      name of .xls file containing FBW table
% Output arguments:
% FBW           FBW table

function FBW = get_FBW(filename)
d = importdata(filename);
for i = 2:size(d.data,1)                 % do each row separately
    rowdat = d.data(i,:);
    rowdat = rowdat(~isnan(rowdat));
    col = (rowdat(1:2:end-1));
    val = rowdat(2:2:end);
    nframes = col(end);
    FBW(i-1,:) = zeros(1,nframes);
    for j = 2:length(col)
        if col(j) - col(j-1) >0
            slope = (val(j) - val(j-1)) ./ (col(j) - col(j-1));
            for k = 0:col(j)-col(j-1)
                FBW(i-1, (col(j-1)+k)) = val((j-1)) + k*slope;
            end
        end
    end
end
