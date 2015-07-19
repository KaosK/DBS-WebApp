package app.util;

/**
 * Helper Class for String to Number Conversions
 *
 */
public class Helper {

	public Helper() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * tryConvertString2Double converts a String to a Double. In case of an
	 * exception it returns 0.
	 * 
	 * @param string
	 *            The input string
	 * @return The output as a Double.
	 */
	public static double tryConvertString2Double(String string) {
		try {
			return Double.parseDouble(string);
		} catch (NumberFormatException nfe) {
			return 0;
		}
	}

	/**
	 * tryConvertString2Integer converts a String to an Integer. In case of an
	 * exception it returns 0.
	 * 
	 * @param string
	 *            The input string
	 * @return The output as an Integer.
	 */
	public static Integer tryConvertString2Integer(String string) {
		try {
			return Integer.parseInt(string);
		} catch (NumberFormatException nfe) {
			return 0;
		}
	}

}
