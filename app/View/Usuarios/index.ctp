<h1>Listagem de usuários</h1>
<?php echo $this->Html->link('Adicionar um usuário', array('controller' => 'usuarios', 'action' => 'adicionar'));?>
<table>
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Data de nascimento</th>
        <th>Ação</th>
    </tr>
<?php foreach ($usuarios as $usuario): ?>
    <tr>
        <td><?php echo $usuario['Usuario']['id']; ?></td>
        <td>
            <?php
                echo $this->Html->link($usuario['Usuario']['nome'], array('controller' => 'usuarios', 'action' => 'visualizar', $usuario['Usuario']['id']));
            ?>
        </td>
        <td><?php echo date('d/m/Y', strtotime($usuario['Usuario']['data_nasc'])); ?></td>
        <td>
            <?php echo $this->Html->link('Editar', array('action' => 'editar', $usuario['Usuario']['id']));?>
            <?php
                echo $this->Form->postLink(
                    'Deletar',
                    array('action' => 'deletar', $usuario['Usuario']['id']),
                    array('confirm' => 'Você está certo?')
                );
            ?>
        </td>
    </tr>
<?php endforeach; ?>
<?php unset($usuario); ?>
</table>