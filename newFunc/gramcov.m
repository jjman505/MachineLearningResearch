function [ C ] = gramcov( X1,X2, kernel, param,variance )
%% this function uses makecov and an operation to make a covariance matrix
%% x1 and x2 are input vectors as in makecov
%operation is operation as generated by genvars
%parameters is same thing
%variance is internal variance for each point


    
    stack = cell(100,1);
    pointer = 1;
    for i=1:length(kernel)
        if kernel(i)=='s' || kernel(i)=='p' || kernel(i)=='l' || kernel(i)=='r'
            stack{pointer} = makecov(X1,X2,kernel(i),param(:,i),variance);
            if isnan(stack{pointer})
                C=NaN;
                return;
            end
            pointer=pointer+1;
        elseif kernel(i)=='+'
            stack{pointer-2} = stack{pointer-2} + stack{pointer-1};
            pointer=pointer-1;
        elseif kernel(i)=='*'
            stack{pointer-2} = stack{pointer-2} .* stack{pointer-1};
            pointer=pointer-1;
        else
            print('ERROR: unrecognized character');
        end
    end
    if pointer~=2
        print('ERROR: invalid rpn')
    end
    C = stack{1};
    
                
end
