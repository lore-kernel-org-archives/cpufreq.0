From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7700] linux-2.6-20-rc1: kernel BUG at
	drivers/cpufreq/cpufreq_userspace.c
Date: Sun, 17 Dec 2006 12:39:39 -0800
Message-ID: <200612172039.kBHKddA4008134@fire-2.osdl.org>
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





------- Additional Comments From malattia@linux.it  2006-12-17 12:35 -------
Created an attachment (id=9857)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=9857&action=view)
Allow userspace to be the default governor with acpi-cpufreq

The attached patch should fix your problem

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
