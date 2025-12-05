-- below qury insertin when static cursor running----------

insert into forcursor values('Deepti',450000);

--- below query inserting when dynamic cursor running

insert into forcursor values('Deep',660000);

--- below query inserting when keyset cursor running
-- update and delete , -- any changes for existing records allowed , rest not allowed

update forcursor
set salary=salary+1000
where name='Deepti'





