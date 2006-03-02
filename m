From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Wed, 1 Mar 2006 20:39:21 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600768F059@scsmsx403.amr.corp.intel.com>
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
To: Andi Kleen <ak@suse.de>
Cc: cpufreq@lists.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>, davej@redhat.com

=20

>-----Original Message-----
>From: Andi Kleen [mailto:ak@suse.de]=20
>Sent: Wednesday, March 01, 2006 5:59 PM
>To: Pallipadi, Venkatesh
>Cc: shin, jacob; cpufreq@lists.linux.org.uk; Langsdorf, Mark;=20
>davej@redhat.com
>Subject: Re: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
>
>On Thursday 02 March 2006 02:53, Pallipadi, Venkatesh wrote:
>
>> Thanks for the detailed explanation. I understood most of the code.=20
>> Was only worried whether there is an extra get for CPU 1 in=20
>above case,=20
>> just before 0 gets linked to 1. Now, I am convinced that is=20
>> it not the case.=20
>
>Thanks for the review, Venki. Do you think the patches are suitable
>for 2.6.16?=20
>

Yes. I think the patch is OK for 2.6.16.

Thanks,
Venki
