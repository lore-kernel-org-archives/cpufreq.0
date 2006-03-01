From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 21:18:42 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600762941B@scsmsx403.amr.corp.intel.com>
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
To: "shin, jacob" <jacob.shin@amd.com>, Andi Kleen <ak@suse.de>, cpufreq@lists.linux.org.uk
Cc: "Langsdorf, Mark" <mark.langsdorf@amd.com>

=20

>-----Original Message-----
>From: shin, jacob [mailto:jacob.shin@amd.com]=20
>On Tuesday, February 28, 2006 7:23 PM Pallipadi, Venkatesh wrote:
>
>> Questions:
>
>Thanks for your questions/comments.  Getting cpufreq driver to
>play nicely with CPU Hotplug is not a trivial matter, especially
>when affected cpus data is concerned.  If you have another
>simple/elegant/"un-intrusive" solution, I would be glad to discuss
>it further.
>

I am sorry if I came across as saying that this is a trivial patch.=20
I never intended that. Having looked at cpufreq code for couple of=20
years, I know better than that :-). I was just trying to understand=20
the patch and review the patch...

>> I see multiple cpufreq_cpu_get() without cpmplementing
>> cpufreq_cpu_put(). Is it intentional?
>
>There are complementing cpufreq_cpu_put calls in the remove
>function.

So, when main CPU comes back offline, there are these affected CPUs=20
that are not aware of the main CPU. So, all these other CPUs would=20
have already done cpu_get() already. Now, inside this for loop, we=20
do an cpu_get for these affected_cpus bunch and then link the new CPU
with affected CPUs. Right?
The concern I have is, this cpu_get() for managed_cpus outside the loop=20
will end up being an extra cpu_get() without cpu_put().

>> Why is this going through the error path here. Is the call to exit()
>> required?
>
>Note that the return code is 0.  This is the case where cpufreq
>driver registers a new driver through driver->init, however finds
>that the CPU is already managed by someone that was online before
>him.  The existing policy cannot predict what other CPUs that
>will come after, due to CPU Hotplug.  Therefore, whenever a new
>policy is registered through driver->init, we must check if it is
>already managed, otherwise a few CPU on/offlines will confuse
>the cpufreq driver's data.  When we find that the CPU is already
>managed, we do not need to keep its data around, and we also
>need to call driver->exit.
>

Ok. Understood this path now.

Thanks,
Venki
