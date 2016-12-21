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
}
