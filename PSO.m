w=0.99;
c1=2;
c2=2;
u=[1,1,1];
xi=20;
n=2;

for i=1:xi
    g(i)=0;
    for j=1:n
        f(i,j)=5*rand(1);      
    end
    g(i)=obj(f(i,:),u);
     pbest(i,:)=f(i,:);
end
f
[g_value,ind]=min(abs(g));
gbest=f(ind,:);
m=0;
for m=1:3000
    for j=1:xi
        if(abs(obj(f(j,:),u))< abs(obj((gbest),u)))
            gbest=f(j,:);
        end
        
        if(abs(obj(f(j,:),u))< abs(obj(pbest(j,:),u)))
            pbest(j,:)=f(j,:);
        end 
        v(j,:)=f(j,:);
    end
    for j=1:xi
        v(j,:)=w*v(j,:) + c1*(pbest(j)-f(j,:))*rand + c2*(gbest-f(j,:))*rand;
        f(j,:)=f(j,:) + v(j,:);
    end     
end
gbest
f
obj(gbest,u)
m