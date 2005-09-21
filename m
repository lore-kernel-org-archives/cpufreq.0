From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 4781] Conservative governor makes me lose my USB keyboard
Date: Wed, 21 Sep 2005 01:02:43 -0700
Message-ID: <200509210802.j8L82hXG011080@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=4781





------- Additional Comments From koerner@in.tu-clausthal.de  2005-09-21 01:02 -------
Edit to comment #7: ondemand works, conservative doesn't - just a copy&pase 
mistake.
echo "conservative" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
results in loose of the keyboard.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
