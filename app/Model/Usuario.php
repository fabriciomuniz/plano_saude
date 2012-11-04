<?php
    class Usuario extends AppModel {
        
        #var $name = 'Usuario';
        
        public $validate = array(
            'nome' => array(
                'rule' => 'notEmpty'
            ),
            'data_nasc' => array(
                'rule' => 'notEmpty'
            )
        );
    }
?>