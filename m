From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Can't load speedstep-centrino on IBM x336?
Date: Thu, 27 Oct 2005 18:05:08 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB600625F151@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Darrick J. Wong" <djwong@us.ibm.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Chris McDermott <lcm@us.ibm.com>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Darrick J. Wong [mailto:djwong@us.ibm.com]=20
>Sent: Thursday, October 27, 2005 5:54 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq@lists.linux.org.uk; Chris McDermott
>Subject: Re: Can't load speedstep-centrino on IBM x336?
>
>Venkatesh,
>
>It turns out that RHEL4 wasn't calling the SMM to tell it that the OS
>would handle the p-state transitions.  Thus, the status register trap
>never got set up, which is why I kept reading 0xFFFF.  RHEL4 also
>obliterates the value of PSTATE_CNT if the FADT revision is 1.0, so I
>sent RH a backport of mainline's cpufreq, which only obliterates
>PSTATE_CNT if acpi=3Dstrict and also makes that call to SMM.  With that
>patch, DBS works great.
>

Ok. That's good news. Can you share that patch here? Thanks.

>However, I am curious about the removal of the status register check in
>acpi_cpufreq--how slow is reading that status register? =20

It is really slow due to SMM. 100+ mS. One one system I measured it as
500 mS.

> It seems to me
>that it's a rather good idea to check that the operation actually
>succeeded, instead of assuming that it does and changing the reported
>clock speed as if it did, because any failures that happen will be
>silent; we could only tell if the switch succeeded for sure by running
>CPU benchmarks.  But, perhaps there's a justification for removing it
>that I simply don't know about?

It is mostly needed for enabling new platforms. But, once thinsg are
working, it really is not required to be tested all the time. It doubles
the time for a P-state transition.

Thanks,
Venki
