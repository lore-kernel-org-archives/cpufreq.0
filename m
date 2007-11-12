From: Eric Piel <Eric.Piel@lifl.fr>
Subject: Re: Kernel panic at boot with ondemand governor as default	(2.6.24-rc2)
Date: Tue, 13 Nov 2007 00:09:46 +0100
Message-ID: <4738DD3A.1080109@lifl.fr>
References: <4737539F.2070401@lifl.fr> <1194859012.4590.595.camel@queen.suse.de> <47385D05.20705@lifl.fr> <1194880989.5474.12.camel@queen.suse.de> <20071112202629.GA31763@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760138AbXKLXKb@vger.kernel.org>
In-Reply-To: <20071112202629.GA31763@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Dave Jones <davej@redhat.com>, Thomas Renninger <trenn@suse.de>, linux-kernel@vger.kernel.org, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, cpufreq <cpufreq@lists.linux.org.uk>

2007=E5=B9=B411=E6=9C=8812=E6=97=A5 21:26, Dave Jones wrote/a =C3=A9cri=
t:
> On Mon, Nov 12, 2007 at 04:23:09PM +0100, Thomas Renninger wrote:
>  > On Mon, 2007-11-12 at 15:02 +0100, Eric Piel wrote:
:
>  > > Yes, it works if I compile speedstep-ich as module. I've put the=
 module=20
>  > > in initramfs and as soon it is loaded, the ondemand governor is =
selected=20
>  > > and works.
>  > >=20
>  > > However, do you think it's ok to prevent cpufreq drivers to be b=
uilt-in=20
>  > > if ondemand governor is selected as default?
>  > > Another way would be to=20
>  > > reorganise the initialisation code so that workqueue is initiali=
sed=20
>  > > before the cpufreq framework is started, do you think it's possi=
ble?
>  > Making all this work with low-level drivers built in would be perf=
ect of
>  > course...
>  > If nobody answers the next days, could you open a bug at
>  > bugzilla.kernel.org, so that this does not get lost, pls.
>  > Add myself and Venkatesh to CC...
>  > I try to have a look at it ASAP.
>  > If someone already finds out more, this would be great.
>=20
> I'm actually surprised that speedstep-ich works with a low enough
> latency for ondemand.  On the kernel that works, can you boot
> with cpufreq.debug=3D7 and send the cpufreq messages from dmesg?
I'm not surprised, contrarly to speedstep-smi, speedstep-ich has been=20
working with ondemand for quite a long time, since commit=20
1a10760c91c394dfe4adfefeeaf85cd8098c4894 precisely :-) As stated in the=
=20
commit message, the latency transition is about 200=C2=B5s, much smalle=
r than=20
the 10ms required by ondemand. Actually, on my laptop the transition=20
time is set to even higher due to problems of measurement, but it's=20
still fine for ondemand. I get this at boot:
speedstep: frequency transition measured seems out of range (4800 nSec)=
,=20
falling back to a safe one of 500000 nSec.


See you,
Eric
