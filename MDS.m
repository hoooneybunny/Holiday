Nums=500;
x=40*(rand(2,Nums)-0.5);
y=0.8*x(1,:)+0.5*x(2,:)+normrnd(0,3,1,Nums);
X=zeros(3,Nums);
X(1:2,:)=x;
X(3,:)=y;
plot3(X(1,:),X(2,:),X(3,:),'ro')

d1 = 2;
A1 = mean(X(1,:));
A2 = mean(X(2,:));
A3 = mean(X(3,:));
X(1,:) = X(1,:) - A1;
X(2,:) = X(2,:) - A2;
X(3,:) = X(3,:) - A3;
E = X*X';
[V,lamda] = eig(E);
[dis,m1] = max(max(lamda));
lamda(m1,m1) = 0;
V1 = V(:,m1);
[dis1,m2] = max(max(lamda));
V2 = V(:,m2);
W = [V1,V2];
W1 = zeros(3,1);
W = [W,W1];
Z = V*W'*X;
plot3(Z(1,:),Z(2,:),Z(3,:),'r+');
