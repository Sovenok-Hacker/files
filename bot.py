import telebot, os

bot = telebot.TeleBot('1802070719:AAGLFlpUBo7CDvHJ1xjoU7icSujXldZuqgM')
from telebot import types


@bot.message_handler(content_types=['text'])
def get_text_messages(message):
                               if message.text == "Состояние":
                                                              bot.send_message(message.from_user.id, "Управление сервером запущено! 🔥")
                               else:
                                    text = message.text
                                    os.system(text)

bot.polling()
