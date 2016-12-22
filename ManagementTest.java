import org.junit.*;
import static org.junit.Assert.*;

public class ManagementTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testProcessLogin() {
		Management user = new Management();
		assertTrue(user.processLogin("jiwan", "1410436"));
	}
	
	@Test
	public void testUpdateUserPassword() {
		Management user = new Management();
		assertEquals("123123", user.updateUserPassword("jiwan", "123123"));
	}
	
	@Test
	 public void testSetPhonebookAddProcessSql() {
		Management phonebook = new Management();
		String testSql = "";
		testSql = "INSERT INTO phoneBook(name, phone, birth, email) values(?, ?, ?, ?, ?)";
	      
	    assertEquals(testSql, phonebook.setPhonebookAddProcessSql("hyein", "01043689422", "19950421", "yui08@naver.com"));
	 }
	
	@Test
	public void testPhonebookUpdatePhone() {
		Management phonebook = new Management();
		assertEquals("01043699422", phonebook.phonebookUpdatePhone("01043689422", "01043699422"));
	}
	
	@Test
	public void testScheduleDeleteCheck() {
		Management schedule = new Management();
		assertFalse(schedule.scheduleDeleteCheck("√Îº“"));
	}
	
	@Test
	public void testScheduleUseridCheck() {
		Management schedule = new Management();
		assertNull(schedule.scheduleUseridCheck(""));
		assertNotNull(schedule.scheduleUseridCheck("jiwan"));
	}
	
}
