package com.luda.SARSCoV2observatoryAPI.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name="tb_registro_desfecho")
public class RegistroDesfecho {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private S
}
