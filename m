From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8671] CPU frequency always on highest frequency after wakeup
	from suspend to disk
Date: Mon, 25 Jun 2007 09:48:33 -0700 (PDT)
Message-ID: <20070625164833.851851080F7@picon.linux-foundation.org>
References: <bug-8671-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8671-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8671





------- Comment #4 from linux@markus-schaub.de  2007-06-25 09:52 -------
this is the debug log for cpufreq_conservative:
cpufreq-core: suspending cpu 0
swsusp: critical section: 
swsusp: Need to copy 14851 pages
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
cpufreq-core: resuming cpu 0
cpufreq-core: Warning: CPU frequencyis 2000000, cpufreq assumed 800000 kHz.
cpufreq-core: scaling loops_per_jiffy to 7987872for frequency 2000000 kHz
cpufreq-core: handle_update for cpu 0 called
cpufreq-core: updating policy for CPU 0
cpufreq-core: setting new policy for CPU 0: 800000 - 2000000 kHz
cpufreq-core: new min and max freqs are 800000 - 2000000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
