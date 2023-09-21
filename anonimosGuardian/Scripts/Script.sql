use django;


show tables;

select * from tbl_campaign;
select * from tbl_campaign_photo;
select * from tbl_campaign_review;  
select * from tbl_member;
select * from tbl_funding;
select * from tbl_funding;
select * from tbl_donation;
SELECT id, create_date, update_date, safe_region_description, safe_region_description2, safe_region_url, safe_region_info, safe_region_content, city_header_id
FROM django.tbl_safe_region;
SELECT id, city_detail_name, city_header_id
FROM django.tbl_city_detail;

SELECT id, city_name, city_image
FROM django.tbl_city_header;




-- 캠페인 문의 답변
SELECT id, create_date, update_date, campaign_inquiry_type, campaign_inquiry_content, campaign_inquiry_status, campaign_id, member_id
FROM django.tbl_campaign_inquiry;

SELECT id, create_date, update_date, campaign_inquiry_answer_content, campaign_inquiry_id, member_id
FROM django.tbl_campaign_inquiry_answer;


INSERT INTO django.tbl_campaign_inquiry
(create_date, update_date, campaign_inquiry_type, campaign_inquiry_content, campaign_inquiry_status, campaign_id, member_id)
VALUES('2023-8-19 11:02:39.000000', '2023-8-19 12:02:39.000000', '1', '꼭 참여 하고 싶은 활동이네요 따로 면접이나 심사과정이 있을까요? 저희 반려견이 대형견인데 문제가 없을까요? ', 1, 4, 116);


INSERT INTO django.tbl_campaign_inquiry_answer
(create_date, update_date, campaign_inquiry_answer_content, campaign_inquiry_id, member_id)
VALUES('2023-8-20 11:02:39.000000', '2023-8-20 11:02:39.000000', '반려견의 크기는 심사의 영향을 주지 않습니다. / 반려견 순찰대 홈페이지 통해서 신청 후 관리자와의 관계 심사, 산책 심사 후 선정이 되고 나면 안전교육 진행 후 순찰대 활동이 가능해집니다. ', 4, 177);


SELECT id, create_date, update_date, status, started_on, ends_on, donation_title, donation_minimum_amount, donation_description, donation_content, donation_image, member_id, donation_sub_image, city_detail_id, city_header_id
FROM django.tbl_donation;

-- 기부 문의 답변
SELECT id, create_date, update_date, donation_inquiry_type, donation_inquiry_content, donation_inquiry_status, donation_id, member_id
FROM django.tbl_donation_inquiry;

SELECT id, create_date, update_date, donation_inquiry_answer_content, donation_inquiry_id, member_id
FROM django.tbl_donation_inquiry_answer;

INSERT INTO django.tbl_donation_inquiry
(create_date, update_date, donation_inquiry_type, donation_inquiry_content, donation_inquiry_status, donation_id, member_id)
VALUES('2023-7-20 11:02:39.000000', '2023-7-20 11:02:39.000000', '1', '저도 재호 형제와 같이 보육원 출신입니다. 안타까운 소식을 접하고 뭔가 도움이 되고 싶어서 문의 남깁니다. 재호 형제에게 작지만 포근한 보금자리를 마련 해주고 싶습니다.메일 주소 남기고 갑니다. gdd88&nate.com ', 1, 5, 177);

INSERT INTO django.tbl_donation_inquiry_answer
(create_date, update_date, donation_inquiry_answer_content, donation_inquiry_id, member_id)
VALUES('2023-7-21 11:02:39.000000', '2023-7-21 11:02:39.000000', '후원자님 남겨 두신 메일 주소로 보육원 연락처와 주소 보내드렸습니다. 선행에 감사 드립니다!', 1, 459);





-- 펀딩 문의 답변
SELECT id, create_date, update_date, funding_inquiry_type, funding_inquiry_content, fundinginquiry_status, funding_id, member_id
FROM django.tbl_funding_inquiry;

SELECT id, create_date, update_date, funding_inquiry_answer_content, funding_inquiry_id, member_id
FROM django.tbl_funding_inquiry_answer;


select * from tbl_funding;
INSERT INTO django.tbl_funding_inquiry
(create_date, update_date, funding_inquiry_type, funding_inquiry_content, fundinginquiry_status, funding_id, member_id)
VALUES('2023-8-20 11:02:39.000000', '2023-8-20 11:02:39.000000', '1', '강남구에 요즘 들어 부쩍 반려견과 함께하는 캠페인이 많이 생기고 있어 다행이라고 생각 합니다. 활동 하시는데 필요한 물자는 없으실까요? ', 1, 3, 78);

INSERT INTO django.tbl_funding_inquiry_answer
(create_date, update_date, funding_inquiry_answer_content, funding_inquiry_id, member_id)
VALUES('2023-8-21 11:02:39.000000', '2023-8-21 11:02:39.000000', '관심 가져 주셔서 감사합니다! 향후 활동에 필요한 물자는 많으면 많을 수록 좋겠지만 반려견 관련 목줄과 야광 안전조끼 등이 필요합니다.  ', 2, 119);


