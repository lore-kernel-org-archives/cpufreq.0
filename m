From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Wed, 1 Mar 2006 17:53:15 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600768EF58@scsmsx403.amr.corp.intel.com>
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
>
>The logic here goes like this:
>
>Consider CPU0 and CPU1, where their frequencies are tied together.
>Both of them are offline in the beginning.  Now, lets bring CPU0
>online first.  cpufreq driver creates sys directory for CPU0.  At
>this point in time, CPU0's affected cpus mask must only have CPU0
>set.  Because it is the only CPU online at this time.  Now, lets
>bring CPU1 online, cpufreq will begin the initialization process,
>calling driver->init.  However, now we have a dilemma, CPU1 now
>says that its affected cpus are CPU0 and CPU1, however, CPU0 is=20
>already managed!
>
>Therefore, the code path here will find out if any of the
>affected cpus of CPU1 is already managed, finds CPU0, updates
>CPU0's affected cpus mask, symlinks CPU1 to CPU0, then exits
>through the error handling path. (it has to free memory not used
>anymore)
>
>The most important thing to note here is that CPU0 at its boot
>time, does not know about CPU1.
>

Thanks for the detailed explanation. I understood most of the code.=20
Was only worried whether there is an extra get for CPU 1 in above case,=20
just before 0 gets linked to 1. Now, I am convinced that is=20
it not the case.=20

Thanks again,
Venki
