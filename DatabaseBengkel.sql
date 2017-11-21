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
	Id_PjBarang varchar2(10),
	Nama_PjBarang varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table Barang(
	Id_Barang varchar2(10),
	Jenis_Barang varchar2(10),
	Nama_Barang varchar2(10)
);

create table Kasir(
	Id_Kasir varchar2(10),
	Nama_Kasir varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table Security(
	Id_Security varchar2(10),
	Nama_Security varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table montir(
	Id_Montir varchar2(10),
	Nama_Montir varchar2(20),
	Nomer_Telepon varchar2(15)
);

create table Alat(
	Id_Alat varchar2 (10),
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
	Id_PJBarang varchar2(10),
	Id_Barang varchar2(10)
);

create table R_Menggunakan(
	Id_Alat varchar2(10),
	Id_Montir varchar2(10)
);

---- ganti menjadi pegawai
alter table PenganggungJawab_BagianBarang Rename Column Id_PJBarang to Id_Pegawai;
alter table Kasir Rename Column Id_Kasir to Id_Pegawai;
alter table Security Rename Column Id_Security to Id_Pegawai;
alter table montir Rename Column Id_Montir to Id_Pegawai;

---- Penambahan Id_divisi pada anak - anaknya
alter table Pegawai 
add ID_divisi varchar2(10);

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

---- Penambahan PK pada table Master
alter table Pelanggan 
add constraint pk_Pelanggan Primary key (Nomer_Identitas);

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

---- Penambahan FK & PK pada table yang memilikinya

Alter table Kendaraan
Add constraint pk_Kendaraan Primary key (Nomer_Plat)
Add constraint fk_Kendaraan Foreign key (Nomer_Identitas)
references Pelanggan (Nomer_Identitas);

Alter table Membership
Add constraint pk_Membership Primary key (Id_Member)
add constraint fk_Membership Foreign key (Nomer_Identitas)
references Pelanggan (Nomer_Identitas);

Alter table Pegawai
add constraint pk_Pegawai Primary key (Id_Pegawai, Id_divisi)

Alter table Pegawai
add constraint fk_Pegawai Foreign key (Id_Manager)
references Manager (Id_Manager);

alter table Security
add constraint pk_Security Primary key (Id_Pegawai, Id_divisi)
add constraint fk_Security Foreign key (Id_Pegawai, Id_divisi)
references pegawai (Id_Pegawai, Id_divisi);

Alter table Montir
add constraint pk_Montir Primary key (Id_Pegawai, Id_divisi)
add constraint fk_Montir Primary key (Id_Pegawai, Id_divisi)
references Pegawai (Id_Pegawai, Id_divisi);

alter table Kasir
add constraint pk_Kasir Primary key (Id_Pegawai, Id_divisi)
add constraint fk_Kasir Foreign key (Id_Pegawai, Id_divisi)\
references Pegawai (Id_Pegawai, Id_divisi);

alter table PenanggungJawab_BagianBarang
add constraint pk_PenanggungJawab_BagianBarang Primary key (Id_Pegawai, Id_divisi)
add constraint fk_PenanggungJawab_BagianBarang Foreign key (Id_Pegawai, Id_divisi)
references Pegawai (Id_Pegawai, Id_divisi);

alter table R_Memiliki
add constraint pk_R_Memiliki Primary key (Id_Pegawai, Kode_Shift)
add constraint fk_R_Memiliki Foreign key (Id_Pegawai, Kode_Shift)
references Pegawai, Shift (Id_Pegawai, Kode_Shift);

alter table Bertanggung_Jawab
add constraint pk_R_BertanggungJawab Primary key (Id_Pegawai, Id_Barang)
add constraint fk_R_BertanggungJawab Foreign key (Id_Pegawai, Id_Barang)
references PenanggungJawab_BagianBarang, Barang (Id_Pegawai, Id_Barang);

alter table R_Menggunakan
add constraint pk_R_Menggunakan Primary key (Id_alat, Id_Pegawai)
add constraint fk_R_Menggunakan Foreign key (Id_Alat, Id_Pegawai)
references Alat, Montir (Id_Alat, Id_Montir);