unit queryes;

interface
Const
sql_GetLoginInfo    = 'SELECT RTRIM(UPPER(SUSER_SNAME())) as UserName, @@SERVERNAME as ServerName, @@VERSION as ServerVersion, '+
                      'HOST_NAME() as HostName ,HOST_ID() as IP ,DB_NAME() as DBname';
sql_GetFilialInfo   = 'SELECT fil_id, fil_code, fil_name from ti_filials where active=1';
sql_GetFilials      = 'SELECT * FROM ti_filials order by fil_id';
sql_getrights       = 'select * from ti_Users where uname=:uname';
sql_GetUsers        = 'select * from ti_Users';
sql_sysusers        = 'select DISTINCT loginname = (case when (o.sid = 0x00) then NULL else l.loginname end),'+
                      'o.uid from dbo.sysusers o '+
                      'left join master.dbo.syslogins l on l.sid = o.sid '+
//                    'where ((o.issqlrole != 1 and o.isapprole != 1 and o.status != 0) or (o.sid = 0x00) and o.hasdbaccess = 1)and o.isaliased != 1 '+
                      'where ((o.issqlrole != 1 and o.isapprole != 1) or (o.sid = 0x00) and o.hasdbaccess = 1) and o.isaliased != 1 '+
                      'and not o.uid in (select uid from ti_Users) and (loginname is not null) '+
                      'order by loginname';
sql_GetTowns        = 'select * from ti_towns where fil_id=dbo.ti_fnGetActiveFilial() order by town_name';
sql_GetPrompl       = 'select a.*, b.town_name from ti_prompl a '+
                      'left join ti_towns b on a.town_id=b.town_id '+
                      'where a.fil_id=dbo.ti_fnGetActiveFilial() '+
                      'order by prompl_name';

implementation

end.
