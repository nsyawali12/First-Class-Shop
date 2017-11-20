Tubes PBD "First Class Shop";

create table Pelanggan(
	Nomer_Identitas varchar2(10),
	Nama_Pelanggan varchar2(20),
	Nomer_Telepon varchar2(16),
	Alamat_Pelanggan varchar2(50)
);

create table Shift(
	Kode_Shift varchar2(10),
	Periode_Awal DATE,
	Perode_Akhir DATE
);

create table pelayanan(
	Id_Pelayan varchar2(10),
	Jenis_Pelayanan varchar2(10),
	Total_Harga number
);

create table Manager(
	Id_Manager varchar2(10),
	Nama_Manager varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table PenganggungJawab_BagianBarang(
	Id_PjBarang varchar2(10), ----- perbaiki pk nya --
	Nama_PjBarang varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table Barang(
	Id_Barang varchar2(10),
	Jenis_Barang varchar2(10),
	Nama_Barang varchar2(10)
);

create table Kasir(
	Id_Kasir varchar2(10), --- perbaiki pknya ---
	Nama_Kasir varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table Security(
	Id_Security varchar2(10), --- perbaiki pk nya ---
	Nama_Security varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table montir(
	Id_Montir varchar2(10), --- perbaiki pk nya ----
	Nama_Montir varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table Alat(
	Id_Alat varchar2 (10), --- perbaiki pk ----- 
	Nama_Alat varchar2(10),
	Jenis_Alat varchar2(10),
	Waktu DATE
);

create table Kendaraan(
	Nomer_Plat varchar2(10),
	Nama_Kendaraan varchar2(10),
	Jenis_Kendaraan varchar2(5),
	Nomer_Identitas varchar2(20)
);

create table Membership(
	Id_Member varchar2(10),
	Nomer_Identitas varchar2(10)
);

create table Detil_Pelayanan(
	Id_Pelayan varchar2(10),
	Id_Pegawai varchar2(10),
	Nomer_Identitas varchar2(20)
);

create table Pegawai(
	Id_Pegawai varchar2(10),
	Nama_Pegawai varchar2(10),
	Nomer_Telepon varchar2(10),
	Id_Montir varchar2(10),
	Id_Kasir varchar2(10),
	Id_Security varchar2(10),
	Id_PjBarang varchar2(10),
	Id_Manager varchar2(10)
);

create table R_Memiliki(
	Kode_Shift varchar2(10),
	Id_Pegawai varchar2(10)
);

create table Bertanggung_Jawab(
	Id_PJBarangR varchar2(10),
	Id_Barang varchar2(10)
);

create table R_Menggunakan(
	Id_Alat varchar2(10),
	Id_Montir varchar2(10)
);

--- ganti menjadi pegawai ----
alter table PenganggungJawab_BagianBarang Rename Column Id_PJBarang to Id_Pegawai;
alter table Kasir Rename Column Id_Kasir to Id_Pegawai;
alter table Security Rename Column Id_Security to Id_Pegawai;
alter table montir Rename Column Id_Montir to Id_Pegawai;

------ penambahan ID_divisi pada anak anaknya
alter table pegawai
add column ID_divisi varchar2(10);

-------- Penambahan PK pada Table Master
alter table Pelanggan add constraint pk_Pelanggan 
Primary key (Nomer_Identitas);

alter table Shift add constraint pk_Shift
Primary key (Kode_Shift);

alter table Pelayanan add constraint pk_Pelayanan
Primary key (Id_Pelayan);

alter table Manager add constraint pk_Manager
Primary key (Id_Manager);

alter table Barang add constraint pk_Barang
Primary key (Id_Barang);

alter table Alat add constraint pk_Alat
Primary key (Id_Alat);

----- penambahan FK & PK pada table yang memilikinya


