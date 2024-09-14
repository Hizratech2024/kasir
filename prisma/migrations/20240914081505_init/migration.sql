-- CreateTable
CREATE TABLE "BarangTb" (
    "id" SERIAL NOT NULL,
    "kodeBarang" TEXT NOT NULL,
    "namaBarang" TEXT NOT NULL,
    "kategoriId" INTEGER NOT NULL,
    "merek" TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "hargaModal" INTEGER NOT NULL,
    "hargaJual" INTEGER NOT NULL,
    "stok" INTEGER NOT NULL,
    "foto" TEXT,
    "deskripsi" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BarangTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KategoriTb" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KategoriTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TambahstokTb" (
    "id" SERIAL NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "admin" TEXT NOT NULL,
    "totalItem" INTEGER NOT NULL,
    "totalBayar" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TambahstokTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DetailtambahstokTb" (
    "id" SERIAL NOT NULL,
    "barangId" INTEGER NOT NULL,
    "tambahstokId" INTEGER NOT NULL,
    "hargaModal" INTEGER NOT NULL,
    "hargaJual" INTEGER NOT NULL,
    "qty" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DetailtambahstokTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KaryawanTb" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "tempatLahir" TEXT NOT NULL,
    "tanggalLahir" TIMESTAMP(3) NOT NULL,
    "alamat" TEXT NOT NULL,
    "hp" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "foto" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KaryawanTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserTb" (
    "id" SERIAL NOT NULL,
    "karyawanId" INTEGER NOT NULL,
    "usernama" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PenjualanTb" (
    "id" SERIAL NOT NULL,
    "nofaktur" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "karyawanId" INTEGER NOT NULL,
    "totalItem" INTEGER NOT NULL,
    "totalBayar" INTEGER NOT NULL,
    "jumlahUang" INTEGER NOT NULL,
    "kembalian" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PenjualanTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DetailPenjualanTb" (
    "id" SERIAL NOT NULL,
    "barangId" INTEGER NOT NULL,
    "penjualanId" INTEGER NOT NULL,
    "hargaModal" INTEGER NOT NULL,
    "hargaJual" INTEGER NOT NULL,
    "qty" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DetailPenjualanTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServisTb" (
    "id" SERIAL NOT NULL,
    "kodeServis" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "nama" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "hp" TEXT NOT NULL,
    "namaBarang" TEXT NOT NULL,
    "noSeri" TEXT NOT NULL,
    "perlengkapan" TEXT NOT NULL,
    "jenis" TEXT NOT NULL,
    "detailSoftware" TEXT NOT NULL,
    "detailHardware" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "karyawanId" INTEGER NOT NULL,
    "biayaSoftware" INTEGER,
    "biayaHardware" INTEGER,
    "biayaCancel" INTEGER,
    "keterangan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServisTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "logloginTb" (
    "id" SERIAL NOT NULL,
    "karyawanId" INTEGER NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "logloginTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogkaryawanTb" (
    "id" SERIAL NOT NULL,
    "karyawanId" INTEGER NOT NULL,
    "nama" TEXT NOT NULL,
    "hp" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "LogkaryawanTb_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogbarangTb" (
    "id" SERIAL NOT NULL,
    "barangId" INTEGER NOT NULL,
    "kodeBarang" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "LogbarangTb_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "BarangTb_kodeBarang_key" ON "BarangTb"("kodeBarang");

-- CreateIndex
CREATE UNIQUE INDEX "KaryawanTb_hp_key" ON "KaryawanTb"("hp");

-- CreateIndex
CREATE UNIQUE INDEX "KaryawanTb_email_key" ON "KaryawanTb"("email");

-- CreateIndex
CREATE UNIQUE INDEX "UserTb_karyawanId_key" ON "UserTb"("karyawanId");

-- CreateIndex
CREATE UNIQUE INDEX "UserTb_usernama_key" ON "UserTb"("usernama");

-- CreateIndex
CREATE UNIQUE INDEX "PenjualanTb_nofaktur_key" ON "PenjualanTb"("nofaktur");

-- AddForeignKey
ALTER TABLE "BarangTb" ADD CONSTRAINT "BarangTb_kategoriId_fkey" FOREIGN KEY ("kategoriId") REFERENCES "KategoriTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DetailtambahstokTb" ADD CONSTRAINT "DetailtambahstokTb_barangId_fkey" FOREIGN KEY ("barangId") REFERENCES "BarangTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DetailtambahstokTb" ADD CONSTRAINT "DetailtambahstokTb_tambahstokId_fkey" FOREIGN KEY ("tambahstokId") REFERENCES "TambahstokTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTb" ADD CONSTRAINT "UserTb_karyawanId_fkey" FOREIGN KEY ("karyawanId") REFERENCES "KaryawanTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PenjualanTb" ADD CONSTRAINT "PenjualanTb_karyawanId_fkey" FOREIGN KEY ("karyawanId") REFERENCES "KaryawanTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DetailPenjualanTb" ADD CONSTRAINT "DetailPenjualanTb_barangId_fkey" FOREIGN KEY ("barangId") REFERENCES "BarangTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DetailPenjualanTb" ADD CONSTRAINT "DetailPenjualanTb_penjualanId_fkey" FOREIGN KEY ("penjualanId") REFERENCES "PenjualanTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServisTb" ADD CONSTRAINT "ServisTb_karyawanId_fkey" FOREIGN KEY ("karyawanId") REFERENCES "KaryawanTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logloginTb" ADD CONSTRAINT "logloginTb_karyawanId_fkey" FOREIGN KEY ("karyawanId") REFERENCES "KaryawanTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LogkaryawanTb" ADD CONSTRAINT "LogkaryawanTb_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LogbarangTb" ADD CONSTRAINT "LogbarangTb_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserTb"("id") ON DELETE CASCADE ON UPDATE CASCADE;
