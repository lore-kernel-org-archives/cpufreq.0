From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7376] ondemand and conservative governors are not working as
	expected
Date: Mon, 16 Oct 2006 13:27:54 -0700
Message-ID: <200610162027.k9GKRs0K021317@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7376





------- Additional Comments From caglar@pardus.org.tr  2006-10-16 13:15 -------
Created an attachment (id=9278)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=9278&action=view)
/proc/interrupts

cat /proc/interrupts; sleep 10; cat /proc/interrupts while nothing working

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
