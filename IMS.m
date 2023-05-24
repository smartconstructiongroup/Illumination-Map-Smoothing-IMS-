function [I, T_ini,T_ref] = IMS(L,gamma,alpha)



A=size(L);
T_ini = max(L,[],3)+0.02;    
T_ref=T_ini;




for t=1:50
    T_ref(1,1)=(alpha*T_ini(1,1)+T_ref(2,1)+T_ref(1,2))/(alpha+2);
    
    m=1;
    for n=2:A(2)-1
        T_ref(m,n)=(alpha*T_ini(m,n)+T_ref(m+1,n)+T_ref(m,n-1)+T_ref(m,n+1))/(3+alpha);
    end
        
    n=1;
    for m=2:A(1)-1
        
        T_ref(m,n)=(alpha*T_ini(m,n)+T_ref(m-1,n)+T_ref(m+1,n)+T_ref(m,n+1))/(alpha+3);
    end
    
    
    for m=2:A(1)-1
        for n=2:A(2)-1
            T_ref(m,n)=(alpha*T_ref(m,n)+T_ref(m-1,n)+T_ref(m+1,n)+T_ref(m,n-1)+T_ref(m,n+1))/(alpha+4);
        end
    end
 
    
    m=A(1);
    for n=2:A(2)-1
        T_ref(m,n)=(alpha*T_ini(m,n)+T_ref(m-1,n)+T_ref(m,n-1)+T_ref(m,n+1))/(alpha+3);
    end
    
    
    
    n=A(2);
    for m=2:A(1)-1
        
        T_ref(m,n)=(alpha*T_ini(m,n)+T_ref(m-1,n)+T_ref(m+1,n)+T_ref(m,n-1))/(alpha+3);
        
    end
    
    T_ref(1,A(2))=(alpha*T_ini(1,A(2))+T_ref(1,A(2)-1)+T_ref(2,A(2)))/(alpha+2);
    
    T_ref(A(1),1)=(alpha*T_ini(A(1),1)+T_ref(A(1)-1,1)+T_ref(A(1),2))/(alpha+2);
    
    T_ref(A(1),A(2))=(alpha*T_ini(A(1),A(2))+T_ref(A(1)-1,A(2))+T_ref(A(1),A(2)-1))/(alpha+2);

    
 
   
end

 

T_ref=T_ref+ gamma;

I(:,:,1) = L(:,:,1)./T_ref;
I(:,:,2) = L(:,:,2)./T_ref;
I(:,:,3) = L(:,:,3)./T_ref;

end





