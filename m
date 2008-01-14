From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9745] CPU is waking up too often
Date: Mon, 14 Jan 2008 07:40:09 -0800 (PST)
Message-ID: <20080114154009.8767610806D@picon.linux-foundation.org>
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





------- Comment #15 from tglx@linutronix.de  2008-01-14 07:40 -------
> the current workaround for me is to use 2.6.22 which seems not to be affected
> by the problem. However in my case it does help nothing to blacklist
> yenta_socket.
> Well, I haven't yet tried the max_cstate thing as it requires me to reboot
> again.

If you decide to reboot, could you please try to capture something,
which shows us the large number of interrupts (via the shell command I
gave you before).

I looked at your .config again. That's the .22 one. Is the .23
significantly different? Can you please upload it as well.

Thanks,
        tglx


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
