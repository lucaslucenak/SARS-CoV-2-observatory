package com.luda.SARSCoV2observatoryAPI.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name="tb_leito")
public class Leito {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descricao;
    private String localizacao;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_hospital", referencedColumnName = "id")
    private Hospital hospital;

    public Leito() {
    }

    public Leito(Long id, String descricao, String localizacao, Hospital hospital) {
        this.id = id;
        this.descricao = descricao;
        this.localizacao = localizacao;
        this.hospital = hospital;
    }
}
