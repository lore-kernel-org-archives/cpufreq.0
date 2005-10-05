From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] transition latency of speedstep-ich (third try)
Date: Wed, 5 Oct 2005 13:39:55 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6005EB231C@scsmsx403.amr.corp.intel.com>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Thursday, September 29, 2005 3:06 PM
>>>
>>>As it's very different from the numbers you got, I wonder if=20
>I mistook=20
>>>somewhere ?
>>>
>>=20
>>=20
>> I don't have any numbers with Coppermine or P4-M. Probably the reason
>> For low numbers is TSC itself stops at certain times during=20
>this whole
>> Operation. And it will also run at slower frequency once you=20
>change the
>> Freq (On coppermine). 6uS is too low in my opinion. We may not be=20
>> measuring correctly here.
>Could it happen that on a P4M the TSC doesn't stop? Then maybe someone=20
>with such a harware could try? Otherwise, what do you suggest=20
>to obtain=20
>the maximum transition latency? Take 500uS and multiply by the=20
>number of=20
>I/O in the code ?
>
>Eric
>

Do you have ACPI PM timer on your system? May be we can measure the=20
latency using that.=20

Thanks,
Venki
