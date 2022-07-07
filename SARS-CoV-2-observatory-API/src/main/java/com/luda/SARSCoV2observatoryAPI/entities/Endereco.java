package com.luda.SARSCoV2observatoryAPI.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "tb_endereco")
public class Endereco {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String rua;
    private String numero;
    private String cep;
    private String bairro;
    private String cidade;
    private String complemento;

    public Endereco() {
    }

    public Endereco(Long id, String rua, String numero, String cep, String bairro, String cidade, String complemento) {
        this.id = id;
        this.rua = rua;
        this.numero = numero;
        this.cep = cep;
        this.bairro = bairro;
        this.cidade = cidade;
        this.complemento = complemento;
    }
}
