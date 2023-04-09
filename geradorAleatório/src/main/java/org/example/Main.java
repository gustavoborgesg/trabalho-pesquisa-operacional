package org.example;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

public class Main {
    public static void main(String[] args) {
        String nomeArquivo = "param.dat";
        int numeroParam = Integer.parseInt(args[0]);
        Random random = new Random();
        try {
            FileOutputStream arquivo = new FileOutputStream(nomeArquivo);
            PrintWriter pw = new PrintWriter(arquivo);

            // escrevendo dados no arquivo em formato legível
            pw.println("param demanda :=");
            for(int i = 1; i<=numeroParam; i++){
                pw.printf("%d %d\n", i, random.nextInt(1001) + 1000);
            }
            pw.println(";");

            pw.println("param limiteProducao :=");
            for(int i = 1; i<=numeroParam; i++){
                pw.printf("%d %d\n", i, random.nextInt(1001) + 1000);
            }
            pw.println(";");

            pw.println("param custoFixo :=");
            for(int i = 1; i<=numeroParam; i++){
                pw.printf("%d %d\n", i, random.nextInt(1001) + 1000);
            }
            pw.println(";");

            pw.print("param custoTransporte :");

            for(int i = 1; i<=numeroParam; i++){
                pw.printf("  %d", i);
            }
            pw.print(" :=");
            pw.println();
            for(int i = 1; i<=numeroParam; i++){
                pw.printf("%-10d", i);
                for(int j = 1; j<=numeroParam; j++){
                    pw.printf("  %d", random.nextInt(10001) + 10000);
                }
                pw.println();
            }
            pw.println(";");
            pw.println("end;");

            // fechando o arquivo
            pw.close();
            arquivo.close();
            System.out.println("Arquivo criado e salvo com sucesso!");
        } catch (IOException e) {
            System.out.println("Erro ao criar arquivo: " + e.getMessage());
        }
    }
}