% �ۑ�W ���x�����O
% ��l�����ꂽ�摜�̘A�������Ƀ��x��������D
% �ۑ�쐬�ɂ������ẮuLenna�v�ȊO�̉摜��p����D 

ORG = imread('airi_Base.png'); % �摜�̓ǂݍ���
ORG = rgb2gray(ORG); % �����Z�W�摜�ɕϊ�
imagesc(ORG); colormap(gray); colorbar; axis image; % �摜�̕\��
pause;
IMG = ORG > 192; % 臒l192�œ�l��
imagesc(IMG); colormap(gray); colorbar; axis image; % �摜�̕\��
pause;
IMG = bwlabeln(IMG);
imagesc(IMG); colormap(jet); colorbar; axis image; % �摜�̕\��
pause;
