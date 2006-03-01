From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Wed, 1 Mar 2006 01:37:07 -0600
Message-ID: <B3870AD84389624BAF87A3C7B83149930293567A@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, Andi Kleen <ak@suse.de>, cpufreq@lists.linux.org.uk
Cc: "Langsdorf, Mark" <mark.langsdorf@amd.com>

On Tuesday, February 28, 2006 11:19 PM Pallipadi, Venkatesh wrote:

> I am sorry if I came across as saying that this is a trivial patch.
> I never intended that. Having looked at cpufreq code for couple of
> years, I know better than that :-). I was just trying to understand
> the patch and review the patch...

Oh, you didn't at all.. I guess what I was trying to say was that..
I did put some time and thought into this solution, and to me this
was the best way to solve the problem without causing too much havoc.
;-)

> So, when main CPU comes back offline, there are these affected CPUs
> that are not aware of the main CPU. So, all these other CPUs would
> have already done cpu_get() already. Now, inside this for loop, we
> do an cpu_get for these affected_cpus bunch and then link the new CPU
> with affected CPUs. Right?
> The concern I have is, this cpu_get() for managed_cpus outside the =
loop
> will end up being an extra cpu_get() without cpu_put().

The very first cpu_get will not have succeeded if we reach
this part of the code.  If it did succeed, then it would have
cpu_put() and return (see line 31 of the patch).  The cpu_get()
inside the loop will succeed iff we find a affected cpu that
is already managed.  In that case, it will symlink and exit
out of the loop on the first one it finds.

The logic here goes like this:

Consider CPU0 and CPU1, where their frequencies are tied together.
Both of them are offline in the beginning.  Now, lets bring CPU0
online first.  cpufreq driver creates sys directory for CPU0.  At
this point in time, CPU0's affected cpus mask must only have CPU0
set.  Because it is the only CPU online at this time.  Now, lets
bring CPU1 online, cpufreq will begin the initialization process,
calling driver->init.  However, now we have a dilemma, CPU1 now
says that its affected cpus are CPU0 and CPU1, however, CPU0 is=20
already managed!

Therefore, the code path here will find out if any of the
affected cpus of CPU1 is already managed, finds CPU0, updates
CPU0's affected cpus mask, symlinks CPU1 to CPU0, then exits
through the error handling path. (it has to free memory not used
anymore)

The most important thing to note here is that CPU0 at its boot
time, does not know about CPU1.

Thanks!

-Jacob Shin
AMD, Inc.
