package main.komiksy;
import com.sun.source.tree.WhileLoopTree;

import java.nio.file.FileSystemAlreadyExistsException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class RegisterDao {
    private String dbUrl = "jdbc:sqlite:C:\\Users\\Karolina\\Desktop\\grela - laby_prpjekt\\KomiksyProjekt\\Komiksy\\src\\main\\webapp\\baza_komiksy.sqlite";
    private String dbDriver = "org.sqlite.JDBC";
    private Connection connection;
    public RegisterDao() {
        connection = null;
        loadDriver(dbDriver);
        setConnection();
    }

    public String WybierzElement(Map<Integer, Map< String, String > > map_in, int idx, String column)
    {
        if (idx > map_in.size())
        {
            System.out.println("Nie ma takiej wartości");
        }
        return  map_in.get(idx).get(column);
    }


    public Map<Integer, Map< String, String >> getAllDataFromTable(String tableName)
    {
        Map<Integer, Map< String, String > >  WholeTable = new HashMap<Integer, Map< String, String >>();
        try {

            PreparedStatement ps = getConnection().prepareStatement(
                    "select * from " + tableName);
            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                Map< String, String > tableValues = new HashMap<>();
                tableValues.put("Tytuł", rs.getString(rs.findColumn("Tytuł")));
                tableValues.put("Scenariusz", rs.getString(rs.findColumn("Scenariusz")));
                tableValues.put("Rysunki", rs.getString(rs.findColumn("Rysunki")));
                tableValues.put("Opis", rs.getString(rs.findColumn("Opis")));
                tableValues.put("Data_wydania", rs.getString(rs.findColumn("Data_wydania")));
                WholeTable.put(rs.getRow(), tableValues );
            }
            return WholeTable;

        }catch (Exception e)
        {
            System.out.println(e);
        }
        return WholeTable;
    }

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void setConnection()
    {
        try {
            connection = DriverManager.getConnection(dbUrl);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public Connection getConnection() {
        return connection;
    }


    public String insert(Member member) {
        String result = "Data entered successfully";
        String sql = "insert into member values(?,?,?,?,?)";

        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, member.getUname());
            ps.setString(2, member.getPassword());
            ps.setString(3, member.getEmail());
            ps.setString(4, member.getPhone());
            ps.setString(5, member.getPermission());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println(e.getMessage());
            result = "Data not entered";
        }
        return result;
    }

    public boolean validateUser(String uname,String password)
    {
        boolean status=false;
        try{

            PreparedStatement ps=getConnection().prepareStatement(
                    "select permission from member where uname=? and password=?");
            ps.setString(1,uname);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();
            status=rs.next();

            //select * from member where uname=? and password=?

        }catch(Exception e){System.out.println(e);}
        return status;
    }

    public String getUserPermission(String uname,String password)
    {
        String valueOfPermission = "NULL";
        try
        {
            PreparedStatement ps=getConnection().prepareStatement(
                    "select permission from member where uname=? and password=?");
            ps.setString(1,uname);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();
            int resultIndex = rs.findColumn("permission");
            valueOfPermission = rs.getString(resultIndex);
            System.out.println("resultIndex " + resultIndex + " valueOfPermission " + valueOfPermission);

        }catch (Exception e)
        {
            System.out.println(e);
        }
        return valueOfPermission;
    }

    public ArrayList<String> getRecordsByFirstLetter(String firstLetter)  {
        ArrayList<String> tmp = new ArrayList<>();

        try {
            firstLetter += "%";
            System.out.println("firstLetter: " + firstLetter);

            //!!!!!!!!!!!!!trzeba dodac zapytanie do tabeli Marvel!!!!!!!!!!!!!!!!!!1
            PreparedStatement ps=getConnection().prepareStatement(
                    "select Tytuł from DC where Tytuł like ?");
            ps.setString(1, firstLetter);
            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                tmp.add(rs.getString(rs.findColumn("Tytuł")));
            }
            return tmp;

        }catch (Exception e)
        {
            System.out.println(e);
        }
        return tmp;
    }

    public String getUserName(String uname,String password)
    {
        String UserName = "NULL"; //
        try
        {
            PreparedStatement ps=getConnection().prepareStatement(
                    "select uname from member where uname=? and password=?");
            ps.setString(1,uname);
            ps.setString(2,password);


            ResultSet rs=ps.executeQuery();
            int resultIndex = rs.findColumn("permission");
            UserName = rs.getString(resultIndex);
            System.out.println("resultIndex " + resultIndex + " valueOfPermission " + UserName);

        }catch (Exception e)
        {
            System.out.println(e);
        }
        return UserName;
    }


}
//    public String getUser(String uname, String password) {
//        Member member = null;
//        loadDriver(dbDriver);
//        Connection con = getConnection();
//        String result = "Zalogowano pomyślnie";
//        String query;
//            query = "SELECT * FROM MEMBER where uname ='" + uname + "' AND PASSWORD = '" + password + "';";
//
//        PreparedStatement ps;
//        try {
//            ps = con.prepareStatement(query);
//            ResultSet retValue = ps.executeQuery();
//            if (!retValue.wasNull())
//            {
//                System.out.println("retValue: " + retValue.getString(1));
//            }
//            else
//            {
//             // nie ma uzytkownika
//            }
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            System.out.println(e.getMessage());
//            result = "Nie zalogowano!";
//        }
//        return result;
//
//
//    }
//}
