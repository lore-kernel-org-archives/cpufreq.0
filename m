From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Main differences between drivers
Date: Wed, 16 Aug 2006 10:16:03 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454741F91@scsmsx413.amr.corp.intel.com>
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
To: Guilherme Moro <guilherme.moro@ltia.fc.unesp.br>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Guilherme Moro
>Sent: Tuesday, August 15, 2006 11:44 AM
>To: cpufreq@lists.linux.org.uk
>Subject: RE: Main differences between drivers
>
>Hello again
>
>Another question, this 2 drivers can, theorically, cover all=20
>kind of Intel
>based hardware?
>If I build my own, all new, platform, will I need to write a=20
>new driver?
>Will emerge any situation to write a new driver, thinking that=20
>I will always
>use Intel processors, compatibles with Enhanced SpeedStep?
>

Yes. They cover all the current hardware. In future the plan is to
combine the functionality under one driver instead of two. You don't
have to write a new driver as long as you have current Intel CPUs and
your platform provides ACPI support for Enhanced speedstep.

Thanks,
Venki
