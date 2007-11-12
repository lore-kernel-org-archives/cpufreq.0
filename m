From: Dave Jones <davej@redhat.com>
Subject: Re: Kernel panic at boot with ondemand governor as default
	(2.6.24-rc2)
Date: Mon, 12 Nov 2007 15:26:29 -0500
Message-ID: <20071112202629.GA31763@redhat.com>
References: <4737539F.2070401@lifl.fr> <1194859012.4590.595.camel@queen.suse.de> <47385D05.20705@lifl.fr> <1194880989.5474.12.camel@queen.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757449AbXKLU1B@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1194880989.5474.12.camel@queen.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Renninger <trenn@suse.de>
Cc: Eric Piel <Eric.Piel@lifl.fr>, linux-kernel@vger.kernel.org, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, cpufreq <cpufreq@lists.linux.org.uk>

On Mon, Nov 12, 2007 at 04:23:09PM +0100, Thomas Renninger wrote:
 > On Mon, 2007-11-12 at 15:02 +0100, Eric Piel wrote:
 > > 11/12/2007 10:16 AM, Thomas Renninger wrote/a =E9crit:
 > > > On Sun, 2007-11-11 at 20:10 +0100, Eric Piel wrote:
 > > >> Hello,
 > > >>
 > > >> I've tried kernel 2.6.24-rc2 and I have a problem with the new =
option=20
 > > >> for setting up the cpufreq ondemand governor as default: a kern=
el panic=20
 > > >> happens early at boot time. If I boot first with performance go=
vernor=20
 > > >> and later change to ondemand, everything is fine (as usual).
 > > >>
 > > >> This seems related to the delayed_workqueue. The kernel panic m=
essage=20
 > > >> finishes by:
 > > >> EIP: [<c012aa60>] wq_per_cpu+0x0/0x10 SS:ESP 0068:c191be58
 > > >> Kernel panic - not syncing: Attempted to kill init!
 > > >>
 > > >> A picture of the whole message is available here:
 > > >> http://pieleric.free.fr/unorder/1162-ondemand-panic.jpg
 > > >>
 > > >> My computer is a x86 using speedstep-ich, and you can find the =
full=20
 > > >> .config leading to the panic attached.
 > > >>
 > > >> Does anyone has any idea was it going wrong?
 > > >=20
 > > > Does it work if you compile speedstep-ich as a module?
 > > > If you load it, ondemand governor should still be set up automat=
ically.
 > > > If this works, could it be that the kernel does not like that
 > > > queue_delayed_work_on is called that early?
 > >=20
 > > Yes, it works if I compile speedstep-ich as module. I've put the m=
odule=20
 > > in initramfs and as soon it is loaded, the ondemand governor is se=
lected=20
 > > and works.
 > >=20
 > > However, do you think it's ok to prevent cpufreq drivers to be bui=
lt-in=20
 > > if ondemand governor is selected as default?
 > > Another way would be to=20
 > > reorganise the initialisation code so that workqueue is initialise=
d=20
 > > before the cpufreq framework is started, do you think it's possibl=
e?
 > Making all this work with low-level drivers built in would be perfec=
t of
 > course...
 > If nobody answers the next days, could you open a bug at
 > bugzilla.kernel.org, so that this does not get lost, pls.
 > Add myself and Venkatesh to CC...
 > I try to have a look at it ASAP.
 > If someone already finds out more, this would be great.

I'm actually surprised that speedstep-ich works with a low enough
latency for ondemand.  On the kernel that works, can you boot
with cpufreq.debug=3D7 and send the cpufreq messages from dmesg?

	Dave

--=20
http://www.codemonkey.org.uk
