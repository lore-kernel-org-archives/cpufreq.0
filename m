From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Tue, 3 Apr 2007 08:35:41 -0700
Message-ID: <200704031535.l33FZft3013266@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From mark.langsdorf@amd.com  2007-04-03 08:35 -------

> ------- Additional Comments From babassu@postmaster.co.uk  
> 2007-04-03 06:56 -------
> After some more testing I figured the scenario when it 
> happens. There seems to be a hardware issue.

That is what the original error condition stated. =)

> Sometimes the change frequency command is not executed,
> period. It is not that the command is executed but it forgets 
> to reset the bit.  The pending bit is not reset because the
> command did not work and nothing would after that. I am
> curious if there is anything else that the chipset
> reports when it cannot execute a command (some sort of an 
> error somewhere in some register).

The chipset might have it's own error registers - you 
would need to check the documentation for the chipset.

> Would you happen to know what component executes the command
> (the nothbridge) ?

The northbridge, the processor cores, the crossbar switch,
and the southbridge all have things they do in response 
to a pstate change command.  It doesn't look like there 
are northbridge error registers in the case of failure,
though.





------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
