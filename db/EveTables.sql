drop view if exists MineralRefineBase;
drop view if exists Ore;
drop view if exists Mineral;

drop table if exists ItemType;
drop table if exists ItemGroup;
drop table if exists ItemMaterial;

create table ItemType
(
   itemTypeId int not null,
   groupId int not null,
   graphicId int null,
   raceId int null,
   marketGroupId int null,
   factionId int null,
   itemDescription text not null,
   itemName varchar(255) not null,
   basePrice decimal(28,2) null,
   constraint ItemType_PK primary key (itemTypeId)
) ;

create table ItemGroup
(
   itemGroupId int not null,
   iconId int null,
   itemGroupName varchar(255) not null,
   categoryId int null,
   constraint ItemGroup_PK primary key (itemGroupId)
);

create table ItemMaterial
(
   itemTypeId int not null,
   materialTypeId int not null,
   quantity int not null default(0),
   CONSTRAINT ItemMaterial_PK PRIMARY KEY (itemTypeId, materialTypeId)
);



create view Ore
as
select it.itemTypeId, it.itemName, it.itemDescription, it.groupId, ig.itemGroupName
  from ItemType it inner join ItemGroup ig on it.groupId = ig.itemGroupId
 where ig.categoryId = 25 and it.marketGroupId is not null;

create view Mineral
as
select it.itemTypeId, it.itemName, it.itemDescription
  from ItemType it
 where groupId = 18;


create view MineralRefineBase
as
select it.itemTypeId, it.itemName, im.quantity, o.itemTypeId as oreTypeId, o.itemName as oreName, o.groupId, o.itemGroupName
  from ItemType it 
 inner join ItemMaterial im on it.itemTypeId = im.materialTypeId
 inner join Ore o on o.itemTypeId = im.itemTypeId;


/*
select * from itemtype where itemName like 'Blue Ic%'
select * from itemType where itemTypeId = 34
select * from itemType where groupId = 18
select * from itemgroup where categoryId = 25
select * from ore order by itemName

select * from itemtype where marketGroupId = 1857

select * from ore order by itemGroupName
select * from mineral

select it.itemTypeId, it.itemName, im.quantity, o.itemTypeId, o.itemName, o.groupId, o.itemGroupName
  from ItemType it 
 inner join ItemMaterial im on it.itemTypeId = im.materialTypeId
 inner join Ore o on o.itemTypeId = im.itemTypeId

select it.itemTypeId, it.itemName, it.itemDescription, it.groupId, ig.itemGroupName
  from ItemType it inner join ItemGroup ig on it.groupId = ig.itemGroupId
 where ig.categoryId = 25 and it.marketGroupId is not null
*/




