package app;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * A simple Table Object for better handling of Query ResultSets.
 *
 */
public class SimpleTable {

	private List<String> columnNames;
	private int[] columnWidth;
	private List<List<String>> tableData;

	/**
	 * Constructor method for SimpleTable
	 * 
	 * @param rset
	 *            Takes a ResultSet as input to create and fill the table.
	 * @throws SQLException
	 *             SQLException on Query errors.
	 */
	public SimpleTable(ResultSet rset) throws SQLException {
		ResultSetMetaData rsmd = rset.getMetaData();
		int columnCount = rsmd.getColumnCount();
		columnNames = new ArrayList<String>();
		columnWidth = new int[columnCount];
		tableData = new ArrayList<List<String>>();

		for (int i = 1; i <= columnCount; i++) {
			String columnName = rsmd.getColumnName(i);
			columnNames.add(columnName);
			columnWidth[i - 1] = Math.max(columnName.length(), columnWidth[i - 1]);
		}

		while (rset.next()) {
			List<String> dataRowTemp = new ArrayList<String>(columnCount);
			for (int i = 1; i <= columnCount; i++) {
				dataRowTemp.add(rset.getString(i));
				columnWidth[i - 1] = Math.max(dataRowTemp.get(i - 1).length(), columnWidth[i - 1]);
			}
			tableData.add(dataRowTemp);
		}
	}

	// public Iterator<List<String>> iterator() {
	// return tableData.iterator();
	// }

	/**
	 * @return the tableData
	 */
	public List<List<String>> getTableData() {
		return tableData;
	}

	/**
	 * @return the columnNames
	 */
	public List<String> getColumnNames() {
		return columnNames;
	}

	/**
	 * This method outputs the SimpleTable to the console.
	 * 
	 */
	public void printToConsole() {
		// Header:
		for (int i = 0; i < columnNames.size(); i++) {
			int width = columnWidth[i] + 4;
			System.out.printf("%-" + width + "." + (width - 2) + "s", columnNames.get(i));
		}
		System.out.println();
		// dividing line
		for (int i = 0; i < columnNames.size(); i++) {
			int width = columnWidth[i] + 2;
			String repeated = new String(new char[width]).replace("\0", "-");
			System.out.print(repeated + "  ");
		}
		System.out.println();
		// Data:
		for (List<String> row : tableData) {
			for (int i = 0; i < row.size(); i++) {
				int width = columnWidth[i] + 4;
				System.out.printf("%-" + width + "." + (width - 2) + "s", row.get(i));
			}
			System.out.println();
		}
	}

	/**
	 * This method creates a HTML Table from the tabledata and returns it as a
	 * string.
	 * 
	 * @return The tabledata in a string, formatted as a HTML Table.
	 */
	public String getWebTable() {
		StringBuilder SBuilder = new StringBuilder();
		SBuilder.append("<table>\n");
		for (List<String> row : tableData) {
			SBuilder.append("\t<tr>\n");
			for (String entry : row) {
				SBuilder.append("\t\t<td>");
				SBuilder.append(entry);
				SBuilder.append("</td>\n");
			}
			SBuilder.append("\t</tr>\n");
		}
		SBuilder.append("</table>\n");
		return SBuilder.toString();
	}

}
