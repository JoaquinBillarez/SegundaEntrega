create database	if not exists aevo;
use aevo;

create table Persona (
id_Persona serial,
Nombre varchar (70) not null,
Fecha_Nac date not null,
primary key (id_Persona)
);

create table Usuario (
id_Persona bigint unsigned not null,
primary key (id_Persona),
foreign key (id_Persona) references Persona (id_Persona)
);

create table users (
  id int primary key AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL UNIQUE,
  email_verified_at timestamp NULL DEFAULT NULL,
  password varchar(255) NOT NULL,
  remember_token varchar(100) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL
);

create table Usuario_Gratuito (
id_Usuario  serial,
primary key (id_Usuario),
foreign key (id_Usuario) references Usuario (id_Persona)
);

create table Publicidad (
id_Publicidad serial,
Sponsor varchar (50),
Banner varchar (1000),
TamanioDeImagen varchar(50),
LinkBanner varchar(1000),
Posicion varchar(15),
primary key (id_Publicidad)
);

create table Tiene(
id_Usuario bigint unsigned not null,
id_Publicidad  bigint unsigned not null,
primary key (id_Usuario, id_Publicidad),
foreign key (id_Usuario) references Usuario_Gratuito (id_Usuario),
foreign key (id_Publicidad) references Publicidad (id_Publicidad)
);

create table Usuario_Pago (
id_Persona bigint unsigned not null,
id_Usuario  serial,
foreign key (id_Persona) references Usuario (id_Persona),
foreign key (id_Usuario) references Usuario (id_Persona)
);

create table Sancion (
id_Sancion serial,
id_Persona bigint unsigned not null,
primary key (id_Sancion),
foreign key (id_Persona) references Persona (id_Persona)
);

create table Sin_Tarjeta (
id_Sancion bigint unsigned not null,
foreign key (id_Sancion) references Sancion (id_Sancion)
);

create table Con_Tarjeta (
id_Sancion bigint unsigned not null,
Color varchar (10) not null,
foreign key (id_Sancion) references Sancion (id_Sancion)
);

create table Deporte (
id_Deporte serial,
Nombre varchar (50) not null,
Cant_Arbitros int not null,
Cant_Jugadores int not null,
primary key (id_Deporte)
);

create table Equipo (
id_Equipo serial,
id_Deporte bigint unsigned not null,
id_Evento bigint unsigned not null,
Nombre varchar (40) not null,
Cant_Jugadores int not null,
Logo varchar (1000) not null,
primary key (id_Equipo),
foreign key (id_Deporte) references Deporte (id_Deporte)
);

create table DT (
id_Persona  serial,
id_Equipo bigint unsigned not null,
primary key (id_Persona),
foreign key (id_Persona) references Persona (id_Persona),
foreign key (id_Equipo) references Equipo (id_Equipo)
);

create table DT_Equipo(
id_Equipo bigint unsigned not null,
id_Persona bigint unsigned not null,
primary key (id_Equipo),
foreign key (id_Equipo) references Equipo (id_Equipo),
foreign key (id_Persona) references DT (id_Persona)
);

create table Jugador (
id_Persona serial,
id_Equipo bigint unsigned not null,
id_Deporte bigint unsigned not null,
id_Jugador bigint unsigned not null,
primary key (id_Persona),
foreign key (id_Persona) references Persona (id_Persona),
foreign key (id_Deporte) references Deporte (id_Deporte)
);

create table Juega_en(
id_Jugador bigint unsigned not null,
id_Equipo bigint unsigned not null,
primary key (id_Jugador, id_Equipo),
foreign key (id_Jugador) references Jugador (id_Persona),
foreign key (id_Equipo) references Equipo (id_Equipo)
);

create table Deporte_Equipo (
id_Deporte bigint unsigned not null,
id_Equipo bigint unsigned not null,
primary key (id_Deporte, id_Equipo),
foreign key (id_Deporte) references Deporte (id_Deporte),
foreign key (id_Equipo) references Equipo (id_Equipo)
);

create table Evento (
id_Evento bigint unsigned not null,
id_Deporte bigint unsigned not null,
Fecha date not null,
Lugar varchar(100) not null,
Hora time not null,
primary key (id_Evento),
foreign key (id_Deporte) references Deporte (id_Deporte)
);

create table Arbitro (
id_Persona bigint unsigned not null,
id_Evento bigint unsigned not null,
primary key (id_Persona),
foreign key (id_Persona) references Persona (id_Persona),
foreign key (id_Evento) references Evento (id_Evento)
);


