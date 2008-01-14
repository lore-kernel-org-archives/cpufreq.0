From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9745] CPU is waking up too often
Date: Mon, 14 Jan 2008 06:01:02 -0800 (PST)
Message-ID: <20080114140102.5139210806C@picon.linux-foundation.org>
References: <bug-9745-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9745-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9745





------- Comment #7 from tglx@linutronix.de  2008-01-14 06:01 -------
> I'm not exactly sure what do you mean by "full boot log"? A full boot log of
> the problematic kernel or a log including boots of working kernels? I've added
> the part of /var/log/kern.log where I booted the kernel the last time.

boot log of the problematic kernel. kern.log is fine. The output of
dmesg is easier to read though.

According to the output of /proc/timer_list there is no fast rearming
timer, so it's likely to be something else.

Can you please do the following:

# cat /proc/interrupts >irqs.txt; sleep 10; cat /proc/interrupts >>irqs.txt

and upload irqs.txt 

Thanks,
        tglx


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
