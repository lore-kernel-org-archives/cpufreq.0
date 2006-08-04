From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Fri, 4 Aug 2006 15:49:35 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84545A5F14@scsmsx413.amr.corp.intel.com>
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Erik Slagter [mailto:erik@slagter.name]=20
>Sent: Friday, August 04, 2006 1:44 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@lists.linux.org.uk
>Subject: RE: problems setting freq on dual core t2600,=20
>2.6.17-1.2157_FC5smp
>
>On vr, 2006-08-04 at 13:16 -0700, Pallipadi, Venkatesh wrote:
>> >Huh, I don't have this entry! Only min and max.
>
>> This entry depends on what scaling_driver you are using. If you are
>> using speedstep_centrino, you should have this..
>
>I am not using speedstep_centrino, it doesn't load. I've been told
>that's because apparently the bios on my motherboard prevents cpufreq
>from accessing the relevant msr's. So I run acpi-cpufreq, which indeed
>seems to work. But no current speed entry.
>

Yes. There is no cur speed entry for acpi-cpufreq.

I guess we are mixing two different threads here. This original thread
was about frequency not changing on a dual core processor with centrino
driver......

Thanks,
Venki
