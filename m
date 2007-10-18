From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7463] CPU frequency scaling(cpufreq) does not work.
	speedstep-centrino.c problem
Date: Thu, 18 Oct 2007 13:44:59 -0700 (PDT)
Message-ID: <20071018204459.DAB9511D10C@picon.linux-foundation.org>
References: <bug-7463-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-7463-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7463





------- Comment #13 from akpm@osdl.org  2007-10-18 13:44 -------
I asked davej about this and he said:

The only safe way to use scaling on 'dothan' cores is with ACPI.
We just have no way to tell which of the four sets of voltages
is in use.  People keep proposing patches to hardcode a set of
tables for them which "works for them", but could do *anything*
on someone elses system.
Even if we added it as a CONFIG option, I'm worried that
people will turn it on not understanding the consequences
and either plague us with crappy bug reports of flaky kernels (or worse).
(And you guarantee some distros will turn it on to
 "make hardware 'just work'")

All-round crappy situation really, we're between a rock
and a hard place, and ACPI is the best hope we've got.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