create table Sancion_Evento (
id_Sancion bigint unsigned not null,
id_Evento bigint unsigned not null,
primary key (id_Sancion, id_Evento),
foreign key (id_Sancion) references Sancion (id_Sancion),
foreign key (id_Evento) references Evento (id_Evento)
);

create table Supervisa (
id_Arbitro bigint unsigned not null,
id_Evento bigint unsigned not null,
primary key (id_Arbitro, id_Evento),
foreign key (id_Arbitro) references Arbitro (id_Persona),
foreign key (id_Evento) references Evento (id_Evento)
);

create table Usuario_Evento (
id_Evento bigint unsigned not null,
id_Usuario bigint unsigned not null,
primary key (id_Evento, id_Usuario),
foreign key (id_Evento) references Evento (id_Evento),
foreign key (id_Usuario) references Usuario (id_Persona)
);

create table Ligas (
id_Ligas serial,
Nombre varchar (50) not null,
Logo varchar (1000) not null,
id_Deporte bigint unsigned not null,
primary key (id_Ligas)
);

create table Ligas_Evento (
id_Ligas  bigint unsigned not null,
id_Evento  bigint unsigned not null,
primary key (id_Ligas, id_Evento),
foreign key (id_Ligas) references Ligas (id_Ligas),
foreign key (id_Evento) references Evento (id_Evento)
);

create table Resultados (
id_Resultado serial,
id_Evento bigint unsigned not null,
Resultado varchar (50),
primary key (id_Resultado),
foreign key (id_Evento) references Evento (id_Evento)
);

create table Por_Tanto(
id_Resultado  bigint unsigned not null,
Tanto_Visitante int not null,
Tanto_Local int not null,
primary key (id_Resultado),
foreign key (id_Resultado) references Resultados (id_Resultado)
);

create table Por_Sets(
id_Resultado  bigint unsigned not null,
primary key (id_Resultado),
foreign key (id_Resultado) references Resultados (id_Resultado)
);

create table Por_Marca(
id_Resultado  bigint unsigned not null,
primary key (id_Resultado),
foreign key (id_Resultado) references Resultados (id_Resultado)
);


create table Sets(
id_Resultado bigint unsigned not null,
Sets_Visitante int not null,
Sets_Local int not null,
primary key (id_Resultado),
foreign key (id_Resultado) references Por_Sets (id_Resultado)
);

create table Marca(
id_Resultado bigint unsigned not null,
Tiempo time,
primary key (id_Resultado),
foreign key (id_Resultado) references Por_Marca (id_Resultado)
);

create table Membresia(
id_Usuario serial,
primary key (id_Usuario),
foreign key (id_Usuario) references Usuario_Pago (id_Usuario)
);

create user Administrador identified by '2694';
grant all privileges on aevo.* to Administrador;  

create user userRegistrado identified by '12345';
grant select on Usuario_Gratuito to userRegistrado;

create user userPago identified by '98765';
grant select on Usuario_Pago to userPago;
grant Update, insert, drop on Membresia to userPago;

insert into Deporte ( Nombre, Cant_Arbitros, Cant_Jugadores) values ('Football', 1, 22);
insert into Deporte ( Nombre, Cant_Arbitros, Cant_Jugadores) values ('Basketball', 3, 10);
insert into Deporte ( Nombre, Cant_Arbitros, Cant_Jugadores) values ('Tennis', 1, 2);
insert into Deporte ( Nombre, Cant_Arbitros, Cant_Jugadores) values ('Volleyball', 8, 12);
insert into Deporte ( Nombre, Cant_Arbitros, Cant_Jugadores) values ('Ciclismo', 3, 16);

insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (1, 1, '2022-09-27', 'Estadio Centenario' , '16:00:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (2, 1, '2023-01-10', 'Gran Parque Central' , '11:30:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (3, 1, '2022-09-09', 'Anoeta España' , '19:00:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (4, 1, '2022-12-13', 'Estadio Centenario' , '23:30:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (5, 1, '2023-01-20', 'La Bombonera' , '16:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (6, 2, '2022-11-19', 'Defensor Sporting' , '14:00:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (7, 2, '2022-10-25', 'Boston CELTICS' , '15:00:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (8, 2, '2023-02-03', 'Papuya Mexico' , '01:15:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (9, 2, '2022-09-01', 'Toronto Raptors' , '18:40:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (10, 2, '2022-11-19', 'Orlando Magic' , '13:25:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (11, 3, '2022-10-12', 'Arthur Ashe' , '17:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (12, 3, '2022-10-25', 'O2 Arena' , '19:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (13, 3, '2022-09-21', 'Bercy Arena' , '12:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (14, 3, '2022-12-07', 'Shin tho ni' , '11:30:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (15, 3, '2022-09-19', 'Estadio IGA' , '00:00:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (16, 4, '2022-09-15', 'Wetherby Gymnasium' , '12:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (17, 4, '2022-11-29', 'Wisconsin Field House' , '13:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (18, 4, '2022-12-03', 'Pollitos Volley' , '22:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (19, 4, '2022-12-03', 'University Gymnasium' , '16:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (20, 4, '2022-10-16', 'Thomas J. Frericks Center' , '18:45:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (21, 5, '2022-10-25', 'Maracuya SPX' , '10:40:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (22, 5, '2022-09-22', 'Velodromo' , '14:00:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (23, 5, '2022-09-03', 'Recreo Belvedere' , '21:00:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (24, 5, '2023-02-12', 'TERRA Gvx' , '11:30:00');
insert into Evento (id_Evento, id_Deporte, Fecha, Lugar, Hora) values (25, 5, '2022-03-13', 'Le Blediu Fontá' , '18:15:00');

insert into Ligas (id_Ligas, Nombre, Logo, id_Deporte) values (1, 'Francesa', 'https://th.bing.com/th/id/R.9c44c35523f4a9290c0a7daa7ccaf998?rik=eG%2b32wGeYjPovA&riu=http%3a%2f%2f2.bp.blogspot.com%2f-CHvqQ_z0Hc0%2fUf5FUwOlfYI%2fAAAAAAAAB10%2fPL_PxPdN-Cg%2fs1600%2fCHAPA%2bLIGA%2bFRANCIA.png&ehk=%2fJy7V3UtMKOyjBi%2bxivwQVkuarpXE7TIYTueH0%2b0%2bP8%3d&risl=&pid=ImgRaw&r=0', 1);
insert into Ligas (id_Ligas, Nombre, Logo, id_Deporte) values (2, 'Italiana', 'https://www.bing.com/images/search?view=detailV2&ccid=UdLbsG6M&id=B3704F835B1F5503893542F5E2DDEDD4CE0CFDBF&thid=OIP.UdLbsG6MWuqEus3WnNZpFQHaHa&mediaurl=https%3a%2f%2fimg.planetafobal.com%2f2019%2f05%2flega-serie-a-tim-2019-2020-new-logo-ps.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.51d2dbb06e8c5aea84bacdd69cd66915%3frik%3dv%252f0MztTt3eL1Qg%26pid%3dImgRaw%26r%3d0&exph=1511&expw=1511&q=liga+italiana+logo&simid=608012699203998626&FORM=IRPRST&ck=428511F7526EB46D3D34CD18412CB131&selectedIndex=8', 1);
insert into Ligas (id_Ligas, Nombre, Logo, id_Deporte) values (3, 'Inglesa', 'https://th.bing.com/th/id/R.ca3be476b29a2307d58f680e87d17983?rik=j1gHUSotr6fl0Q&riu=http%3a%2f%2f2.bp.blogspot.com%2f-xvmPGmJoNcU%2fTqRCWLvNJ_I%2fAAAAAAAAAFQ%2fH6Nr0LlIvkA%2fs1600%2fbarclays%2bpremier%2bleague.jpg&ehk=ws%2b0Lu1RsSS7RIBKElPOts0xn5jFnOGO7YMWBbSb5Nk%3d&risl=&pid=ImgRaw&r=0', 1);
insert into Ligas (id_Ligas, Nombre, Logo, id_Deporte) values (4, 'Estadounidense', 'https://www.bing.com/images/search?view=detailV2&ccid=OOXLN9Ix&id=66362D2D0B6C8D9CEA2200417CB3E58A01A842E8&thid=OIP.OOXLN9IxBXGwvbLdUt4oawHaEK&mediaurl=https%3a%2f%2flogosmarcas.net%2fwp-content%2fuploads%2f2020%2f11%2fNational-Basketball-Association-Logo.png&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.38e5cb37d2310571b0bdb2dd52de286b%3frik%3d6EKoAYrls3xBAA%26pid%3dImgRaw%26r%3d0&exph=2160&expw=3840&q=nba+logo&simid=608004822230569555&FORM=IRPRST&ck=A91285EA287A8EBC57412002686CD085&selectedIndex=0', 2);
insert into Ligas (id_Ligas, Nombre, Logo, id_Deporte) values (5, 'Brasilera', 'https://www.bing.com/images/search?view=detailV2&ccid=%2bPFIO42D&id=88B67774C30A1F97A0AB9670174A085BEF2D7C52&thid=OIP.-PFIO42D-3CcP59yAuFZGgHaDn&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.f8f1483b8d83fb709c3f9f7202e1591a%3frik%3dUnwt71sIShdwlg%26riu%3dhttp%253a%252f%252f3.bp.blogspot.com%252f-i2Fw6LuvqLU%252fT_78mex8wxI%252fAAAAAAAABes%252fgt0PVI_nQkI%252fs1600%252fbrasil.gif%26ehk%3dEXhbdeeOS9Ya4lgLLrpd0YS6TyAU0Nw3%252bdVpfg8UP6I%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=632&expw=1296&q=logo+liga+de+volleyball+brasil&simid=608040165525779192&FORM=IRPRST&ck=FC14D333960A79473B0B9D5CDE5AFF0B&selectedIndex=0', 4);

insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(1, 1, 'PSG', 11, 'https://www.bing.com/ck/a?!&&p=74213bc37783e0ccJmltdHM9MTY2MTg4MzIwNSZpZ3VpZD00ZjliNGM0Mi0xZGY0LTQwOWEtYWM1YS04ODMxMTJlZThmM2UmaW5zaWQ9NTQwMQ&ptn=3&hsh=3&fclid=704f29c6-288f-11ed-9dcf-62584b90c6ff&u=a1L2ltYWdlcy9zZWFyY2g_cT1sb2dvK3BzZyZpZD00Mjc1QkMwNEExMjBFMDZENkE3MkRBMEQ4Q0EzRjlFODBBNzE3RDdDJkZPUk09SVFGUkJB&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(1, 1, 'Juventus', 11, 'https://www.bing.com/ck/a?!&&p=eb293c93f3f7c0eaJmltdHM9MTY2MTg4NDkyMiZpZ3VpZD1lNzljYmQ3My1jYWY4LTQ3MzQtYWRlMy00NDVlOGY2MDdhOGMmaW5zaWQ9NTQxNw&ptn=3&hsh=3&fclid=6fa9765c-2893-11ed-ad60-1971a7fdb58f&u=a1L2ltYWdlcy9zZWFyY2g_cT1sb2dvK2p1dmVudHVzJmlkPTVEMDU3NzE1QjVGN0VGQ0U3MkY2RjU4ODIzNTI0Njc4MTZCQ0EwMUEmRk9STT1JUUZSQkE&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(1, 6, 'Francia', 11, 'https://www.bing.com/ck/a?!&&p=62d25a4c75b5cff2JmltdHM9MTY2MTg4NDkxMCZpZ3VpZD1mZmNhNDZmMi00ZmYwLTQzNGEtOTc5Yy02NmNmYzU0OGJiNmQmaW5zaWQ9NTQzNg&ptn=3&hsh=3&fclid=68cee087-2893-11ed-9595-e8bd43051bcf&u=a1L2ltYWdlcy9zZWFyY2g_cT1sb2dvK21hbmNoZXN0ZXIrY2l0eSZpZD0xRDA0QjhEQzE4MjFGNTIxMUQ5OEM1RjQ4OEE5RUNFQURBRDNCNTU4JkZPUk09SVFGUkJB&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(2, 6, 'Angeles Lakers', 5, 'https://www.bing.com/ck/a?!&&p=7fc2d7e42b8d4ab2JmltdHM9MTY2MTg4NDg0MCZpZ3VpZD0wYjZjMDY5Ny0yYzJlLTQ0M2YtOWJjZC01MDE0ZDZjNDJjODgmaW5zaWQ9NTQyOA&ptn=3&hsh=3&fclid=3ef9e0de-2893-11ed-8f0b-b0b21c536102&u=a1L2ltYWdlcy9zZWFyY2g_cT1sb2dvK2xha2VycyZpZD1GM0U1ODdCRUE0NDZGMUNFN0ZCMkExM0Y1RTk2RkI1NjI2MzhEMEQ5JkZPUk09SVFGUkJB&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(2, 6, 'Miami Heats', 5, 'https://www.bing.com/ck/a?!&&p=144f81af5b678ce7JmltdHM9MTY2MTg4NDg1OSZpZ3VpZD0yMzQ2MmVjYi1iZDczLTQwNTctYTBhNi05OWZjNzRjZTVkODMmaW5zaWQ9NTQwNQ&ptn=3&hsh=3&fclid=4a52e4d2-2893-11ed-b68c-b7ef95b3cddc&u=a1L2ltYWdlcy9zZWFyY2g_cT1sb2dvK21pYW1pK2hlYXQmaWQ9ODM1Qjc3MTcyM0Q1QkM5QzkyQjk2MjM3OTMzQzJDODM3OUY2MzQyNSZGT1JNPUlRRlJCQQ&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(2, 3, 'Chicago Bulls', 5, 'https://www.bing.com/ck/a?!&&p=2b592ca8b47693a3JmltdHM9MTY2MTg4NDg3NiZpZ3VpZD0yNzIzYzljOS04MjMxLTRmZGYtYWIxMy00NDkxOTA1ZWQ2MTEmaW5zaWQ9NTQyMg&ptn=3&hsh=3&fclid=5453a677-2893-11ed-a2ae-efabcd957fe7&u=a1L2ltYWdlcy9zZWFyY2g_cT1sb2dvK2NoaWNhZ28rYnVsbHMmaWQ9Qzk0M0UzN0JGRDJGNkY5QjI3NTRDNjc4MUMzOEM4QTEwNjZCQUQ4MCZGT1JNPUlRRlJCQQ&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(4, 4, 'Minas', 6, 'https://www.bing.com/ck/a?!&&p=8e02da48ea294801JmltdHM9MTY2MTg4NDg5NyZpZ3VpZD00ZDA1Y2ZjYS1hZjc1LTQxZGItYTNmMC1jMGI1ZTcyOTRjYzEmaW5zaWQ9NTM2NQ&ptn=3&hsh=3&fclid=60d7d733-2893-11ed-9c67-dca2e7d24f7c&u=a1L2ltYWdlcy9zZWFyY2g_cT1sb2dvK21pbmFzK3ZvbGV5JmlkPTlEODZBRTdCQTkwMjNBQjMwOERGQzRGM0NCMTE1RDdBQUFBNzFFNjEmRk9STT1JUUZSQkE&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(4, 4, 'Volei Renata', 6, 'https://www.bing.com/images/search?view=detailV2&ccid=tz%2btXjLq&id=93676DAD87023677091594D5B04260C55F8C72B6&thid=OIP.tz-tXjLqinmd7XFW_AmIUgAAAA&mediaurl=https%3a%2f%2f2.bp.blogspot.com%2f-1HNYIsQUUco%2fWeJQiCUkk3I%2fAAAAAAABSLM%2fLanx78R0KiMelTBEoajaktgMbQaG-lFtQCLcBGAs%2fs320%2fV%2525C3%252594LEI%252BRENATA%252B-%252BCAMPINAS%252B-%252BSP.png&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.b73fad5e32ea8a799ded7156fc098852%3frik%3dtnKMX8VgQrDVlA%26pid%3dImgRaw%26r%3d0&exph=202&expw=320&q=escudo+club+volei+renata&simid=607990159227514071&FORM=IRPRST&ck=453D74E4ED6F7570C30FF542C811E4A6&selectedIndex=0');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values(4, 5, 'Uruguay', 6, 'https://www.bing.com/ck/a?!&&p=5ebd80e7c13551a3JmltdHM9MTY2MTg4MzU3NSZpZ3VpZD1mZmE5MzAzZS01ZjIwLTQ4N2QtOTg0YS1mNzFkZWI1MjM0NTkmaW5zaWQ9NTQyMQ&ptn=3&hsh=3&fclid=4ce51bf9-2890-11ed-ac9e-104c3a83057b&u=a1L2ltYWdlcy9zZWFyY2g_cT1lc2N1ZG8rc2FkYStjcnV6ZWlybyZpZD0zMEJFNTZFNjg4QkI0QjE1OTI3QTc0NDU3N0ZCOTdCRTREMkI3ODA3JkZPUk09SVFGUkJB&ntb=1');
insert into Equipo ( id_Deporte, id_Evento, Nombre, Cant_Jugadores, Logo) values( 4, 5, 'Uruguay', 6, 'https://www.bing.com/ck/a?!&&p=5ebd80e7c13551a3JmltdHM9MTY2MTg4MzU3NSZpZ3VpZD1mZmE5MzAzZS01ZjIwLTQ4N2QtOTg0YS1mNzFkZWI1MjM0NTkmaW5zaWQ9NTQyMQ&ptn=3&hsh=3&fclid=4ce51bf9-2890-11ed-ac9e-104c3a83057b&u=a1L2ltYWdlcy9zZWFyY2g_cT1lc2N1ZG8rc2FkYStjcnV6ZWlybyZpZD0zMEJFNTZFNjg4QkI0QjE1OTI3QTc0NDU3N0ZCOTdCRTREMkI3ODA3JkZPUk09SVFGUkJB&ntb=1');


insert into Persona ( Nombre, Fecha_Nac) values ('Pablo Bruchi', '1987-04-12');
insert into Persona ( Nombre, Fecha_Nac) values ('Franchezco Milinieal', '1994-10-15');
insert into Persona ( Nombre, Fecha_Nac) values ('Cristiano Ronaldo', '1990-07-23');
insert into Persona ( Nombre, Fecha_Nac) values ('Lionel Messi', '1989-12-02');
insert into Persona ( Nombre, Fecha_Nac) values ('Julian Alvarez', '1985-02-05');
insert into Persona ( Nombre, Fecha_Nac) values ('Lautaro Martinez', '1994-04-24');
insert into Persona ( Nombre, Fecha_Nac) values ('Rodrigo De paul', '1991-10-19');
insert into Persona ( Nombre, Fecha_Nac) values ('German Pezzella', '2000-04-09');
insert into Persona ( Nombre, Fecha_Nac) values ('Ivan Royes', '1987-04-20');
insert into Persona ( Nombre, Fecha_Nac) values ('Martin Vidal', '2005-03-27');
insert into Persona ( Nombre, Fecha_Nac) values ('Sebastian camp', '1999-12-02');
insert into Persona ( Nombre, Fecha_Nac) values ('Carlos Rodriguez', '2001-02-28');
insert into Persona ( Nombre, Fecha_Nac) values ('Hector Herrera', '1991-04-01');
insert into Persona ( Nombre, Fecha_Nac) values ('Jesus Gallardo', '1997-10-27');
insert into Persona ( Nombre, Fecha_Nac) values ('Francisco Zugarramurdi', '1990-10-12');
insert into Persona ( Nombre, Fecha_Nac) values ('Joaquin Abete', '2000-02-15');
insert into Persona ( Nombre, Fecha_Nac) values ('Edson Alvarez', '1995-06-29');
insert into Persona ( Nombre, Fecha_Nac) values ('Joaquin Billarez', '1999-12-20');
insert into Persona ( Nombre, Fecha_Nac) values ('Carmelo Coco', '1991-12-11');
insert into Persona ( Nombre, Fecha_Nac) values ('Agustin Cardozo', '1985-01-05');
insert into Persona ( Nombre, Fecha_Nac) values ('German Vidal', '1986-03-15');
insert into Persona ( Nombre, Fecha_Nac) values ('Jesus Carameli', '1984-09-29');
insert into Persona ( Nombre, Fecha_Nac) values ('Franco Sauco', '1991-11-02');
insert into Persona ( Nombre, Fecha_Nac) values ('Faustino Diaz', '1998-05-17');
insert into Persona ( Nombre, Fecha_Nac) values ('Matias Cristiano', '2001-01-01');
insert into Persona ( Nombre, Fecha_Nac) values ('Richard Jhonson', '2002-10-09');
insert into Persona ( Nombre, Fecha_Nac) values ('Adrian Lacoste', '1986-12-01');
insert into Persona ( Nombre, Fecha_Nac) values ('Ezequiel Ramposn', '1991-04-07');
insert into Persona ( Nombre, Fecha_Nac) values ('Paulo Londra', '2001-05-20');
insert into Persona ( Nombre, Fecha_Nac) values ('Nicolas Esquema', '1989-08-30');
insert into Persona ( Nombre, Fecha_Nac) values ('Enrique Cubo', '1999-12-13');
insert into Persona ( Nombre, Fecha_Nac) values ('Sergio Altenado', '1990-09-09');
insert into Persona ( Nombre, Fecha_Nac) values ('Rodrigo Michelini', '1995-12-25');
insert into Persona ( Nombre, Fecha_Nac) values ('Michael Soñas', '1988-01-19');
insert into Persona ( Nombre, Fecha_Nac) values ('Gabriel Angel', '2001-07-29');
insert into Persona ( Nombre, Fecha_Nac) values ('Marengo Peñato', '1988-04-03');
insert into Persona ( Nombre, Fecha_Nac) values ('Martin De Pedro', '1992-12-03');
insert into Persona ( Nombre, Fecha_Nac) values ('Camilo Duarte', '1993-02-21');
insert into Persona ( Nombre, Fecha_Nac) values ('Ramiro Sierra', '1993-08-06');
insert into Persona ( Nombre, Fecha_Nac) values ('Ernesto Alvarez', '1999-12-24');
insert into Persona ( Nombre, Fecha_Nac) values ('Nestor Nuñoz', '1997-02-18');
insert into Persona ( Nombre, Fecha_Nac) values ('Santiago Miranda', '1992-10-10');
insert into Persona ( Nombre, Fecha_Nac) values ('Leonardo Dicaprio', '1990-03-28');
insert into Persona ( Nombre, Fecha_Nac) values ('Josepo Almidon', '1999-01-08');
insert into Persona ( Nombre, Fecha_Nac) values ('Letunio Pereira', '1983-12-11');
insert into Persona ( Nombre, Fecha_Nac) values ('Luis Suarezon', '1990-10-18');
insert into Persona ( Nombre, Fecha_Nac) values ('Nicolas De Pedro', '1988-01-29');

insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 1);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 2);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 3);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 4);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 5);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 6);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 7);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 8);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values (1, 1, 9);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 1, 1, 10);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 1, 1, 11);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 12);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 13);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 14);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 15);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 16);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 17);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 18);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 19);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 20);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 21);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 2, 1, 22);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 5, 2, 23);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 5, 2, 24);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 5, 2, 25);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 5, 2, 26);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 5, 2, 27);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 8, 4, 28);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 8, 4, 29);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 8, 4, 30);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 8, 4, 31);
insert into Jugador ( id_Equipo, id_Deporte, id_Jugador) values ( 8, 4, 32);

