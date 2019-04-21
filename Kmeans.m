k = 3;
l = length(yy1);
K = round(rand(1,k)*3*l); %����3��1��900���������
U = [D(:,K(1)),D(:,K(2)),D(:,K(3))]; %��ʼ����ֵ����
MU = zeros(3,1); %���ÿ��������3���ֵ�ľ���
p = 1;

while p
    C1 = []; C2 = []; C3 = []; %C1 C2 C3����������
    for i=1:3*l
        for j=1:k
            MU(j) = norm(D(:,i)-U(:,j),2);
        end
        [dis,q]=min(MU); %qΪ�����ر��
        switch q
            case 1
                C1=[C1,D(:,i)];
            case 2
                C2=[C2,D(:,i)];
            otherwise
                C3=[C3,D(:,i)];
        end
    end
    A1 = mean(C1,2); %����C1��ÿ�еľ�ֵ
    A2 = mean(C2,2);
    A3 = mean(C3,2);
    U1 = [A1,A2,A3];
    if U1~=U
        U=U1; %���¾�ֵ����
    else
    p=0; %����ֵ�������ٸ���ʱ������ѭ��
    end
end
figure(3);
scatter(C1(1,:),C1(2,:),'b','filled');hold on;
scatter(C2(1,:),C2(2,:),'r','filled');hold on;
scatter(C3(1,:),C3(2,:),'g','filled');hold on;
h = scatter(U(1,:),U(2,:),'k','filled');
legend(h,'��ֵ����');