From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq stops working after a while
Date: Tue, 15 Aug 2006 06:27:21 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84546F986C@scsmsx413.amr.corp.intel.com>
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
To: Carlos Garcia Campos <carlosgc@gnome.org>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Carlos Garcia Campos
>Sent: Tuesday, August 15, 2006 4:07 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Re: cpufreq stops working after a while
>
>El mar, 15-08-2006 a las 09:49 +0200, Thomas Renninger escribi=F3:
>> On Sat, 2006-08-12 at 10:52 +0200, Erik Slagter wrote:
>> > On Fri, 11 Aug 2006 14:25:26 -0400 Mark Lord <lkml@rtr.ca> wrote:
>> >=20
>> > > One of my notebooks (Dell Latitude X1) has a 1.1GHz=20
>Pentium-M ULV processor.
>> > > This chip can change CPU speeds from 600 -> 800 -> 1100 Mhz.
>> > >=20
>> > > I use speedstep-centrino with it, and after boot all is=20
>usually okay.
>> > > But after a few hours of operation, it stops shifting to=20
>the highest frequency
>> > > even under continuous 100% load (or not).  Eventually it=20
>gets stuck at 600Mhz
>> > > and stays there until I reboot.
>
>I have the same problem. My laptop is Dell Latitude D600 (Intel(R)
>Pentium(R) M processor 1.60GHz). If I'm compiling something, for
>example, that takes a long time, scaling_max_freq is set to 600000 (the
>lowest). If I try to echo 1600000 to scaling_max_freq it do nothing.
>Only after some time if the cpu load is not high I can echoing 1600000
>again and it works without need to reboot.=20
>

Looks like you have the same problem that Mark had in this original =
thread. Thermal.
It is not a bug in cpufreq. Just that due to cpu load, system is getting =
heated up and platform decides to reduce the temperature using passive =
cooling and as a result reduces the frequency. Does your system have =
active cooling (fans) or does it allow only passive cooling? You can =
monitor the temperature by looking at stuff under =
/proc/acpi/termal_zone/*/*.

Thanks,
Venki
