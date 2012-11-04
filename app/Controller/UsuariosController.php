<?php
/*
 * Classe controle dos usuários
 */
App::uses('AppController', 'Controller');
class UsuariosController extends AppController {
    public $helpers = array('Html', 'Form');//chamando os helpper que serão utilizados
   
    public function index() {
        $this->set('usuarios', $this->Usuario->find('all'));
    }
    
    public function visualizar($id = null) {
        $this->Usuario->id = $id;
        $this->set('usuario', $this->Usuario->read());
    }
    public function adicionar() {
        #debug($this->request);
        if ($this->request->is('post')) {
            $this->Usuario->create();
            if ($this->Usuario->save($this->request->data)) {
                $this->Session->setFlash('Usuário adicionado com sucesso.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Não foi possível criar o usuário.');
            }
        }
    }
    public function editar($id = null) {
        $this->Usuario->id = $id;
        if ($this->request->is('get')) {
            $this->request->data = $this->Usuario->read();
        } else {
            if ($this->Usuario->save($this->request->data)) {
                $this->Session->setFlash('O usuário foi editado.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Não foi possível identificar o usuário.');
            }
        }
    }

    public function deletar($id) {
        if ($this->request->is('get')) {
            throw new MethodNotAllowedException();
        }
        $obj = $this->Usuario->read('nome',$id);
        $nome = $obj['Usuario']['nome'];
        if ($this->Usuario->delete($id)) {
            #$this->Session->setFlash('O usuário de ID: ' . $id . ' foi deletado.');
            $this->Session->setFlash('O usuário ' . $nome . ' foi deletado.');
            $this->redirect(array('action' => 'index'));
        }
    }
}