insert into DT ( id_Equipo) values ( 1);
insert into DT ( id_Equipo) values ( 2);
insert into DT ( id_Equipo) values ( 3);
insert into DT ( id_Equipo) values ( 4);
insert into DT ( id_Equipo) values ( 5);
insert into DT ( id_Equipo) values ( 6);
insert into DT ( id_Equipo) values ( 7);
insert into DT ( id_Equipo) values ( 8);
insert into DT ( id_Equipo) values ( 9);
insert into DT ( id_Equipo) values ( 10);

insert into Arbitro (id_Persona, id_Evento) values (43, 1);
insert into Arbitro (id_Persona, id_Evento) values (44, 4);
insert into Arbitro (id_Persona, id_Evento) values (45, 2);
insert into Arbitro (id_Persona, id_Evento) values (46, 8);
insert into Arbitro (id_Persona, id_Evento) values (47, 3);

insert into Resultados ( id_Evento, Resultado) values ( 1, '0-1');
insert into Resultados ( id_Evento, Resultado) values ( 2, '2-0');
insert into Resultados ( id_Evento, Resultado) values ( 3, '2-2');
insert into Resultados ( id_Evento, Resultado) values ( 4, '4-1');
insert into Resultados ( id_Evento, Resultado) values ( 5, '0-0');
insert into Resultados ( id_Evento, Resultado) values ( 6, '45-43');
insert into Resultados ( id_Evento, Resultado) values ( 7, '90-54');
insert into Resultados ( id_Evento, Resultado) values ( 8, '32-32');
insert into Resultados ( id_Evento, Resultado) values ( 9, '60-10');
insert into Resultados ( id_Evento, Resultado) values ( 10, '80-90');

insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Antel", "https://www.google.com/imgres?imgurl=https%3A%2F%2Flookaside.fbsbx.com%2Flookaside%2Fcrawler%2Fmedia%2F%3Fmedia_id%3D5361373417238502&imgrefurl=https%3A%2F%2Fwww.facebook.com%2FAntelDeTodos%2Fposts%2Fcambios-en-la-atenci%25C3%25B3n-al-p%25C3%25BAblico-en-virtud-de-la-emergencia-sanitariaconoc%25C3%25A9-m%25C3%25A1s%2F5361375303904980%2F&tbnid=pZPYTIsVeiqN4M&vet=12ahUKEwiEhZ6Q1ZX6AhVmqpUCHRJnDZ4QMygNegUIARD3AQ..i&docid=4ee45GquvLGOHM&w=1024&h=680&q=antel&ved=2ahUKEwiEhZ6Q1ZX6AhVmqpUCHRJnDZ4QMygNegUIARD3AQ", "600px, 540px", "antel.com.uy", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Antel", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fudelar.edu.uy%2Fportal%2Fwp-content%2Fuploads%2Fsites%2F48%2F2022%2F02%2Fplan_UDELAR_1200x740.png&imgrefurl=https%3A%2F%2Fudelar.edu.uy%2Fportal%2F2022%2F02%2Fconvenio-entre-antel-y-udelar-crea-nuevo-plan%2F&tbnid=vvpjFjlUfRuYoM&vet=12ahUKEwjCi6jal5j6AhUvu5UCHTqjCEoQMyg4egQIARBv..i&docid=sewygz_tpM8ZTM&w=1201&h=740&q=antel&ved=2ahUKEwjCi6jal5j6AhUvu5UCHTqjCEoQMyg4egQIARBv", "600px, 540px", "antel.com.uy", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Adidas", "https://www.roc21.com/2006/07/11/revistas-3/", "400px, 300px", "adidas.com", "Derecha" );
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Adidas", "https://www.merca20.com/no-solo-nike-con-cr7-adidas-presenta-su-nuevo-modelo-de-zapatos-de-futbol-con-messi-en-el-centro-de-su-campana/", "562px, 563px", "adidas.com", "Derecha" );
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Reebok", "https://www.merca20.com/reebok-revive-uno-de-sus-modelos-clasicos-con-una-campana-que-lleva-de-nostalgia/", "1280px, 720px", "stadium.com.uy", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Nike", "https://www.pinterest.com/pin/186758715788054764/", "736px, 495px", "nike.com", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Nike", "https://www.pinterest.com.mx/pin/614248836678651356/", "1080px, 1350px", "nike.com", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Nike", "https://www.revistagq.com/moda/articulo/air-jordan-1-anuncio-sancion-nba-nike", "1600px, 900px", "nike.com", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Nike", "https://www.pinterest.es/pin/80079699598664408/", "600px, 846px", "nike.com", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Gatorade", "http://www.adlatina.com/publicidad/la-bebida-oficial-del-deporte", "570px, 380px", "gatorade.lat", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Gatorade", "https://www.taringa.net/+hazlo_tu_mismo/el-tan-famoso-gatorade-se-puede-hacer-casero_131w79", "400px, 285px", "gatorade.lat", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Gatorade", "https://www.pinterest.es/pin/406731410091494885/", "600px, 454px", "gatorade.lat", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Gatorade", "https://lapublicidad.net/isla-gano-la-cuenta-de-gatorade-en-brasil/", "600px, 454px", "gatorade.lat", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Pepsi", "https://controlpublicidad.com/campanas-publicitarias/pepsi-lanza-la-campana-play-to-inspire/", "800px, 488px", "pepsi.com", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Pepsi", "https://www.totalmedios.com/nota/48660/nada-como-el-sabor-de-una-botella-100-reciclada-la-nueva-campana-360-de-pepsi", "838px, 390px", "pepsi.com", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Pepsi", "https://www.anda.cl/famoso-influencer-espanol-ibai-llanos-protagoniza-nueva-campana-de-pepsi-zero/", "1900px, 900px", "pepsi.com", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("Pepsi", "https://www.mercadonegro.pe/publicidad/pepsi-es-lo-que-quiero-es-el-nuevo-slogan-de-pepsi/", "1000px, 561px", "pepsi.com", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("CocaCola", "https://www.latinspots.com/sp/noticia/coca-cola-y-una-promocin-para-que-todos-se-lleven-una-a-sus-casas/43692", "800px, 390px", "cocacola.es", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("CocaCola", "https://www.latinspots.com/sp/campana/campaa-coca-cola-frases/19821/4490", "800px, 412px", "cocacola.es", "Izquierda");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("CocaCola", "https://lapublicidad.net/coca-cola-se-inspira-en-el-espacio-para-lanzar-su-nuevo-sabor/", "800px, 600px", "cocacola.es", "Derecha");
insert into Publicidad (Sponsor, Banner, TamanioDeImagen, LinkBanner, Posicion) values ("CocaCola", "https://tecnovery.com/2020/06/26/coca-cola-anuncios/", "768px, 490px", "cocacola.es", "Derecha");

