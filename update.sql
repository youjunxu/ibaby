
insert into tb_batype (lmname) values('认知多一点');

insert into tb_batype (lmname) values('健康加一点');

insert into tb_batype (lmname) values('动手勤一点');

insert into tb_batype (lmname) values('天天学一点');

insert into tb_batype (lmname) values('扮靓美一点');


update tb_lmbaxy  set lmcode=(select b.lmid from tb_batype b where b.LMNAME='认知多一点') where lmname='认知';
update tb_lmbaxy  set lmname='认知多一点' where lmcode=(select b.lmid from tb_batype b where b.LMNAME='认知多一点');

update tb_lmbaxy  set lmcode=(select b.lmid from tb_batype b where b.LMNAME='健康加一点') where lmname in ('保健', '体育', ' 零食 ', '食谱', '饮品');
update tb_lmbaxy  set lmname='健康加一点' where lmcode=(select b.lmid from tb_batype b where b.LMNAME='健康加一点');

update tb_lmbaxy  set lmcode=(select b.lmid from tb_batype b where b.LMNAME='动手勤一点') where lmname in ('手工','游戏');
update tb_lmbaxy  set lmname='动手勤一点' where lmcode=(select b.lmid from tb_batype b where b.LMNAME='动手勤一点');

update tb_lmbaxy  set lmcode=(select b.lmid from tb_batype b where b.LMNAME='天天学一点') where lmname='读本';
update tb_lmbaxy  set lmname='天天学一点' where lmcode=(select b.lmid from tb_batype b where b.LMNAME='天天学一点');

update tb_lmbaxy  set lmcode=(select b.lmid from tb_batype b where b.LMNAME='扮靓美一点') where lmname in ('扮靓', '居家');
update tb_lmbaxy  set lmname='扮靓美一点' where lmcode=(select b.lmid from tb_batype b where b.LMNAME='扮靓美一点');



update tb_tags  set catalog_id=(select b.lmid from tb_batype b where b.LMNAME='认知多一点') where catalog_id in (select lmid from tb_batype where lmname = '认知');

update tb_tags  set catalog_id=(select b.lmid from tb_batype b where b.LMNAME='健康加一点') where catalog_id in (select lmid from tb_batype where lmname in ('保健', '体育', ' 零食 ', '食谱', '饮品'));

update tb_tags  set catalog_id=(select b.lmid from tb_batype b where b.LMNAME='动手勤一点') where catalog_id in (select lmid from tb_batype where lmname in ('手工','游戏'));

update tb_tags  set catalog_id=(select b.lmid from tb_batype b where b.LMNAME='天天学一点') where catalog_id in (select lmid from tb_batype where lmname='读本');

update tb_tags  set catalog_id=(select b.lmid from tb_batype b where b.LMNAME='扮靓美一点') where catalog_id in (select lmid from tb_batype where lmname in ('扮靓', '居家'));




