package shopindia;
import java.sql.*;
public class POrder 
{
	private int catId; 
	private String catName;
	private DConnection db=new DConnection();
	private DConnection db2=new DConnection();
	public void setCatName(String catName)
	{
		this.catName=catName;
	}
	public String getCatName()
	{
		return catName;
	}
	public void update(String id)
	{
		db.setdata("update porders set delivered=1 where order_id="+id);
		db.close();
	}
	public ResultSet display()
	{
			ResultSet rst=db.getdata(" select * from porders where delivered=0");
			return rst;
	}
}
