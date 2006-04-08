From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6303] Fujitsu-Siemens P4 Amilo D 7830 laptop has no govenors
	with 2.6.16
Date: Sat, 8 Apr 2006 16:19:27 -0700
Message-ID: <200604082319.k38NJRPl025803@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6303





------- Additional Comments From cbradney@zip.com.au  2006-04-08 16:19 -------
Seems to be back with 2.6.17rc1, although the minimum Mhz is now around 2333 
even with powersave governor active, max is 2666.600 (correct). The minimum 
with 2.6.15 and before used to be 333.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
