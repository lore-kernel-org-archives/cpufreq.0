From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 11139] warning in cpufreq.c on E450
Date: Wed, 23 Jul 2008 03:54:37 -0700 (PDT)
Message-ID: <20080723105437.5415B10800A@picon.linux-foundation.org>
References: <bug-11139-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-11139-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=11139





------- Comment #4 from cesarb@cesarb.net  2008-07-23 03:54 -------
(In reply to comment #3)
> (In reply to comment #1)
> > This looks strange.
> > 
> > The warning is because init_cpufreq_transition_notifier_list_called is not set
> > to true (yet). However, that should have been done in pure_initcall stage which
> > is waaaaay before auxio_probe, which is at fs_initcall stage. Any experts on
> > the ordering of initcalls, and why this is messed up here?
> 
> cpufreq_register_notifier() is called by arch/sparc64/kernel/time.c:time_init()
> which runs before the normal initcalls.
> 

So, it's time again. I made the patch to add that warning because I made the
same mistake on my s3c2410 cpufreq work (trying to register a transition
notifier in the time setup code). The way I solved it was to move the cpufreq
notifier registration for the time code to a separate function on the same
file, which is called as a initcall. Since cpufreq doesn't actually do anything
until late in the initcall sequence (or even later) because it needs the
cpufreq cpu driver (which is usually a very late initcall or even a module), it
causes no problem (except that now the notifier actually runs, which could
expose untested code paths).


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
