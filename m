From: Georg Sauthoff <g_sauthoff@web.de>
Subject: Re: Pentium M and 2.4. kernel: does not work
Date: Sat, 16 Aug 2003 21:57:26 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200308162157.26732.g_sauthoff@web.de>
References: <200308160043.30649.g_sauthoff@web.de> <200308161028.50976.g_sauthoff@web.de> <20030816185320.GA833@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030816185320.GA833@brodo.de>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

On Saturday 16 August 2003 20:53, Dominik Brodowski wrote:
> On Sat, Aug 16, 2003 at 10:28:50AM +0200, Georg Sauthoff wrote:
> > > So,
> > > # echo -n "0%0%100%userspace" > /proc/cpufreq
> >
> >              ^^^^^^^^ What does this mean?
>
> set the CPU 0  0%
> to something between
>                  0%
> and                100%
> and let the             userspace
> governor decide which speed to use in between. It's much easier with the
> 2.6. sysfs interface -- one of the reasons I'm not really too excited abo=
ut
> the cpufreq backport for 2.4. [besides, I _only_ use 2.[56] kernels...]

Well, I tested a last 2.5er and it worked very stable with my hardware, and=
=20
the interface for cpufreq was easy to use (ok - the Pentium M support was n=
ot=20
so far at this time I think). So everything just fine, but the =A7"!*$^ Cis=
co=20
VPN at the university needs a =A7$=3D?)"# closed source cisco kernel module=
 ...
Ok, the 2.5er has IPsec support included, but I didn't find so much=20
documentation about it (specially how to configure the userspace programs).=
=20
And btw it seems that an encrypted group passward of a vpn-gateway doesn't=
=20
make it easier to use other client software instead of the buggy cisco=20
client.

> > > first, then you can use the
> > > /proc/sys/cpu/0/speed
> > > file to set the CPU speed manually.
> >
> > Hm, unfortunetly after I set the userspace governor (like above) the
> > /proc/sys/cpu/0/s* gives me 0 again ...
> >
> > In the kernel logs I don't see any messages from cpufreq. Ok, after a
> > very quick look at the patch sources I don't see printk's there, too.
>
> Probably a BUG I introduced in the latest backport. Hopefully I'll have
> the time tomorrow to update it. In the meantime: what does /proc/cpufreq
> tell?

It does tell (AFAIRC):
min-policy max-policy ... (sorry don't remember the end of the line)

I will mail the exact line tommorow.

Regards
Georg Sauthoff
