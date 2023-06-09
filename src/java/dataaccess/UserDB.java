/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Role;
import models.User;

/**
 *
 * @author Legin
 */
public class UserDB {


    public List<User> getAll(String owner)  throws Exception{
        List<User> users = new ArrayList<>();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM user WHERE email=?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, owner);
            rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String password = rs.getString(4);
                Role role = rs.getRole(6, 7);
                
                User user = new User(email, firstName, lastName, password, role);
                users.add(user);
            }
        } finally {
                        DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
            
        }
        return users;
    }
}
