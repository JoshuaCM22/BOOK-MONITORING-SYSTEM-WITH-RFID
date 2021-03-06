/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JFrames;

import java.awt.Toolkit;
import java.awt.event.KeyEvent;
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
public class JFrame_CreateAnotherAccount extends javax.swing.JFrame {

    /**
     * Creates new form JFrame_CreateAnotherAccount
     */
    public JFrame_CreateAnotherAccount() {
        initComponents();
        DatabaseConnection dbc = DatabaseConnection.getDatabaseConnection();
        con = dbc.getConnection();
        reset();
        setIcon();
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
        lblUsername = new javax.swing.JLabel();
        lblPassword = new javax.swing.JLabel();
        txtUsername = new javax.swing.JTextField();
        txtPassword = new javax.swing.JPasswordField();
        chkShowPassword = new javax.swing.JCheckBox();
        txtGivenName = new javax.swing.JTextField();
        lblGivenName = new javax.swing.JLabel();
        txtMiddleInitial = new javax.swing.JTextField();
        lblMiddleInitial = new javax.swing.JLabel();
        lblLastName = new javax.swing.JLabel();
        txtLastName = new javax.swing.JTextField();
        lblSuffix = new javax.swing.JLabel();
        cmbSecretQuestion = new javax.swing.JComboBox<>();
        txtSecretAnswer = new javax.swing.JPasswordField();
        lblSecretQuestion = new javax.swing.JLabel();
        lblSecretAnswer = new javax.swing.JLabel();
        chkShowSecretAnswer = new javax.swing.JCheckBox();
        btnBack = new javax.swing.JButton();
        btnConfirm = new javax.swing.JButton();
        cmbSuffix = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("CREATE ANOTHER ACCOUNT");
        setFont(new java.awt.Font("Segoe UI", 0, 10)); // NOI18N
        setResizable(false);

        jPanel1.setBackground(java.awt.Color.white);

        lblUsername.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblUsername.setText("Username");

        lblPassword.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblPassword.setText("Password");

        txtUsername.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txtUsername.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        txtUsername.setName(""); // NOI18N
        txtUsername.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtUsernameKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtUsernameKeyTyped(evt);
            }
        });

        txtPassword.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txtPassword.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        txtPassword.setAutoscrolls(false);
        txtPassword.setPreferredSize(new java.awt.Dimension(14, 28));
        txtPassword.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtPasswordKeyTyped(evt);
            }
        });

        chkShowPassword.setBackground(java.awt.Color.white);
        chkShowPassword.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        chkShowPassword.setText("Show Password");
        chkShowPassword.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        chkShowPassword.setFocusable(false);
        chkShowPassword.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                chkShowPasswordActionPerformed(evt);
            }
        });

        txtGivenName.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txtGivenName.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        txtGivenName.setName(""); // NOI18N
        txtGivenName.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtGivenNameKeyTyped(evt);
            }
        });

        lblGivenName.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblGivenName.setText("Given Name");

        txtMiddleInitial.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txtMiddleInitial.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        txtMiddleInitial.setName(""); // NOI18N
        txtMiddleInitial.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtMiddleInitialKeyTyped(evt);
            }
        });

        lblMiddleInitial.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblMiddleInitial.setText("Middle Initial");

        lblLastName.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblLastName.setText("Last Name");

        txtLastName.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txtLastName.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        txtLastName.setName(""); // NOI18N
        txtLastName.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtLastNameKeyTyped(evt);
            }
        });

        lblSuffix.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblSuffix.setText("Suffix");

        cmbSecretQuestion.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        cmbSecretQuestion.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "None", "What is your favorite color?", "What is your contact number?", "When is your birthday?", "What is love for you?", "Where were you born ?", "What is the meaning of life?", "What is your gender?", "What is your civil status in life?", "What is your dream in life?", "What things that makes you happy?", "What things that makes you sad?", "What things that makes you mad?", "What is your job?", "What is your favorite song?", "What is your favorite band?", "What is your favorite singer?" }));

        txtSecretAnswer.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        txtSecretAnswer.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        txtSecretAnswer.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtSecretAnswerKeyTyped(evt);
            }
        });

        lblSecretQuestion.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblSecretQuestion.setText("Secret Question");

        lblSecretAnswer.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        lblSecretAnswer.setText("Secret Answer");

        chkShowSecretAnswer.setBackground(java.awt.Color.white);
        chkShowSecretAnswer.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        chkShowSecretAnswer.setText("Show Secret Answer");
        chkShowSecretAnswer.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        chkShowSecretAnswer.setFocusable(false);
        chkShowSecretAnswer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                chkShowSecretAnswerActionPerformed(evt);
            }
        });

        btnBack.setBackground(new java.awt.Color(0, 153, 0));
        btnBack.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnBack.setForeground(java.awt.Color.white);
        btnBack.setText("BACK");
        btnBack.setBorderPainted(false);
        btnBack.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnBack.setFocusPainted(false);
        btnBack.setFocusable(false);
        btnBack.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBackActionPerformed(evt);
            }
        });

        btnConfirm.setBackground(new java.awt.Color(0, 153, 0));
        btnConfirm.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnConfirm.setForeground(java.awt.Color.white);
        btnConfirm.setText("CONFIRM");
        btnConfirm.setBorderPainted(false);
        btnConfirm.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnConfirm.setFocusable(false);
        btnConfirm.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnConfirmActionPerformed(evt);
            }
        });

        cmbSuffix.setFont(new java.awt.Font("Tahoma", 0, 15)); // NOI18N
        cmbSuffix.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "None", "Jr", "Sr" }));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(117, 117, 117)
                        .addComponent(btnConfirm, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(52, 52, 52)
                        .addComponent(btnBack, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addGap(75, 75, 75)
                                    .addComponent(lblSecretAnswer))
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                    .addContainerGap()
                                    .addComponent(lblSecretQuestion)))
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addGap(83, 83, 83)
                                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addComponent(lblPassword)
                                        .addComponent(lblGivenName)
                                        .addComponent(lblMiddleInitial)
                                        .addComponent(lblLastName)
                                        .addComponent(lblSuffix)))
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                    .addGap(103, 103, 103)
                                    .addComponent(lblUsername))))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cmbSuffix, javax.swing.GroupLayout.PREFERRED_SIZE, 243, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(txtUsername, javax.swing.GroupLayout.PREFERRED_SIZE, 241, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, 241, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(chkShowPassword)
                                .addComponent(txtGivenName, javax.swing.GroupLayout.PREFERRED_SIZE, 241, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(txtMiddleInitial, javax.swing.GroupLayout.PREFERRED_SIZE, 241, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(txtLastName, javax.swing.GroupLayout.PREFERRED_SIZE, 241, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(chkShowSecretAnswer)
                                .addComponent(cmbSecretQuestion, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(txtSecretAnswer, javax.swing.GroupLayout.PREFERRED_SIZE, 286, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                .addContainerGap(63, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(66, 66, 66)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtUsername, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblUsername))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblPassword)
                    .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(chkShowPassword)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtGivenName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblGivenName))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtMiddleInitial, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblMiddleInitial))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lblLastName)
                    .addComponent(txtLastName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblSuffix)
                    .addComponent(cmbSuffix, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(25, 25, 25)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cmbSecretQuestion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblSecretQuestion))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtSecretAnswer, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblSecretAnswer))
                .addGap(18, 18, 18)
                .addComponent(chkShowSecretAnswer)
                .addGap(47, 47, 47)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnConfirm)
                    .addComponent(btnBack))
                .addContainerGap(41, Short.MAX_VALUE))
        );

        txtGivenName.getAccessibleContext().setAccessibleName("");
        txtGivenName.getAccessibleContext().setAccessibleDescription("");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents
   private void reset() {
        txtUsername.setText("");
        txtPassword.setText("");
        txtGivenName.setText("");
        txtMiddleInitial.setText("");
        txtLastName.setText("");
        cmbSuffix.setSelectedItem("None");
        cmbSecretQuestion.setSelectedItem("None");
        txtSecretAnswer.setText("");
        chkShowPassword.setSelected(false);
        chkShowSecretAnswer.setSelected(false);
        btnBack.setText("BACK");
    }

    private void setIcon() {
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("ICON.png")));
    }
    private void txtGivenNameKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtGivenNameKeyTyped
        char c = evt.getKeyChar();
        if (!(Character.isAlphabetic(c) || c == KeyEvent.VK_DELETE || Character.isWhitespace(c))) {
            evt.consume();
        }
        if (txtGivenName.getText()
                .length() >= 23) {
            evt.consume();
        }
    }//GEN-LAST:event_txtGivenNameKeyTyped

    private void validation() {
        if (txtUsername.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "No Username Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            txtUsername.requestFocus();
        } else if (txtPassword.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "No Password Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            txtPassword.requestFocus();
        } else if (txtGivenName.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "No Given Name Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            txtGivenName.requestFocus();
        } else if (txtMiddleInitial.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "No Middle Initial Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            txtMiddleInitial.requestFocus();
        } else if (txtLastName.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "No Last Name Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            txtLastName.requestFocus();
        } else if (cmbSecretQuestion.getSelectedItem().equals("None")) {
            JOptionPane.showMessageDialog(this, "No Secret Question Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            cmbSecretQuestion.requestFocus();
        } else if (txtSecretAnswer.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "No Secret Answer Found!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            txtSecretAnswer.requestFocus();
        } else {
            checkingUsername();
        }
    }

    private void checkingUsername() {
        try {
            pst = con.prepareStatement("SELECT * FROM tbl_users WHERE username=?");
            pst.setString(1, txtUsername.getText());
            rs = pst.executeQuery();
            if (rs.next()) {
                JOptionPane.showMessageDialog(this, "This Username is already taken!", "ATTENTION", JOptionPane.ERROR_MESSAGE);
            } else {
                creatingAccount();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex);
            ex.printStackTrace();
        }
    }

    private void creatingAccount() {
        try {
            String full_name;
            char space = ' ';
            if (cmbSuffix.getSelectedItem().equals("None")) {
                full_name = txtGivenName.getText() + space + txtMiddleInitial.getText() + "." + space + txtLastName.getText();
            } else {
                full_name = txtGivenName.getText() + space + txtMiddleInitial.getText() + "." + space + txtLastName.getText() + space + cmbSuffix.getSelectedItem() + ".";
            }
            String hashedPassword = BCrypt.hashpw(txtPassword.getText(), BCrypt.gensalt(12));
            String hashedSecretAnswer = BCrypt.hashpw(txtSecretAnswer.getText(), BCrypt.gensalt(12));
            cst = con.prepareCall("{call sp_InsertNewUser(?, ?, ?, ?, ?)}");
            cst.setString("param_username", txtUsername.getText());
            cst.setString("param_password", hashedPassword);
            cst.setString("param_fullname", full_name);
            cst.setString("param_secretquestion", cmbSecretQuestion.getSelectedItem().toString());
            cst.setString("param_secretanswer", hashedSecretAnswer);
            if (cst.executeUpdate() == 1) {
                JOptionPane.showMessageDialog(this, "Successfully created!");
                reset();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex);
            ex.printStackTrace();
        }
    }

    private void btnConfirmActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnConfirmActionPerformed
        validation();
    }//GEN-LAST:event_btnConfirmActionPerformed

    private void chkShowSecretAnswerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_chkShowSecretAnswerActionPerformed
        if (chkShowSecretAnswer.isSelected()) {
            txtSecretAnswer.setEchoChar((char) 0);
        } else {
            txtSecretAnswer.setEchoChar('*');
        }
        this.lblUsername.requestFocus();
    }//GEN-LAST:event_chkShowSecretAnswerActionPerformed

    private void txtSecretAnswerKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSecretAnswerKeyTyped
        char c = evt.getKeyChar();
        if (!(Character.isAlphabetic(c) || Character.isDigit(c) || Character.isWhitespace(c) || c == KeyEvent.VK_DELETE)) {
            evt.consume();
        }
        if (txtSecretAnswer.getText().length() >= 20) {
            evt.consume();
        }
    }//GEN-LAST:event_txtSecretAnswerKeyTyped

    private void txtPasswordKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtPasswordKeyTyped
        char c = evt.getKeyChar();
        if (!(Character.isAlphabetic(c) || Character.isDigit(c) || c == KeyEvent.VK_DELETE)) {
            evt.consume();
        }
        if (txtPassword.getText().length() >= 12) {
            evt.consume();
        }
    }//GEN-LAST:event_txtPasswordKeyTyped

    private void chkShowPasswordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_chkShowPasswordActionPerformed
        if (chkShowPassword.isSelected()) {
            txtPassword.setEchoChar((char) 0);
        } else {
            txtPassword.setEchoChar('*');
        }
        this.lblUsername.requestFocus();
    }//GEN-LAST:event_chkShowPasswordActionPerformed

    private void txtUsernameKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtUsernameKeyTyped
        char c = evt.getKeyChar();
        if (!(Character.isAlphabetic(c) || Character.isDigit(c) || c == KeyEvent.VK_DELETE)) {
            evt.consume();
        }
        if (txtUsername.getText().length() >= 12) {
            evt.consume();
        }
    }//GEN-LAST:event_txtUsernameKeyTyped

    private void txtUsernameKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtUsernameKeyReleased
        if (!txtUsername.getText().equals("")) {
            btnBack.setText("CANCEL");
        } else {
            btnBack.setText("BACK");
        }
    }//GEN-LAST:event_txtUsernameKeyReleased

    private void btnBackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBackActionPerformed
        if (btnBack.getText().equals("BACK")) {
            this.hide();
            new JFrame_Main().setVisible(true);
        } else {
            int question = JOptionPane.showConfirmDialog(null, " Are you sure want to cancel?", "ATTENTION", JOptionPane.YES_NO_OPTION);
            if (question == JOptionPane.YES_OPTION) //(P==0) //YES FOR 0 NO FOR 1
            {
                this.hide();
                new JFrame_Main().setVisible(true);
            }
        }
    }//GEN-LAST:event_btnBackActionPerformed

    private void txtLastNameKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtLastNameKeyTyped
        char c = evt.getKeyChar();
        if (!(Character.isAlphabetic(c) || c == KeyEvent.VK_DELETE || Character.isWhitespace(c))) {
            evt.consume();
        }
        if (txtLastName.getText().length() >= 23) {
            evt.consume();
        }
    }//GEN-LAST:event_txtLastNameKeyTyped

    private void txtMiddleInitialKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtMiddleInitialKeyTyped
        char c = evt.getKeyChar();
        if (!(Character.isAlphabetic(c) || Character.isDigit(c) || c == KeyEvent.VK_DELETE)) {
            evt.consume();
        }
        if (txtMiddleInitial.getText().length() >= 1) {
            evt.consume();
        }
    }//GEN-LAST:event_txtMiddleInitialKeyTyped

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
            java.util.logging.Logger.getLogger(JFrame_CreateAnotherAccount.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFrame_CreateAnotherAccount.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFrame_CreateAnotherAccount.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFrame_CreateAnotherAccount.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFrame_CreateAnotherAccount().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBack;
    private javax.swing.JButton btnConfirm;
    private javax.swing.JCheckBox chkShowPassword;
    private javax.swing.JCheckBox chkShowSecretAnswer;
    private javax.swing.JComboBox<String> cmbSecretQuestion;
    private javax.swing.JComboBox<String> cmbSuffix;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel lblGivenName;
    private javax.swing.JLabel lblLastName;
    private javax.swing.JLabel lblMiddleInitial;
    private javax.swing.JLabel lblPassword;
    private javax.swing.JLabel lblSecretAnswer;
    private javax.swing.JLabel lblSecretQuestion;
    private javax.swing.JLabel lblSuffix;
    private javax.swing.JLabel lblUsername;
    private javax.swing.JTextField txtGivenName;
    private javax.swing.JTextField txtLastName;
    private javax.swing.JTextField txtMiddleInitial;
    private javax.swing.JPasswordField txtPassword;
    private javax.swing.JPasswordField txtSecretAnswer;
    private javax.swing.JTextField txtUsername;
    // End of variables declaration//GEN-END:variables

}
