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
	Jenis_Alat varchar2(10)
);



