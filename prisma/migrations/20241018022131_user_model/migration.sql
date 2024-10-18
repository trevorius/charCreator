-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "CharCreator";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "chatGptApp";

-- CreateTable
CREATE TABLE "chatGptApp"."chats" (
    "id" SERIAL NOT NULL,
    "user_email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "chats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chatGptApp"."messages" (
    "id" SERIAL NOT NULL,
    "chat_id" INTEGER NOT NULL,
    "role" VARCHAR(32) NOT NULL,
    "content" TEXT NOT NULL,

    CONSTRAINT "messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CharCreator"."C_C_users" (
    "uid" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "twoFaSecret" TEXT,
    "provider" TEXT,
    "providerId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "C_C_users_pkey" PRIMARY KEY ("uid")
);

-- CreateIndex
CREATE UNIQUE INDEX "C_C_users_username_key" ON "CharCreator"."C_C_users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "C_C_users_email_key" ON "CharCreator"."C_C_users"("email");

-- AddForeignKey
ALTER TABLE "chatGptApp"."messages" ADD CONSTRAINT "fk_chat" FOREIGN KEY ("chat_id") REFERENCES "chatGptApp"."chats"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
