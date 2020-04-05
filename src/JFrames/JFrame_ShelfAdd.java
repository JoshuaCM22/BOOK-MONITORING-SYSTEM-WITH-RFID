/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JFrames;

import java.awt.Toolkit;
import javax.swing.JOptionPane;
import Connection.DatabaseConnection;
import static JFrames.Objects.con;
import static JFrames.Objects.cst;
import static JFrames.Objects.pst;
import static JFrames.Objects.rs;

/**
 *
 * @author Joshua C. Magoliman
 */
public class JFrame_ShelfAdd extends javax.swing.JFrame {

    /**
     * Creates new form JFrame_ShelfAdd
     */
    public JFrame_ShelfAdd() {
        initComponents();
        DatabaseConnection dbc = DatabaseConnection.getDatabaseConnection();
        con = dbc.getConnection();
        setIcon();
        reset();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        txtShelf = new javax.swing.JTextField();
        lblShelf = new javax.swing.JLabel();
        btnBack = new javax.swing.JButton();
        btnAdd = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("ADD NEW SHELF");
        setResizable(false);

        jPanel1.setBackground(java.awt.Color.white);
        jPanel1.setMaximumSize(null);
        jPanel1.setPreferredSize(new java.awt.Dimension(1294, 447));
        jPanel1.setRequestFocusEnabled(false);

        txtShelf.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        txtShelf.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        txtShelf.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtShelfKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtShelfKeyTyped(evt);
            }
        });

        lblShelf.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        lblShelf.setText("Shelf");

        btnBack.setBackground(new java.awt.Color(0, 153, 0));
        btnBack.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        btnBack.setForeground(java.awt.Color.white);
        btnBack.setText("BACK");
        btnBack.setBorder(null);
        btnBack.setBorderPainted(false);
        btnBack.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnBack.setFocusPainted(false);
        btnBack.setFocusable(false);
        btnBack.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBackActionPerformed(evt);
            }
        });

        btnAdd.setBackground(new java.awt.Color(0, 153, 0));
        btnAdd.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        btnAdd.setForeground(java.awt.Color.white);
        btnAdd.setText("ADD");
        btnAdd.setBorder(null);
        btnAdd.setBorderPainted(false);
        btnAdd.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAdd.setFocusPainted(false);
        btnAdd.setFocusable(false);
        btnAdd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(130, 130, 130)
                        .addComponent(lblShelf)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtShelf, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(113, 113, 113)
                        .addComponent(btnAdd, javax.swing.GroupLayout.PREFERRED_SIZE, 158, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(34, 34, 34)
                        .addComponent(btnBack, javax.swing.GroupLayout.PREFERRED_SIZE, 158, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(107, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(84, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtShelf, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblShelf))
                .addGap(102, 102, 102)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAdd, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnBack, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(54, 54, 54))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 570, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 293, Short.MAX_VALUE)
        );

        setSize(new java.awt.Dimension(586, 332));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnAddActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddActionPerformed
        validation();
    }//GEN-LAST:event_btnAddActionPerformed

    private void btnBackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBackActionPerformed
        if (btnBack.getText().equals("BACK")) {
            this.hide();
            new JFrame_ShelfList().setVisible(true);
        } else {
            int question = JOptionPane.showConfirmDialog(null, " Are you sure want to cancel?", "ATTENTION", JOptionPane.YES_NO_OPTION);
            if (question == JOptionPane.YES_OPTION) //(P==0) //YES FOR 0 NO FOR 1
            {
                this.hide();
                new JFrame_ShelfList().setVisible(true);
            }
        }
    }//GEN-LAST:event_btnBackActionPerformed

    private void txtShelfKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtShelfKeyTyped
        if (txtShelf.getText().length() >= 20) {
            evt.consume();
        }
    }//GEN-LAST:event_txtShelfKeyTyped

    private void txtShelfKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtShelfKeyReleased
        if (txtShelf.getText().equals("")) {
            btnBack.setText("BACK");
        } else {
            btnBack.setText("CANCEL");
        }
    }//GEN-LAST:event_txtShelfKeyReleased
    private void setIcon() {
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("ICON.png")));
    }

    private void reset() {
        txtShelf.setText("");
        txtShelf.requestFocus();
        btnBack.setText("BACK");
    }

    private void validation() {
        if (txtShelf.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "No Shelf Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            txtShelf.requestFocus();
        } else {
            checkingShelf();
        }
    }

    private void checkingShelf() {
        try {
            pst = con.prepareStatement("SELECT * FROM tbl_shelfs WHERE shelf = ?");
            pst.setString(1, txtShelf.getText());
            rs = pst.executeQuery();
            if (rs.next()) {
                JOptionPane.showMessageDialog(this, "This Shelf is already taken!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            } else {
                creatingShelf();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex);
            ex.printStackTrace();
        }
    }

    private void creatingShelf() {
        try {
            cst = con.prepareCall("{call sp_InsertNewShelf(?)}");
            cst.setString("param_shelf", txtShelf.getText());
            if (cst.executeUpdate() == 1) {
                JOptionPane.showMessageDialog(this, "Successfully Added!");
                reset();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex);
            ex.printStackTrace();
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(JFrame_StudentList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFrame_StudentList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFrame_StudentList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFrame_StudentList.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFrame_ShelfAdd().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAdd;
    private javax.swing.JButton btnBack;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel lblShelf;
    private javax.swing.JTextField txtShelf;
    // End of variables declaration//GEN-END:variables
}