SELECT * from tbl_campaign;

SELECT * from tbl_campaign_review;

INSERT INTO django.tbl_campaign_review
(create_date, update_date, campaign_review_title, campaign_review_content, campaign_review_status, campaign_id, member_id, campaign_review_image)
VALUES('2023-8-10 11:02:39.000000', '2023-8-10 11:02:39.000000', '강서구 무료급식 예비군 봉사활동단   참여 후기 남깁니다', '오랜만에 본가에 왔다가 예비군 봉사활동단이 무료급식 캠페인 진행 한다고 하여 어머니 등살에 밀려 반강제로 참여 했는데 하... 몸은 힘든데 왜 이렇게 뿌듯한지 본가 올때마다 참여 하게 될것 같네요 나의 주말은 그렇게 갑니다 ㅋㅋㅋㅋ', 1, 1, 461, 'campaign/봉사활동1.jpg');




SELECT id, create_date, update_date, notice_title, notice_content, notice_status, member_id
FROM django.tbl_notice;
INSERT INTO django.tbl_notice
(create_date, update_date, notice_title, notice_content, notice_status, member_id)
VALUES('2022-12-25 22:02:39.000000', '2022-12-25 22:02:39.000000', '[노원구 기부 스텝 모집 합니다]', '🌟 스텝 모집 공고 🌟

안녕하세요,

저희 [회사/이벤트 이름]에서 함께할 열정적인 스텝을 모집합니다! 우리의 성공에 함께 기여하실 분을 기다립니다.

역할 및 책임:

[보조]: [기부 부스 스텝 보조]
...
자격 요건:

누구나 함께 합니다!

...

모집 기간 및 방법:

모집 기간: [상시]
지원 방법: [웹사이트]
함께 우리의 목표를 달성하고 새로운 경험을 만들어보세요! 

감사합니다.

', 1, 277);


-- 
-- INSERT INTO django.tbl_member
-- (create_date, update_date, member_name, member_address, member_email, member_grade, member_image, city_detail_id, city_header_id, status)
-- VALUES('2023-04-10 18:10:09.596048', '2023-04-10 18:10:09.596048', '김구', '', 'koo9999@nate.com', 1, '', 2, 1, 1);


select * from tbl_member;
select * from tbl_campaign; 

INSERT INTO django.tbl_campaign
(create_date, update_date, status, started_on, ends_on, campaign_title, campaign_category, campaign_description1, campaign_description2, campaign_description3, campaign_image, campaign_content, member_id, city_detail_id, city_header_id)
VALUES('2022-12-1 11:10:09.596048', '2022-12-1 11:10:09.596048', 1, '2022-12-1 18:10:09.596048', '2022-12-31 18:10:09.596048', '경기도 광주시 바닥에 버려지는 담배꽁초가 사라지는 그 날까지! ', '봉사활동', '경기도 광주시 ', '봉사활동', '', 'campaign/경기도광주상생봉사단.jpg', '

지역에서 봉사활동이 필요한 곳이 있으면 그게 어디든 갑니다!! 지역 상생 봉사단이 창설 되었습니다! 모이는 본들은 모두 봉사가 하고 싶어 근질근질 하신 분들 뿐 인데요! 여러분의 참여도 기다리고 있습니다!
', 377, 100, 15);

SELECT id, create_date, update_date, campaign_header_title, campaign_detail_image, campaign_id, member_id
FROM django.tbl_campaign_photo;


INSERT INTO django.tbl_funding
(create_date, update_date, status, started_on, ends_on, funding_title, funding_minimum_amount, funding_description, funding_content, funding_image, member_id, campaign_id, funding_sub_image)
VALUES('2023-04-03 08:10:09.596048', '2023-04-03 08:10:09.596048', 1, '2023-3-3 11:10:09.596048', '2023-12-31 11:10:09.596048', '금연구역에선 아시죠?!👏 ', 7000, '', '

🌼모두 알면서 모르는 척 하는거 맞죠?🌼

담배 꽁초는 바닥에 버리는게 아니라는 사실!! 재떨이나 개인용 재떨이를 이용 하셔야 한다고! 열심히 외치는 학생들이 있습니다 기특한 그들에게 응원의 메시지 보내주세요! ', 'campaign/캠페인3.jpg', 200, 27, 'campaign/캠페인2.jpeg');

INSERT INTO django.tbl_campaign_photo
(create_date, update_date, campaign_header_title, campaign_detail_image, campaign_id, member_id)
VALUES('2023-03-13 12:10:09.596048', '2023-03-13 12:10:09.596048', '', 'campaign/지역보안관1.png', 1, 59);




select * from tbl_campaign;
select * from tbl_funding;



INSERT INTO django.tbl_campaign_review
(create_date, update_date, campaign_review_title, campaign_review_content, campaign_review_status, campaign_id, member_id, campaign_review_image)
VALUES('2023-8-20 12:10:09.596048', '2023-8-20 12:10:09.596048', '반려견과 함께 해요 반려견 순찰대 1주일 경과', '

매일은 못나가도 1주일에 4번 다녀왔습니다 !!! 힘들어하는 주인 맘은 모르는지 우리 강아지는 뭐가 그리 좋은지 또 나가자고 하네요 ㅋㅋㅋㅋㅋㅋㅋ 좋습니다!', 1, 7, 400, 'campaign/반려견순찰111.jpg');


select * from tbl_donation;

INSERT INTO django.tbl_donation
(create_date, update_date, status, started_on, ends_on, donation_title, donation_minimum_amount, donation_description, donation_content, donation_image, member_id, donation_sub_image, city_detail_id, city_header_id)
VALUES('2023-8-20 12:10:09.596048', '2023-8-20 12:10:09.596048', 1, '2023-8-20 12:10:09.596048', '2024-8-20 12:10:09.596048', 'MBN 소나무 암에 걸린 뇌병변장애 아들을 돌보는 아빠', 30000, '', '두 번의 암 선고, 지켜볼 수밖에 없던 가장
13년 전, 아내가 암 투병 끝에 눈을 감은 그날, 화택(52) 씨는 유난히 긴 밤을 보냈습니다. 남부러울 것 없이 삼 남매를 낳고 길렀던 화택 씨 부부. 비록 둘째 아들 민성(20)이는 뇌병변장애를 갖고 태어나 섬세한 보살핌이 필요했지만, 부부는 서로를 바라보며 의지를 다졌었습니다. 아내를 떠나보내고, 남겨진 어린아이들과 아픈 둘째를 홀로 키우기는 결코 쉽지 않았지만, 그럼에도 아이들에게 최선을 다한 화택 씨. 하지만 작년 8월, 그에게 또 하나의 시련이 찾아왔습니다. 바로 둘째 아들 민성이가 뇌종양 말기 판정을 받은 것입니다.
치료비와 돌봄, 무거운 짐을 홀로 감당하는 화택 씨
민성이가 암 선고를 받았을 때, 떠난 아내와 겹쳐 보여 정말 힘들었다는 화택 씨. 꿋꿋하게 잘 버텨주고 있는 아들에게 고맙고 미안할 뿐입니다. 화택 씨는 작년 8월부터 편히 잠든 날이 없습니다. 민성이의 기저귀도 갈아주고, 자세도 바꿔주며 늘 민성이를 지켜봐야 하기 때문입니다. 현재 출장 세차 일을 하는 화택 씨. 하지만 그 수입 약 200만 원과 장애 수당 37만 원으로는 항암치료비 약 160만 원과 네 식구의 생활비를 감당하기에는 턱없이 부족합니다. 일의 특성상 매월 수입도 불안정하기에 화택 씨의 걱정은 이만저만이 아닙니다.
“민성이는 아빠가 책임지고 보살필게. 걱정하지 마.”
화택 씨는 언제부턴가 아프다고 말하는 법을 잊었습니다. 아픈 아내와 아들, 그리고 아이들 앞에서 항상 강한 가장이어야 했기 때문입니다. 민성이를 씻기고, 밥을 먹이며 늘 민성이의 곁을 지키는 화택 씨는 큰아들과 딸에게 미안한 마음뿐입니다. 그런 아빠의 마음을 아는지 힘든 내색 하나 없이 잘 자라준 남매. 그런 남매가 고맙고 대견한 화택 씨는 오늘도 마음을 다잡아 봅니다. 어렸을 때부터 우애가 좋은 아이들은 귀가하면 민성이를 꼭 안아주는 것이 일상입니다. 그런 아이들이 오로지 자신을 위해 인생을 살았으면 하는 마음뿐인 화택 씨입니다.
화택 씨 부자에게 버틸 수 있는 힘을 선물해 주세요
항암치료를 받고 힘들어하는 민성이를 볼 때면 가슴이 찢어지는 것만 같은 화택 씨. 민성이 앞에서는 최대한 웃어 보이지만, 뒤에선 눈물을 훔친 적이 많습니다. “민성아, 얼른 나아서 바다 보러 가자.” 화택 씨의 소망은 민성이가 다 나아서 온 가족이 함께 여행을 떠나는 것입니다. 꼼짝없이 침대에만 누워있는 아들이 말도 잘하고, 밥도 잘 먹으며 활기찼던 민성이로 다시 돌아오기를 바라는 화택 씨. 아들이 오래오래 아버지의 곁에 있기 위해서는 여러분의 도움이 필요합니다. 건강이라는 행복이 화택 씨 가정에 깃들 수 있도록 힘을 보태주세요.', 'campaign/두_번의_암_선고,_무너질_수_없는_아버지png.png', 78, 'campaign/아들_머리를_말리는_화택_씨.png', 12, 1);


