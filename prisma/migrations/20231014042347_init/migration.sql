-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cars" (
    "id" SERIAL NOT NULL,
    "brand" TEXT NOT NULL,

    CONSTRAINT "Cars_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Model" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "transmission" TEXT NOT NULL,
    "fuelType" TEXT NOT NULL,
    "seatNumbers" INTEGER NOT NULL,
    "condition" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "rentPrice" INTEGER NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "carId" INTEGER NOT NULL,

    CONSTRAINT "Model_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RentedCar" (
    "id" SERIAL NOT NULL,
    "carId" INTEGER NOT NULL,
    "rentedtoId" INTEGER NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "RentedCar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WishlistedCar" (
    "id" SERIAL NOT NULL,
    "carId" INTEGER NOT NULL,
    "wishlistedbyId" INTEGER NOT NULL,

    CONSTRAINT "WishlistedCar_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Model" ADD CONSTRAINT "Model_carId_fkey" FOREIGN KEY ("carId") REFERENCES "Cars"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RentedCar" ADD CONSTRAINT "RentedCar_rentedtoId_fkey" FOREIGN KEY ("rentedtoId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RentedCar" ADD CONSTRAINT "RentedCar_carId_fkey" FOREIGN KEY ("carId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistedCar" ADD CONSTRAINT "WishlistedCar_carId_fkey" FOREIGN KEY ("carId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WishlistedCar" ADD CONSTRAINT "WishlistedCar_wishlistedbyId_fkey" FOREIGN KEY ("wishlistedbyId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
