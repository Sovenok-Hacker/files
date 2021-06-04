import telebot, os, random

bot = telebot.TeleBot('1802070719:AAGLFlpUBo7CDvHJ1xjoU7icSujXldZuqgM')
from telebot import types


@bot.message_handler(content_types=['text'])
def get_text_messages(message):
                               bot.send_message(message.from_user.id, "Привет! Я бот которого наисал ползователь Артём Хвостов.")
                               bot.send_message(message.from_user.id, "Я скоро стану премодератором группы Owl ( сова ) но пока меня не научил этому Артём Хвостов - @Duo_sova . Я уже сейчас являюсь админом этой группы - пока премодератор - Артём. Спасибо за общение со мной!")
                               text = message.text
                               if text == "Привет":
                                                   bot.send_message(message.from_user.id, "Привет! Я бот которого наисал ползователь Артём Хвостов.")
                               print("Получено сообщение - ", text)

bot.polling()
