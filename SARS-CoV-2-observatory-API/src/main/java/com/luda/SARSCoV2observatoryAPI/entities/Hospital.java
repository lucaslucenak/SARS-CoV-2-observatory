package com.luda.SARSCoV2observatoryAPI.entities;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "tb_hospital")
public class Hospital {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_endereco", referencedColumnName = "id")
    private Endereco endereco;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name="tb_hospital_cadastra_medico",
            joinColumns = @JoinColumn(name = "id_hospital"),
            inverseJoinColumns = @JoinColumn(name="crm_medico"))
    private Set<Medico> medicos = new HashSet<>();

    public Hospital() {
    }

    public Hospital(Long id, String nome, Endereco endereco) {
        this.id = id;
        this.nome = nome;
        this.endereco = endereco;
    }

    //    private Long id_endereco;
}
