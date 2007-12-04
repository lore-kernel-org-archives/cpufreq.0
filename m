From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9475] jiffies counter leaps on CPU frequency changes
Date: Tue,  4 Dec 2007 14:04:20 -0800 (PST)
Message-ID: <20071204220420.1F146108010@picon.linux-foundation.org>
References: <bug-9475-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9475-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9475





------- Comment #5 from stefano.brivio@polimi.it  2007-12-04 14:04 -------
(In reply to comment #4)

> hm, maybe i'm missing something obvious, but adjust_jiffies() seems to 
> fix up loops_per_jiffy, not the jiffies variable. The bugreport included 
> a /var/log/messages snippets that showed printk timestamps - the printk 
> timestamps are directly derived from the 'jiffies' variable. Those 
> timestamps jumped back and forth according to CPU frequency. So 
> _something_ does seem to affect the jiffies variable - and it's not 
> adjust_jiffies(). Or at least so i think.

Yes, I'm wondering about this as well. But so far, I hadn't been able to find
out where in the kernel a CPU frequency switch could trigger a sudden change to
the jiffies counter. The only related thing I observed is that adjust_jiffies()
is called, but that doesn't seem to be the culprit.

BTW, I just sorted out the dm-crypt issue which prevented me to test 2.6.23.
Will let you know ASAP about further tests.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
