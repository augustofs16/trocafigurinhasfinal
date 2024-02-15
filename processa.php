<?php
include("conecta.php");

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = $_POST['senha'];
$tel = $_POST['tel'];
$endereco = $_POST['endereco'];
$cpf = $_POST['cpf'];
$cnpj = $_POST['cnpj'];
$cep = $_POST['cep'];
$cidade = $_POST['cidade'];
$bairro = $_POST['bairro'];
$estado = $_POST['estado'];

$sql = $mysqli->prepare("INSERT INTO cadastro (nome, email, senha, tel, endereco, cpf, cnpj, cep, bairro, cidade, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$sql->bind_param("ssssssssssss", $nome, $email, $senha, $tel, $endereco, $cpf, $cnpj, $cep, $bairro, $cidade, $estado);

$sql->execute();

$result = $sql->affected_rows;

if ($result > 0) {
    echo "Dados Inseridos com Sucesso!";
} else {
    echo "Houve um erro";
}

$sql->close();
$mysqli->close();
?>