from PySide6.QtCore import QTimer

import falcon7x_core.cas.messages as all_messages

import view_helper


class CAS:
    def __init__(self, qml_root_item_name):
        # словарь со всеми полученными сообщениями
        self.all_recieved_mssgs = {}
        self.current_regime = all_messages.Regimes.CRUISE # текущий режима
        self.display_mssgs  = [] # все сообщения, которые нужно отобразить
        self.recieved_red = [] # полученные красные сообщения
        self.recieved_amber = [] # полученные желтые сообщения
        self.recieved_white = [] # полученные белые сообщения
        self.visible_mssgs = [] # сообщения, которые в данный момент находятся на экране
        self.amber_and_white_mssgs = []
        self.end_mssg = 'END' #  самое последнее сообщение
        self.scroll_index = 0 # индекс для прокрутки
        self.final_mssgs_list = [None]*10

        self.recieved_amber_not_read = []
        self.recieved_amber_read = []

        self.amber_count_up = 0
        self.white_count_up = 0
        self.amber_count_down = 0
        self.white_count_down = 0

        self.qml_lines = []
        self.find_qml_cas(qml_root_item_name)
    
    def find_qml_cas(self, qml_root_item_name):
        qml_names = ["cas_line_" + str(i) for i in range(1, 11)]
        lines = []

        for qml_name in qml_names:
            lines.append(
                view_helper.find_object(qml_name, qml_root_item_name)
            )
        
        self.qml_lines = lines

    # функция для добавления пришедшего сообщения в общий список и сортировки его по цвету
    def add_mssg(self, msg_cls: all_messages.CASmssg):
        msg_text = str(msg_cls)

        if msg_text in self.all_recieved_mssgs:
            return

        msg_cls.isread = False
        self.all_recieved_mssgs[msg_text] = msg_cls # добавление класса с сообщением в словарь: ключ - текст сообщения, значение - его класс
        
        # сортировка последнего полученного сообщения (если пришедшее сообщение добавляется в начало списка)
        if msg_cls.color == 'R':
            self.recieved_red.insert(0, msg_cls)
        elif msg_cls.color == 'A':
            self.recieved_amber.insert(0, msg_cls)
        else:
            self.recieved_white.insert(0, msg_cls)
        
        # список всех отсортированных сообщений
        self.display_mssgs = self.recieved_red + self.recieved_amber + self.recieved_white
        self.visible_mssgs = self.display_mssgs[:]

        self.final_result()

        return msg_cls.color


    def scroll_for_1_message(self, scroll_for_one_mssg_bttn_down, scroll_for_one_mssg_bttn_up):
        self.recieved_amber_not_read.clear()
        self.recieved_amber_read.clear()

        # # определяем непрочитанные желтые сообщения
        # for i in recieved_amber:
        #     if i.isread == False:
        #         recieved_amber_not_read.append(i)
        #     elif i.isread == True and getattr(i, current_regime) == True:
        #         recieved_amber_read.append(i)

        # amber_and_white_mssgs = recieved_amber_read + recieved_white # список всех желтых и белых сообщений

        if scroll_for_one_mssg_bttn_up == True and self.visible_mssgs[0:10] == self.display_mssgs[0:10]:
            pass   # выход из цикла, если мы в начале списка, т.к. индекс остался неизменным
        elif scroll_for_one_mssg_bttn_down == True and self.scroll_index == len(self.amber_and_white_mssgs):
            pass   # выход из цикла, если мы в конце списка, т.е. отображается только сообщение END
        elif scroll_for_one_mssg_bttn_down == True:
            self.scroll_index += 1
            self.visible_mssgs = self.recieved_red + self.recieved_amber_not_read + self.amber_and_white_mssgs[self.scroll_index:]
        elif scroll_for_one_mssg_bttn_up == True:
            self.scroll_index -= 1
            self.visible_mssgs = self.recieved_red + self.recieved_amber_not_read + self.amber_and_white_mssgs[self.scroll_index:]

        # # количество желтых и белых сообщений до отображаемых
        # for item in amber_and_white_mssgs[0:scroll_index]:
        #     if item.color == "A":
        #         amber_count_up += 1
        #     else:
        #         white_count_up += 1

        # # количество желтых и белых сообщений после отображаемых
        # for item in amber_and_white_mssgs[scroll_index + (10-len(recieved_red)-len(recieved_amber_not_read)):]: 
        #     if item.color == "A":
        #         amber_count_down += 1
        #     else:
        #         white_count_down += 1

        # if scroll_for_one_mssg_bttn_down == True:
        #     print('Прокрутка на одно сообщение вниз')
        # elif scroll_for_one_mssg_bttn_up == True:
        #     print('Прокрутка на одно сообщение вверх')
        
        self.final_result()

        # print(len(amber_and_white_mssgs))
        # print(scroll_index)

    def reading_mssgs(self, bttn_to_read_mssgs):
        if bttn_to_read_mssgs == True: # если нажата кнопка прочтения сообщений
            for item_f in self.final_mssgs_list:
                if item_f != None:
                    item_f.isread = True # меняем атрибут класса отображаемых сообщений на прочитано

            for item_d in self.display_mssgs: 
                if item_d == item_f: # если отображаемое сообщение совпадает с сообщением в списке всех сообщений
                    item_d.isread = True # то также меняем и его атрибут
            
            for item_v in self.visible_mssgs: 
                if item_v == item_f: # если отображаемое сообщение совпадает с сообщением в списке всех сообщений
                    item_v.isread = True # то также меняем и его атрибут

            for item_r in self.recieved_red: 
                if item_r == item_f: # если отображаемое сообщение совпадает с сообщением в списке полученных красных
                    item_r.isread = True # то также меняем и его атрибут

            for item_a in self.recieved_amber: 
                if item_a == item_f: # если отображаемое сообщение совпадает с сообщением в списке полученных желтых
                    item_a.isread = True # то также меняем и его атрибут
            
        self.final_result()


    # функция для удаления сообщения
    def remove_message(self, message_to_delete: all_messages.CASmssg):
        # обновление списка полученных красных
        for item_r in self.recieved_red:
            if message_to_delete == item_r:
                self.recieved_red.remove(item_r)
        # обновление списка полученных желтых
        for item_a in self.recieved_amber:
            if message_to_delete == item_a:
                self.recieved_amber.remove(item_a)
        # обновление списка полученных белых
        for item_w in self.recieved_white:
            if message_to_delete == item_w:
                self.recieved_white.remove(item_w)
        
        # удаление сообщения в общем списке сообщений
        for item_d in self.display_mssgs:
            if message_to_delete == item_d:
                self.display_mssgs.remove(item_d)

        # удаление сообщения в отображаемом списке сообщений
        for item_v in self.visible_mssgs:
            if message_to_delete == item_v:
                self.visible_mssgs.remove(item_v)

        if str(message_to_delete) in self.all_recieved_mssgs:
            del self.all_recieved_mssgs[str(message_to_delete)]
        
        self.final_result()

    def remove_all_messages_internal(self):
        # Очистка всех данных
        self.all_recieved_mssgs.clear()
        self.display_mssgs.clear()
        self.recieved_red.clear()
        self.recieved_amber.clear()
        self.recieved_white.clear()
        self.visible_mssgs.clear()
        self.amber_and_white_mssgs.clear()
        self.scroll_index = 0  # Сброс индекса прокрутки
        self.final_mssgs_list = [None] * 10  # Сброс итогового списка сообщений

        self.final_result()

    def final_result(self):
        self.final_mssgs_list = [None]*9
        self.final_mssgs_list.insert(0, 'END')

        k = 0
        
        for item in range(0, len(self.visible_mssgs)):
            if k > 9:
                break 
            elif getattr(self.visible_mssgs[item], self.current_regime) == True: 
                # final_mssgs_list[k] = visible_mssgs[item]
                self.final_mssgs_list.insert(k, self.visible_mssgs[item])
                k +=1
        
        if None in self.final_mssgs_list:
            index_none = self.final_mssgs_list.index(None)
            self.final_mssgs_list = self.final_mssgs_list[0:index_none]
        
        self.recieved_amber_not_read = []
        self.recieved_amber_read = []
        self.all_amber_and_white_mssgs = []

        # определяем непрочитанные желтые сообщения
        for i in self.recieved_amber:
            if i.isread == False and getattr(i, self.current_regime) == True:
                self.recieved_amber_not_read.append(i)
            elif i.isread == True and getattr(i, self.current_regime) == True:
                self.recieved_amber_read.append(i)

        self.amber_and_white_mssgs = self.recieved_amber_read + self.recieved_white # список всех прочитанных желтых и белых сообщений
        self.all_amber_and_white_mssgs = self.recieved_amber_not_read + self.amber_and_white_mssgs

        # счетчики сообщений сверху и снизу отображаемых
        self.amber_count_up = 0
        self.white_count_up = 0
        self.amber_count_down = 0
        self.white_count_down = 0

        # print(amber_and_white_mssgs[scroll_index + (10-len(recieved_red)-len(recieved_amber_not_read)):])

        # количество желтых и белых сообщений до отображаемых
        for item in self.amber_and_white_mssgs[0:self.scroll_index]:
            if item.color == "A":
                self.amber_count_up += 1
            else:
                self.white_count_up += 1

        # количество желтых и белых сообщений после отображаемых
        for item in self.amber_and_white_mssgs[self.scroll_index + (10-len(self.recieved_red)-len(self.recieved_amber_not_read)):]: 
            if item.color == "A":
                self.amber_count_down += 1
            else:
                self.white_count_down += 1

        # преобразование чисел в строку для вывода на экран
        if self.amber_count_up <= 9:
            amber_count_up_str = '0' + str(self.amber_count_up)
        else:
            amber_count_up_str = str(self.amber_count_up)
        
        if self.amber_count_down <= 9:
            amber_count_down_str = '0' + str(self.amber_count_down)
        else:
            amber_count_down_str = str(self.amber_count_down)
        
        if self.white_count_up <= 9:
            white_count_up_str = '0' + str(self.white_count_up)
        else:
            white_count_up_str = str(self.white_count_up)

        if self.white_count_down <= 9:
            white_count_down_str = '0' + str(self.white_count_down)
        else:
            white_count_down_str = str(self.white_count_down)

        # print(final_mssgs_list)
        # print(amber_count_down, white_count_down,amber_count_up,white_count_up)

    def update_lines(self):
        for line in self.qml_lines:
            line.setProperty("text", "")
            line.setProperty("type", "empty") # empty msg

        for msg, line in zip(self.final_mssgs_list, self.lines):
            if msg is None:
                continue

            if msg == "END":
                line.setProperty("text", f"{msg}")
            else:
                line.setProperty("text", f"{msg.text}")

            if msg.color == "R":
                line.setProperty("type", "red") # red msg
            elif msg.color == "A":
                line.setProperty("type", "yellow") # yellow msg
            elif msg.color == "W":
                line.setProperty("type", "white") # white msg

            line.setProperty("is_read", msg.isread)

    def auto_read(self, msg_cls: all_messages.CASmssg):
        msg_cls.isread = True
        self.update_lines()

    def show_message(self, message):
        msg_cls = all_messages.all_mssgs[message]
        msg_color = self.add_mssg(msg_cls)
        if msg_color == "W":
            QTimer.singleShot(10000, None, lambda: self.auto_read(msg_cls))
        self.update_lines()

    def read_message(self):
        self.reading_mssgs(True)
        self.update_lines()
        self.update_counts()

    def scroll_up(self):
        self.scroll_for_1_message(scroll_for_one_mssg_bttn_up=True, scroll_for_one_mssg_bttn_down=False)
        self.update_lines()

    def remove_message(self, message):
        msg_cls = all_messages.all_mssgs[message]
        self.remove_message(msg_cls)
        self.update_lines()

    def remove_all_messages(self):
        self.remove_all_messages_internal()
        self.update_lines()
        self.update_counts()

    def set_regime(self, regime):
        self.current_regime = all_messages.Regimes(regime) 
        self.update_lines()


cas_objects = [
    CAS("pdu_left"),
    CAS("pdu_right")
]


def show_message(message):
    for cas in cas_objects:
        cas.show_message(message)


def read_message():
    for cas in cas_objects:
        cas.read_message()


def scroll_up():
    for cas in cas_objects:
        cas.scroll_up()


def remove_message(message):
    for cas in cas_objects:
        cas.read_message(message)


def remove_all_messages(message):
    for cas in cas_objects:
        cas.remove_all_messages()


def set_regime(regime):
    for cas in cas_objects:
        cas.set_regime(regime)
