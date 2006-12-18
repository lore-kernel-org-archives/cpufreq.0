From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7700] linux-2.6-20-rc1: kernel BUG at
	drivers/cpufreq/cpufreq_userspace.c
Date: Mon, 18 Dec 2006 15:50:54 -0800
Message-ID: <200612182350.kBINosET029441@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7700





------- Additional Comments From cogel@rrz.uni-koeln.de  2006-12-18 15:46 -------
The patch from Mattia Dongili fixed the bug as far as I can tell.
No kernel bug during boot. No freezing system.


Thanks!



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
