package com.luda.SARSCoV2observatoryAPI.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Getter
@Setter
@Table(name="tb_enfermeiro")
public class Enfermeiro {

    @Id
    private String coren;
    private String nome;
    private String cpf;
    private Instant dataInicio;
    private Instant dataFim;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_endereco", referencedColumnName = "id")
    private Endereco endereco;

    public Enfermeiro() {
    }

    public Enfermeiro(String coren, String nome, String cpf, Instant dataInicio, Instant dataFim, Endereco endereco) {
        this.coren = coren;
        this.nome = nome;
        this.cpf = cpf;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.endereco = endereco;
    }
}
