From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH][DOCUMENTATION BUGFIX] latency in micro-, not nanoseconds
Date: Tue, 11 Nov 2003 11:57:23 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60077A19@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>, Dave Jones <davej@redhat.com>
Cc: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk



> -----Original Message-----
> From: cpufreq-bounces@www.linux.org.uk=20
> [mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of=20
> Dominik Brodowski
> Sent: Tuesday, November 11, 2003 10:54 AM
> To: Dave Jones
> Cc: Ducrot Bruno; cpufreq@www.linux.org.uk
> Subject: Re: [PATCH][DOCUMENTATION BUGFIX] latency in micro-,=20
> not nanoseconds
>=20
>=20
> On Mon, Nov 10, 2003 at 09:16:54PM +0000, Dave Jones wrote:
> > Ok, I can buy that. But it's not being used at all right=20
> now, right ?
>=20
> It is used in the ondemand governor already. Venkatesh knows of the
> documentation bug and of the powernow-k7 bug, though.


Yes. Current version of ondemand governor is using the transiton=20
latency to decide whether this policy can be enabled on this CPU=20
or not. As it does frequent sampling (default - 4 times per sec)
which may not work well you have higher transition latencies.=20
I am planning to use transition latency to decide on an=20
appropriate sampling frequency for that CPU, in next release=20
of ondemand governor, so that the governor can support wider=20
range of CPUs (although with different sampling frequencies).


Thanks,
-Venkatesh
