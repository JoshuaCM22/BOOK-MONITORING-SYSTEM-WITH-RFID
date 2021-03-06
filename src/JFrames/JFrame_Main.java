/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JFrames;

import static JFrames.Objects.con;
import static JFrames.Objects.pst;
import static JFrames.Objects.rs;
import java.awt.ComponentOrientation;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.Timer;
import java.time.*;
import java.util.ArrayList;
import javax.swing.Box;

/**
 *
 * @author Joshua C. Magoliman
 */
public class JFrame_Main extends javax.swing.JFrame {

    /**
     * Creates new form JFrame_Main
     */
    public static String accountName;
    public static int accountId;

    public JFrame_Main() {
        initComponents();
        setIcon();
        showDateAndTime();
        lblAccountName.setText("Account Name: " + accountName);
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
        btnBorrowingDetails = new javax.swing.JButton();
        lblTime = new javax.swing.JLabel();
        lblDate = new javax.swing.JLabel();
        lblDay = new javax.swing.JLabel();
        btnBookList = new javax.swing.JButton();
        btnStudentList = new javax.swing.JButton();
        btnBorrowBook = new javax.swing.JButton();
        lblTitle = new javax.swing.JLabel();
        btnReturnBook = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        lblAccountName = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        mChangePassword = new javax.swing.JMenuItem();
        mCreateAnotherAccount = new javax.swing.JMenuItem();
        mViewAccounts = new javax.swing.JMenuItem();
        mLogout = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("MAIN");
        setFont(new java.awt.Font("Tahoma", 0, 10)); // NOI18N
        setUndecorated(true);
        setResizable(false);

        jPanel1.setBackground(java.awt.Color.white);

        btnBorrowingDetails.setBackground(new java.awt.Color(0, 153, 0));
        btnBorrowingDetails.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnBorrowingDetails.setForeground(java.awt.Color.white);
        btnBorrowingDetails.setText("BORROWED DETAILS");
        btnBorrowingDetails.setBorderPainted(false);
        btnBorrowingDetails.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnBorrowingDetails.setDefaultCapable(false);
        btnBorrowingDetails.setFocusPainted(false);
        btnBorrowingDetails.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnBorrowingDetails.setRequestFocusEnabled(false);
        btnBorrowingDetails.setSelected(true);
        btnBorrowingDetails.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBorrowingDetailsActionPerformed(evt);
            }
        });

        lblTime.setFont(new java.awt.Font("Tahoma", 0, 20)); // NOI18N
        lblTime.setText("TIME");

        lblDate.setFont(new java.awt.Font("Tahoma", 0, 20)); // NOI18N
        lblDate.setText("DATE");

        lblDay.setFont(new java.awt.Font("Tahoma", 0, 20)); // NOI18N
        lblDay.setHorizontalAlignment(javax.swing.SwingConstants.TRAILING);
        lblDay.setText("DAY");

        btnBookList.setBackground(new java.awt.Color(0, 153, 0));
        btnBookList.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnBookList.setForeground(java.awt.Color.white);
        btnBookList.setText("BOOK LIST");
        btnBookList.setBorderPainted(false);
        btnBookList.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnBookList.setDefaultCapable(false);
        btnBookList.setFocusPainted(false);
        btnBookList.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnBookList.setRequestFocusEnabled(false);
        btnBookList.setSelected(true);
        btnBookList.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBookListActionPerformed(evt);
            }
        });

        btnStudentList.setBackground(new java.awt.Color(0, 153, 0));
        btnStudentList.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnStudentList.setForeground(java.awt.Color.white);
        btnStudentList.setText("STUDENT LIST");
        btnStudentList.setBorderPainted(false);
        btnStudentList.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnStudentList.setDefaultCapable(false);
        btnStudentList.setFocusPainted(false);
        btnStudentList.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnStudentList.setRequestFocusEnabled(false);
        btnStudentList.setSelected(true);
        btnStudentList.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnStudentListActionPerformed(evt);
            }
        });

        btnBorrowBook.setBackground(new java.awt.Color(0, 153, 0));
        btnBorrowBook.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnBorrowBook.setForeground(java.awt.Color.white);
        btnBorrowBook.setText("BORROW BOOK");
        btnBorrowBook.setBorderPainted(false);
        btnBorrowBook.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnBorrowBook.setDefaultCapable(false);
        btnBorrowBook.setFocusPainted(false);
        btnBorrowBook.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnBorrowBook.setRequestFocusEnabled(false);
        btnBorrowBook.setSelected(true);
        btnBorrowBook.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBorrowBookActionPerformed(evt);
            }
        });

        lblTitle.setBackground(java.awt.Color.black);
        lblTitle.setFont(new java.awt.Font("Tahoma", 1, 39)); // NOI18N
        lblTitle.setText("BOOK MONITORING SYSTEM");

        btnReturnBook.setBackground(new java.awt.Color(0, 153, 0));
        btnReturnBook.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnReturnBook.setForeground(java.awt.Color.white);
        btnReturnBook.setText("RETURN BOOK");
        btnReturnBook.setBorderPainted(false);
        btnReturnBook.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnReturnBook.setDefaultCapable(false);
        btnReturnBook.setFocusPainted(false);
        btnReturnBook.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnReturnBook.setRequestFocusEnabled(false);
        btnReturnBook.setSelected(true);
        btnReturnBook.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnReturnBookActionPerformed(evt);
            }
        });

        jPanel2.setBackground(new java.awt.Color(0, 153, 0));

        lblAccountName.setFont(new java.awt.Font("Tahoma", 0, 19)); // NOI18N
        lblAccountName.setForeground(java.awt.Color.white);
        lblAccountName.setHorizontalAlignment(javax.swing.SwingConstants.TRAILING);
        lblAccountName.setText("Account Name: ");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(226, 226, 226)
                .addComponent(lblAccountName)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addComponent(lblAccountName)
                .addContainerGap(23, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(166, 166, 166)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                            .addComponent(btnBorrowBook, javax.swing.GroupLayout.PREFERRED_SIZE, 204, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnReturnBook, javax.swing.GroupLayout.PREFERRED_SIZE, 204, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGroup(jPanel1Layout.createSequentialGroup()
                            .addComponent(btnBookList, javax.swing.GroupLayout.PREFERRED_SIZE, 204, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(68, 68, 68)
                            .addComponent(btnStudentList, javax.swing.GroupLayout.PREFERRED_SIZE, 204, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(130, 130, 130)
                        .addComponent(btnBorrowingDetails, javax.swing.GroupLayout.PREFERRED_SIZE, 204, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 142, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(56, 56, 56)
                .addComponent(lblDate)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(lblDay)
                .addGap(208, 208, 208)
                .addComponent(lblTime)
                .addGap(47, 47, 47))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(121, Short.MAX_VALUE)
                .addComponent(lblTitle)
                .addGap(118, 118, 118))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(38, 38, 38)
                .addComponent(lblTitle)
                .addGap(54, 54, 54)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnStudentList, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnBookList, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(32, 32, 32)
                .addComponent(btnBorrowingDetails, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnBorrowBook, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnReturnBook, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 105, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblDate)
                    .addComponent(lblDay)
                    .addComponent(lblTime))
                .addGap(48, 48, 48)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        jMenuBar1.setBackground(java.awt.Color.white);
        jMenuBar1.setOpaque(false);
        jMenuBar1.setSelectionModel(null);
        jMenuBar1.add(Box.createHorizontalGlue());
        jMenuBar1.add(jMenu1);

        jMenu1.setBorder(null);
        jMenu1.setText("SETTINGS");
        jMenu1.setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);
        jMenu1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jMenu1.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jMenu1.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);

        mChangePassword.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        mChangePassword.setText("Change Password");
        mChangePassword.setComponentOrientation(ComponentOrientation.LEFT_TO_RIGHT);
        mChangePassword.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        mChangePassword.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        mChangePassword.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        mChangePassword.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mChangePasswordActionPerformed(evt);
            }
        });
        jMenu1.add(mChangePassword);

        mCreateAnotherAccount.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        mCreateAnotherAccount.setText("Create Another Account");
        mCreateAnotherAccount.setComponentOrientation(ComponentOrientation.LEFT_TO_RIGHT);
        mCreateAnotherAccount.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        mCreateAnotherAccount.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        mCreateAnotherAccount.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        mCreateAnotherAccount.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mCreateAnotherAccountActionPerformed(evt);
            }
        });
        jMenu1.add(mCreateAnotherAccount);

        mViewAccounts.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        mViewAccounts.setText("View Accounts");
        mViewAccounts.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        mViewAccounts.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        mViewAccounts.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        mViewAccounts.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mViewAccountsActionPerformed(evt);
            }
        });
        jMenu1.add(mViewAccounts);

        mLogout.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        mLogout.setText("Log-out");
        jMenuBar1.setComponentOrientation(ComponentOrientation.LEFT_TO_RIGHT);
        mLogout.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        mLogout.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        mLogout.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        mLogout.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mLogoutActionPerformed(evt);
            }
        });
        jMenu1.add(mLogout);

        jMenuBar1.add(jMenu1);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void setIcon() {
        setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("ICON.png")));
    }

    private void showDateAndTime() {
        Date d = new Date();
        SimpleDateFormat s = new SimpleDateFormat("MMMM dd, yyyy");
        lblDate.setText(s.format(d));
        new Timer(0, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Date date = new Date();
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("hh:mm:ss a");
                lblTime.setText(simpleDateFormat.format(date));
                String dayToday = LocalDateTime.now().getDayOfWeek().toString();
                String convertToLowerCase = dayToday.toLowerCase();
                String output = convertToLowerCase.substring(0, 1).toUpperCase() + convertToLowerCase.substring(1);
                lblDay.setText(output);
            }
        }).start();
    }

    public void comparingTheBorrowedUntilAndDateToday() {
        try {
            ArrayList<Integer> myArrayList = new ArrayList<Integer>();
            pst = con.prepareStatement("SELECT DISTINCT student_id FROM book_monitoring_system_with_rfid.tbl_borrowed_details WHERE borrowed_until_date < curdate() AND received_by = 0");
            rs = pst.executeQuery();
            while (rs.next()) {
                myArrayList.add(rs.getInt(1));
            }
            for (Integer x : myArrayList) {
                System.out.println(x);
                updatingTheStudentStatusToNotAllowed(x);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex);
            ex.printStackTrace();
        }
    }

    private void updatingTheStudentStatusToNotAllowed(int retrievedStudentID) {
        try {
            pst = con.prepareStatement("UPDATE tbl_students SET status_id = ? WHERE id = ?");
            pst.setInt(1, 2);
            pst.setInt(2, retrievedStudentID);
            pst.executeUpdate();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex);
            ex.printStackTrace();
        }
    }
    private void btnBorrowingDetailsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBorrowingDetailsActionPerformed
        this.hide();
        JFrame_BorrowedDetails nextFrame = new JFrame_BorrowedDetails();
        nextFrame.show();
    }//GEN-LAST:event_btnBorrowingDetailsActionPerformed

    private void mLogoutActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mLogoutActionPerformed
        try {
            int P = JOptionPane.showConfirmDialog(null, " Are you sure want to log-out?", "ATTENTION", JOptionPane.YES_NO_OPTION);
            if (P == JOptionPane.YES_OPTION) //(P==0) //YES FOR 0 NO FOR 1
            {
                JFrame_BorrowedDetails.previousValueOfTextBoxSearch = "";
                JFrame_BorrowedDetails.previousValueOfComboBoxFilter = "None";
                this.hide();
                JFrame_Login nextFrame = new JFrame_Login();
                nextFrame.show();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, ex);
            ex.printStackTrace();
        }
    }//GEN-LAST:event_mLogoutActionPerformed

    private void mCreateAnotherAccountActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mCreateAnotherAccountActionPerformed
        this.hide();
        JFrame_CreateAnotherAccount nextFrame = new JFrame_CreateAnotherAccount();
        nextFrame.show();
    }//GEN-LAST:event_mCreateAnotherAccountActionPerformed

    private void mChangePasswordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mChangePasswordActionPerformed
        this.hide();
        JFrame_ChangePassword nextFrame = new JFrame_ChangePassword();
        nextFrame.show();
    }//GEN-LAST:event_mChangePasswordActionPerformed

    private void btnBookListActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBookListActionPerformed
        this.hide();
        JFrame_BookList nextFrame = new JFrame_BookList();
        nextFrame.show();
    }//GEN-LAST:event_btnBookListActionPerformed

    private void btnStudentListActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnStudentListActionPerformed
        this.hide();
        JFrame_StudentList nextFrame = new JFrame_StudentList();
        nextFrame.show();
    }//GEN-LAST:event_btnStudentListActionPerformed

    private void btnBorrowBookActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBorrowBookActionPerformed
        this.hide();
        JFrame_BorrowBook nextFrame = new JFrame_BorrowBook();
        nextFrame.show();
    }//GEN-LAST:event_btnBorrowBookActionPerformed

    private void btnReturnBookActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnReturnBookActionPerformed
        this.hide();
        JFrame_ReturnBook nextFrame = new JFrame_ReturnBook();
        nextFrame.show();
    }//GEN-LAST:event_btnReturnBookActionPerformed

    private void mViewAccountsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mViewAccountsActionPerformed
        this.hide();
        JFrame_ViewAccounts nextFrame = new JFrame_ViewAccounts();
        nextFrame.show();
    }//GEN-LAST:event_mViewAccountsActionPerformed

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
            java.util.logging.Logger.getLogger(JFrame_Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFrame_Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFrame_Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFrame_Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFrame_Main().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBookList;
    private javax.swing.JButton btnBorrowBook;
    private javax.swing.JButton btnBorrowingDetails;
    private javax.swing.JButton btnReturnBook;
    private javax.swing.JButton btnStudentList;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    public javax.swing.JLabel lblAccountName;
    private javax.swing.JLabel lblDate;
    private javax.swing.JLabel lblDay;
    private javax.swing.JLabel lblTime;
    private javax.swing.JLabel lblTitle;
    private javax.swing.JMenuItem mChangePassword;
    private javax.swing.JMenuItem mCreateAnotherAccount;
    private javax.swing.JMenuItem mLogout;
    private javax.swing.JMenuItem mViewAccounts;
    // End of variables declaration//GEN-END:variables
}
