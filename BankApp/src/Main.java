import model.Client;
import model.CSVDataReader;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Bank Client Data");
        frame.setSize(800, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel panel = new JPanel(new FlowLayout());

        JButton loadButton = new JButton("Load Clients");
        loadButton.setPreferredSize(new Dimension(200, 40));
        panel.add(loadButton);

        String[] columns = {"First Name", "Last Name", "Passport", "Account Number", "Balance"};
        DefaultTableModel tableModel = new DefaultTableModel(columns, 0);
        JTable table = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(table);

        frame.setLayout(new BorderLayout());
        frame.add(panel, BorderLayout.SOUTH);
        frame.add(scrollPane, BorderLayout.CENTER);

        loadButton.addActionListener(e -> {
            List<Client> clients = CSVDataReader.readClients("data/clients.csv");
            tableModel.setRowCount(0);
            for (Client client : clients) {
                tableModel.addRow(client.toArray());
            }
        });

        frame.setVisible(true);
    }
}