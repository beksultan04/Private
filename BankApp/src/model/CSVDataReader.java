package model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CSVDataReader {
    public static List<Client> readClients(String filePath) {
        List<Client> clients = new ArrayList<>();
        String line;
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 5) {
                    Account account = new Account(data[3], Double.parseDouble(data[4]));
                    Client client = new Client(data[0], data[1], data[2], account);
                    clients.add(client);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return clients;
    }
}