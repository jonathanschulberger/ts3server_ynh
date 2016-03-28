delete from :tablename: where string_id = :string_id: ;
insert into :tablename: ( server_id, id, ident, value, string_id) 
    select :server_id:, 0, :ident*:, :value*:, :string_id:
    [[[union select :server_id:, 0, :ident*:, :value*:, :string_id:]]]