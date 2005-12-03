From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2/2 updated] Measure transition latency at driver
	initialization
Date: Fri, 2 Dec 2005 16:50:41 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60067F46D7@scsmsx403.amr.corp.intel.com>
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
content-type: text/plain
To: Eric Piel <Eric.Piel@tremplin-utc.net>, Mattia Dongili <malattia@linux.it>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com


Patch looks good to me.

Thanks,
Venki=20

>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Friday, December 02, 2005 3:43 PM
>To: Mattia Dongili
>Cc: CPUFreq Mailing List; Dominik Brodowski; davej@redhat.com;=20
>Pallipadi, Venkatesh
>Subject: Re: [PATCH 2/2 updated] Measure transition latency at=20
>driver initialization
>
>02.12.2005 21:59, Mattia Dongili wrote/a =E9crit:
>
>> here it is:
>> the attached patch introduces runtime latency measurement=20
>for ICH[234]
>> based chipsets instead of using CPUFREQ_ETERNAL. It includes
>> some sanity checks in case the measured value is out of range and
>> assigns a safe value of 500uSec that should still be enough on
>> problematics chipsets (current testing report values ~200uSec). The
>> measurement is currently done in speedstep_get_freqs in=20
>order to avoid
>> further unnecessary transitions and in the hope it'll come=20
>handy for SMI
>> also.
>
>It looks fine for me :-) Dave, Venki, do you have any=20
>objections? Please=20
>apply those two patchs to finally get over the transition latency=20
>problem on speedstep-ich.
>
>cheers,
>Eric
>
