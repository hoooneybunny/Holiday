k = 3;
A = [1/3,1/3,1/3];
k1 = length(C1); k2 = length(C2); k3 = length(C3);
E1 = 0; E2 = 0; E3 = 0;
U2 = U;
for i=1:k1
    E1 = E1 + (C1(:,i)-U2(:,1)).*(C1(:,i)-U2(:,1))';
end
for i=1:k2
    E2 = E2 + (C2(:,i)-U2(:,2)).*(C2(:,i)-U2(:,2))';
end
for i=1:k3
    E3 = E3 + (C3(:,i)-U2(:,3)).*(C3(:,i)-U2(:,3))';
end
E1=1/k1*E1;
E2=1/k2*E2;
E3=1/k3*E3;

E = [E1, E2];
E = [E, E3];
p = [];

for m=1:1000
    for i=1:900
        sum = 0;
        for l=1:k
            sum = sum + A(l)*prob(D(:,i),U2(:,l),E(:,2*l-1:2*l));
        end
        for j=1:k
            p(j,i) = A(j)*prob(D(:,i),U2(:,j),E(:,2*j-1:2*j))/sum;
        end
    end
    for i=1:k
        sum1 = zeros(2,1); sum2 = 0; sum3 = zeros(2,2);
        for j1 = 1:900
            sum1 = sum1 + p(i,j1)*D(:,j1);
            sum2 = sum2 + p(i,j1);
        end
        U2(:,i) = sum1/sum2;
        for j2 = 1:900
            sum3 = sum3 + p(i,j2)*(D(:,j2)-U2(:,i))*(D(:,j2)-U2(:,i))';
        end
        E(:,2*i-1:2*i) = sum3./sum2;
        A(i) = sum2/900;
    end
end

c1 = []; c2 = []; c3 = [];
dis = [];
for i=1:900
    dis = p(:,i);
    [dis1,q3] = max(dis);
    switch q3
        case 1
            c1=[c1,D(:,i)];
        case 2
            c2=[c2,D(:,i)];
        otherwise
            c3=[c3,D(:,i)];
    end
end
figure(4);
scatter(c1(1,:),c1(2,:),'b','filled');hold on;
scatter(c2(1,:),c2(2,:),'r','filled');hold on;
scatter(c3(1,:),c3(2,:),'g','filled');hold on;
h = scatter(U2(1,:),U2(2,:),'k','filled');
legend(h,'均值向量');