CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL,
	"price" bigint NOT NULL,
	"main_photo" TEXT NOT NULL,
	"outher_photos" TEXT,
	"clothes_id" integer UNIQUE,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL,
	"size" character NOT NULL,
	"category" TEXT NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"product_id" integer NOT NULL,
	"quantity" integer NOT NULL,
	"status" TEXT NOT NULL,
	"date" TIMESTAMP NOT NULL DEFAULT 'NOW()',
	"adress" TEXT NOT NULL,
	"adress_id" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adresses" (
	"id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"adress" TEXT NOT NULL UNIQUE,
	CONSTRAINT "adresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("clothes_id") REFERENCES "clothes"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("adress_id") REFERENCES "adresses"("id");

ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("id");






