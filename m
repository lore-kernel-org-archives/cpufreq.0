From: bugme-daemon@osdl.org
Subject: [Bug 3952] powernow-k7 driver will NOT compile in kernel or as
	module
Date: Sun, 26 Dec 2004 23:50:09 -0800
Message-ID: <200412270750.iBR7o9Fh005031@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3952





------- Additional Comments From akpm@digeo.com  2004-12-26 23:50 -------
Line 467 of powernow-k7.c doesn't refer to mobile_vid_table.  I
suspect your tree is corrupted.  Please download a new one
and recheck.  If the problem remains we'll need the .config.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
