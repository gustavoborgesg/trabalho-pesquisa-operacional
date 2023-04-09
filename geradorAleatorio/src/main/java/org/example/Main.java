package org.example;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class Main {
    public static void main(String[] args) {
        String nomeArquivo = "param.dat";
        int numeroParam = Integer.parseInt(args[0]);
        Random random = new Random();
        try {
            BufferedWriter arquivo = new BufferedWriter(new FileWriter(nomeArquivo));

            escreverParametros(arquivo, "demanda", numeroParam, random);
            escreverParametros(arquivo, "limiteProducao", numeroParam, random);
            escreverParametros(arquivo, "custoFixo", numeroParam, random);

            arquivo.write("param custoTransporte :");
            for (int i = 1; i <= numeroParam; i++) {
                arquivo.write("  " + i);
            }
            arquivo.write(" :=\n");
            for (int i = 1; i <= numeroParam; i++) {
                arquivo.write(String.format("%-10d", i));
                for (int j = 1; j <= numeroParam; j++) {
                    arquivo.write("  " + (random.nextInt(10001) + 10000));
                }
                arquivo.write("\n");
            }
            arquivo.write(";\n");
            arquivo.write("end;");
            arquivo.close();

            System.out.println("Arquivo criado e salvo com sucesso!");
        } catch (IOException e) {
            System.out.println("Erro ao criar arquivo: " + e.getMessage());
        }
    }

    private static void escreverParametros(BufferedWriter arquivo, String nome, int numeroParam, Random random) throws IOException {
        arquivo.write("param " + nome + " :=\n");
        for (int i = 1; i <= numeroParam; i++) {
            arquivo.write(String.format("%-10d%d\n", i, random.nextInt(1001) + 1000));
        }
        arquivo.write(";\n");
    }
}