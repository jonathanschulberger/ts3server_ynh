delete from :tablename: where id = :id: ;
insert into :tablename: ( server_id, id, ident, value) 
    select :server_id:, :id:, :ident*:, :value*:
    [[[ union select :server_id:, :id:, :ident*:, :value*:]]]