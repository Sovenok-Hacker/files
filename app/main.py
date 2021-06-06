from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
import keyboard, os, time

class MyLayout(BoxLayout):
                          def printMe(self):
                                            print(self.ids.mylabel.text)
                                            

                          def shutdown(self):
                                             os.system("shutdown")
                          def reboot(self):
                                           os.system("reboot")
                                             
class TutorialApp(App):
                       def build(self):
                                       self.load_kv('MyApp.kv') #загружаем данные из MyApp.kv
                                       return MyLayout()
TutorialApp().run()
