import flet as ft
def main(page: ft.Page):
    page.horizontal_alignment=ft.CrossAxisAlignment.CENTER
    page.title="Mi lista de tareas"
    def agregar_tarea(e):
        if(campo_tarea.value != ""):
            tarea_listTile=ft.ListTile(title=ft.Text(campo_tarea.value),leading=ft.Checkbox(on_change=seleccionar_tarea))
            tareas.append(tarea_listTile)
            campo_tarea.value=""
            actualizar_lista()
            
    def seleccionar_tarea(e):
        seleccionadas=[tarea.title.value for tarea in tareas if tarea.leading.value]
        tarea_seleccionada.value="tareas seleccionadas: "+", ".join(seleccionadas)
        page.update()

    def actualizar_lista():
        lista_tareas.controls.clear()
        lista_tareas.controls.extend(tareas)
        page.update()
            
    titulo =  ft.Text("Mi lista de tareas",size=24,weight=ft.FontWeight.W_100)
    campo_tarea = ft.TextField(hint_text="Escribe una nueva tarea")   
    boton_agregar = ft.ElevatedButton("Agregar",on_click=agregar_tarea)
    lista_tareas=ft.ListView(expand=0,spacing=10,padding=20)
    tareas=[]
    tarea_seleccionada=ft.Text("",size=24)
    
    page.add(titulo,campo_tarea,boton_agregar, lista_tareas, tarea_seleccionada)
ft.app(main)
