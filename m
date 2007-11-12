From: Thomas Renninger <trenn@suse.de>
Subject: Re: Kernel panic at boot with ondemand governor as
	default	(2.6.24-rc2)
Date: Mon, 12 Nov 2007 16:23:09 +0100
Message-ID: <1194880989.5474.12.camel@queen.suse.de>
References: <4737539F.2070401@lifl.fr>
	 <1194859012.4590.595.camel@queen.suse.de>  <47385D05.20705@lifl.fr>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757907AbXKLPXc@vger.kernel.org>
In-Reply-To: <47385D05.20705@lifl.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@lifl.fr>
Cc: linux-kernel@vger.kernel.org, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@lists.linux.org.uk>

On Mon, 2007-11-12 at 15:02 +0100, Eric Piel wrote:
> 11/12/2007 10:16 AM, Thomas Renninger wrote/a =C3=A9crit:
> > On Sun, 2007-11-11 at 20:10 +0100, Eric Piel wrote:
> >> Hello,
> >>
> >> I've tried kernel 2.6.24-rc2 and I have a problem with the new opt=
ion=20
> >> for setting up the cpufreq ondemand governor as default: a kernel =
panic=20
> >> happens early at boot time. If I boot first with performance gover=
nor=20
> >> and later change to ondemand, everything is fine (as usual).
> >>
> >> This seems related to the delayed_workqueue. The kernel panic mess=
age=20
> >> finishes by:
> >> EIP: [<c012aa60>] wq_per_cpu+0x0/0x10 SS:ESP 0068:c191be58
> >> Kernel panic - not syncing: Attempted to kill init!
> >>
> >> A picture of the whole message is available here:
> >> http://pieleric.free.fr/unorder/1162-ondemand-panic.jpg
> >>
> >> My computer is a x86 using speedstep-ich, and you can find the ful=
l=20
> >> .config leading to the panic attached.
> >>
> >> Does anyone has any idea was it going wrong?
> >=20
> > Does it work if you compile speedstep-ich as a module?
> > If you load it, ondemand governor should still be set up automatica=
lly.
> > If this works, could it be that the kernel does not like that
> > queue_delayed_work_on is called that early?
>=20
> Yes, it works if I compile speedstep-ich as module. I've put the modu=
le=20
> in initramfs and as soon it is loaded, the ondemand governor is selec=
ted=20
> and works.
>=20
> However, do you think it's ok to prevent cpufreq drivers to be built-=
in=20
> if ondemand governor is selected as default?
> Another way would be to=20
> reorganise the initialisation code so that workqueue is initialised=20
> before the cpufreq framework is started, do you think it's possible?
Making all this work with low-level drivers built in would be perfect o=
f
course...
If nobody answers the next days, could you open a bug at
bugzilla.kernel.org, so that this does not get lost, pls.
Add myself and Venkatesh to CC...
I try to have a look at it ASAP.
If someone already finds out more, this would be great.

Thanks,

   Thomas
