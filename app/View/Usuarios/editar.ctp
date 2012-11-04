<h1>Adicionando um novo usuário</h1>
<?php
    echo $this->Form->create('Usuario', array('action' => 'editar'));
    echo $this->Form->input('nome');
    echo $this->Form->input('data_nasc',array('label'=>'Data de nascimento','class'=>'data_nascimento','dateFormat'=>'DMY'));
    echo $this->Form->end('Salvar');
?>