local N=8

function  IsPlaceOK( a,n,c )
    for i=1,n-1 do
        if (a[i]==c) or (a[i]-i==c-n) or (a[i]+i==c+n) then
            return false
        end
    end
    return true
end

function PrintSolution(a)
    for i=1,N do
        local str="";
        for j=1,N do
            str=str..(a[i]==j and "Q" or "-").." "
        end
        print(str)
    end
    print()
end

function AddQueen(a,n)
    if n>N then
        PrintSolution(a)
    else
        for c=1,N do
            if IsPlaceOK(a,n,c) then
                a[n]=c
                AddQueen(a,n+1)
            end
        end
    end
end

AddQueen({},1)
