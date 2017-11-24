create table Kendaraan(
	Nomer_Plat varchar2(10),
	Nama_Kendaraan varchar2(10),
	Jenis_Kendaraan varchar2(5),
	Nomer_Identitas varchar2(20),
	Primary key (Nomer_Plat),
	constraint fk_Kendaraan Foreign key (Nomer_Identitas) references Pelanggan (Nomer_Identitas)
);

create table Membership(
	Id_Member varchar2(10),
	Nomer_Identitas varchar2(10),
	Primary key (Id_Member),
	constraint fk_Membership Foreign key (Nomer_Identitas) references Pelanggan (Nomer_Identitas)
);

create table Pegawai(
	Id_Pegawai varchar2(10),
	Nama_Pegawai varchar2(10),
	Nomer_Telepon varchar2(10),
	Id_Manager varchar2(10),
	Id_Divisi varchar2(10),
	Primary key (Id_Pegawai, Id_Divisi)
);

create table PJ_Barang (
	Id_Pegawai varchar2(10),
	Nama_PjBarang varchar2(20),
	Nomer_Telepon varchar2(15),
	Id_Divisi varchar2(10),
	Primary key (Id_Pegawai, Id_Divisi),
	constraint FK_PJ_Barang Foreign key (Id_Pegawai, Id_Divisi) references Pegawai (Id_Pegawai, Id_Divisi)
);

create table Kasir(
	Id_Pegawai varchar2(10), --- perbaiki pknya ---
	Nama_Kasir varchar2(20),
	Nomer_Telepon varchar2(15),
	Id_Divisi varchar2(10),
	Primary key (Id_Pegawai, Id_Divisi),
	constraint FK_Kasir Foreign key (Id_Pegawai, Id_Divisi) references Pegawai (Id_Pegawai, Id_Divisi)
);

create table Security(
	Id_Pegawai varchar2(10),
	Nama_Security varchar2(20),
	Nomer_Telepon varchar2(15),
  Id_Divisi varchar(10),
	Primary key (Id_Pegawai, Id_Divisi),
	constraint FK_Security Foreign key (Id_Pegawai, Id_Divisi) references Pegawai (Id_Pegawai, Id_Divisi)
);

create table montir(
	Id_Pegawai varchar2(10), --- perbaiki pk nya ----
	Nama_Montir varchar2(20),
	Nomer_Telepon varchar2(15),
	Id_Divisi varchar2(10),
	Primary key (Id_Pegawai, Id_Divisi),
	constraint FK_Montir Foreign key (Id_Pegawai, Id_Divisi) references Pegawai (Id_Pegawai, Id_Divisi)
);

Alter Table Manager 
add Id_Pegawai varchar2(10);

alter table manager
add constraint fk_Manager Foreign Key (Id_Pegawai)
references Pegawai (Id_Pegawai);

Alter table Pegawai
add constraint fk_Pegawai Foreign key (Id_Manager)
references Manager (Id_Manager);

create table Detil_Pelayanan(
	Id_Pelayanan varchar2(10),
	Id_Pegawai varchar2(10),
	Nomer_Identitas varchar2(20)
);

create table R_Memiliki(
	Kode_Shift varchar2(10),
	Id_Pegawai varchar2(10),
	Primary key (Kode_Shift, Id_Pegawai)
);

create table Bertanggung_Jawab(
	Id_Pegawai varchar2(10),
	Id_Barang varchar2(10),
	Primary key (Id_Barang, Id_Pegawai),
  constraint fk_Bertanggung_Jawab foreign key (Id_Pegawai) references PJ_Barang (Id_Pegawai)
);

create table R_Menggunakan(
	Id_Alat varchar2(10),
	Id_Pegawai varchar2(10),
	Primary key (Id_Alat, Id_Pegawai) -- fk blm
);

alter table Detil_