From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2/2] Measure transition latency at driver initialization
Date: Wed, 30 Nov 2005 15:59:03 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600677FC26@scsmsx403.amr.corp.intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>, Mattia Dongili <malattia@linux.it>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Eric Piel
>30.11.2005 23:30, Mattia Dongili wrote/a =E9crit:
>
>> I also had to modify speedstep-smi that still doesn't benefit 100% of
>> the times of the feature.
>Indeed, only buggy systems will benefit of it, quite weird!=20
>Well, let's=20
>keep the things simple for now. If Venki and/or Dave approve your=20
>patches, then in a second time, we could try to generalise=20
>this idea (to=20
>all speedstep-smi and even more).
>

I am all for "OS measuring the latency itself". Infact, the idea can be =
extended to acpi-cpufreq driver as well, where currently BIOS reports =
the latency and more often than not, it reports the latency wrongly. OK. =
OK. Going by the Eric's words, we need to stay concentrated here. :)

Thanks,
Venki
