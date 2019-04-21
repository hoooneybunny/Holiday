k = 3;
l = length(yy1);
K = round(rand(1,k)*3*l); %产生3个1至900的随机整数
U = [D(:,K(1)),D(:,K(2)),D(:,K(3))]; %初始化均值向量
MU = zeros(3,1); %存放每个样本到3类均值的距离
p = 1;

while p
    C1 = []; C2 = []; C3 = []; %C1 C2 C3三类存放样本
    for i=1:3*l
        for j=1:k
            MU(j) = norm(D(:,i)-U(:,j),2);
        end
        [dis,q]=min(MU); %q为样本簇标记
        switch q
            case 1
                C1=[C1,D(:,i)];
            case 2
                C2=[C2,D(:,i)];
            otherwise
                C3=[C3,D(:,i)];
        end
    end
    A1 = mean(C1,2); %返回C1类每行的均值
    A2 = mean(C2,2);
    A3 = mean(C3,2);
    U1 = [A1,A2,A3];
    if U1~=U
        U=U1; %更新均值向量
    else
    p=0; %当均值向量不再更新时，跳出循环
    end
end
figure(3);
scatter(C1(1,:),C1(2,:),'b','filled');hold on;
scatter(C2(1,:),C2(2,:),'r','filled');hold on;
scatter(C3(1,:),C3(2,:),'g','filled');hold on;
h = scatter(U(1,:),U(2,:),'k','filled');
legend(h,'均值向量');