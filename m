From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 18:48:18 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6007792A@scsmsx403.sc.intel.com>
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
To: Alexander Bokovoy <ab@altlinux.org>, M?ns Rullg?rd <mru@kth.se>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org=20
> [mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of=20
> Alexander Bokovoy
> Sent: Tuesday, October 21, 2003 2:11 PM
> To: M?ns Rullg?rd
> Cc: cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org
> Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and=20
> updates to ACPI P-state driver
>=20
>=20
> On Tue, Oct 21, 2003 at 10:39:16PM +0200, M?ns Rullg?rd wrote:
> > Alexander Bokovoy <ab@altlinux.org> writes:
> >=20
> > >> > Most of the latest CPUs (laptop CPUs in particular)=20
> have feature=20
> > >> > which enable very low latency P-state transitions=20
> > >> > (like Enhanced Speedstep Technology-EST). Using this feature,=20
> > >> > we can have a lightweight in kernel cpufreq governor,=20
> > >> > to vary CPU frequency depending on the CPU usage. The=20
> > >> > advantage being low power consumption and also cooler laptops.
> > >>=20
> > >> So, I took this thing for a spin, but it didn't work at=20
> all.  I loaded
> > >> the module, and did "echo demandbased >=20
> /sys/.../scaling_governor".
> > >> This echo never returned, and the keyboard locked up. =20
> After a little
> > >> while, the fan started running at full speed.  I managed=20
> to cut and
> > >> paste into an xterm and start top, which showed nothing=20
> unusual.  I
> > >> could shut down and reboot normally.
> > > I applied these patches to stock 2.6.0-test8 and selected=20
> 'demandbased' as
> > > default governor. In result, everything worked from the=20
> very beginning, my
> > > Centrino-based system went to 600MHz and was upping when=20
> load was going
> > > higher during compilation or disk access but went down=20
> when load was
> > > lowering. So it works well for me.
> >=20
> > What's your /proc/cpuinfo?  Mine says
> >=20
> > processor	: 0
> > vendor_id	: GenuineIntel
> > cpu family	: 15
> > model		: 2
> > model name	: Mobile Intel(R) Pentium(R) 4 - M CPU 1.80GHz


AFAIK, Pentium 4 M does not support EST (Frequency transitions with low
latency).=20
But that doesn't explain why it is hanging though. Which speedstep
driver are you using?
P4-clockmod? Or acpi? Can you send the complete dmesg.


Thanks,
-Venkatesh
