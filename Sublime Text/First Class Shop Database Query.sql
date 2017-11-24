Tubes PBD "First Class Shop";

create table Pelanggan(
	Nomer_Identitas varchar2(10),
	Nama_Pelanggan varchar2(20),
	Nomer_Telepon varchar2(16),
	Alamat_Pelanggan varchar2(50),
	Primary key (Nomer_Identitas)
);

create table Shift(
	Kode_Shift varchar2(10),
	Periode_Awal DATE,
	Perode_Akhir DATE,
	Primary key (Shift)
);

create table pelayanan(
	Id_Pelayanan varchar2(10),
	Jenis_Pelayanan varchar2(10),
	Total_Harga number,
	Primary key (Id_Pelayanan)
);

create table Manager(
	Id_Manager varchar2(10),
	Nama_Manager varchar2(20),
	Nomer_Telepon varchar2(15),
	Primary key (Id_Manager)
);

create table Barang(
	Id_Barang varchar2(10),
	Jenis_Barang varchar2(10),
	Nama_Barang varchar2(10),
	Primary key (Id_Barang)
);

create table Alat(
	Id_Alat varchar2 (10), --- perbaiki pk ----- 
	Nama_Alat varchar2(10),
	Jenis_Alat varchar2(10),
	Waktu DATE,
	Primary key (Id_Alat)
);

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
	Nomer_Identitas varchar2(10)
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


create table Detil_Pelayanan(
	Id_Pelayanan varchar2(10), ----- fk nya blm ditambahin
	Id_Pegawai varchar2(10),
	Nomer_Identitas varchar2(20),
	constraint fk_Detil_Pelayanan Foreign key (Id_Pelayanan) references pelayanan (Id_Pelayanan),
	constraint fk_Detil_Pelayanan Foreign key (Id_Pegawai) references Pegawai (ID_Pegawai),
	constraint fk_Detil_Pelayanan Foreign key (Nomer_Identitas) references Pelanggan (Nomer_Identitas)
);

create table R_Memiliki(
	Kode_Shift varchar2(10),
	Id_Pegawai varchar2(10), -- fk blm dimasukkin
	constraint fk_R_Memiliki Foreign key (Kode_Shift) 
	references Shift (Kode_Shift) on delete cascade enable,
	constraint fk_R_Memiliki Foreign key (Id_Pegawai) 
	references Pegawai (Id_Pegawai) on delete cascade enable
);

create table Bertanggung_Jawab(
	Id_Pegawai varchar2(10),
	Id_Barang varchar2(10),
	constraint Bertanggung_Jawab_FK Foreign key (Id_Pegawai) 
	references PJ_Barang (Id_Pegawai) on delete cascade enable,
	constraint Bertanggung_Jawab_FK Foreign key (Id_Barang) 
	references Barang (Id_Barang) on delete cascade enable
);

create table R_Menggunakan(
	Id_Alat varchar2(10),
	Id_Pegawai varchar2(10),
	Primary key (Id_Alat, Id_Pegawai) ENABLE,
	constraint fk_R_Menggunakan Foreign key (Id_Alat) 
	references Alat (Id_Alat) On delete cascade enable,
	constraint fk_R_Menggunakan Foreign key (Id_Pegawai) 
	references Montir (Id_Pegawai) on delete cascade
);

Alter table Montir
add Id_Montir varchar2(10);

alter table Montir
add Primary key (Id_Montir);