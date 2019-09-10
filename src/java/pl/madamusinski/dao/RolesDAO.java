/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.madamusinski.dao;

import java.util.List;
import pl.madamusinski.model.Roles;

/**
 *
 * @author maadamusinski
 */

public interface RolesDAO {
    public void addRole(Roles r);
    public void updateRole(Roles r);
    public void deleteRole(int id);
    public Roles getRoleById(int id);
    public List<Roles> getAllRoles();
}
