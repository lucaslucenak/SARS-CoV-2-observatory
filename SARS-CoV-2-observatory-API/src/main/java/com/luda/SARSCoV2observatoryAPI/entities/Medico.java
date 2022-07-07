package com.luda.SARSCoV2observatoryAPI.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name="tb_medico")
public class Medico {

    @Id
    private String crm;
    private String nome;
    private String cpf;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_endereco", referencedColumnName = "id")
    private Endereco endereco;

    public Medico() {
    }

    public Medico(String crm, String nome, String cpf, Endereco endereco) {
        this.crm = crm;
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
    }
}
