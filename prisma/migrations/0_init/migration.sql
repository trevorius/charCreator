-- CreateTable
CREATE TABLE "chats" (
    "id" SERIAL NOT NULL,
    "user_email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "timestamp" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "chats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "messages" (
    "id" SERIAL NOT NULL,
    "chat_id" INTEGER NOT NULL,
    "role" VARCHAR(32) NOT NULL,
    "content" TEXT NOT NULL,

    CONSTRAINT "messages_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "fk_chat" FOREIGN KEY ("chat_id") REFERENCES "chats"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

