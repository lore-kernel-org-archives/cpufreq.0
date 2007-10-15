From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][try 3] architectural pstate driver for powernow-k8
Date: Mon, 15 Oct 2007 16:32:47 -0400
Message-ID: <20071015203247.GA14279@redhat.com>
References: <200710091446.38432.mark.langsdorf@amd.com> <20071011075958.GK1130@shadowen.org> <20071015154031.GA30754@redhat.com> <200710151123.45582.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933331AbXJOUpf@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200710151123.45582.mark.langsdorf@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: Andy Whitcroft <apw@shadowen.org>, Andi Kleen <andi@firstfloor.org>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Mon, Oct 15, 2007 at 11:23:45AM -0500, Mark Langsdorf wrote:
 > On Monday 15 October 2007 10:40, Dave Jones wrote:
 > > On Thu, Oct 11, 2007 at 08:59:58AM +0100, Andy Whitcroft wrote:
 > > =20
 > >  > >  	/* get fid did for hardware pstate transition */
 > >  > >  	pstate =3D index & HW_PSTATE_MASK;
 > >  > > -	if (pstate > MAX_HW_PSTATE)
 > >  > > +	if (pstate > data->max_hw_pstate);
 > >  > >  		return 0;
 > >  >=20
 > >  > checkpatch picked up this dodgy if.  I suspect that the ';' is =
wrong
 > >  > from the context.
 > > =20
 > > Indeed.  Mark/Andreas, want to send me a new patch against latest
 > > Linus HEAD ?  I didn't apply the old one yet, as it conflicted wit=
h
 > > the changes already queued for merging.
 >=20
 > This is against -git7.  I should think that's close enough.

So close!

arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function =E2=80=98powerno=
wk8_target=E2=80=99:
arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1054: error: =E2=80=98struct =
powernow_k8_data=E2=80=99 has no member named =E2=80=98currdid=E2=80=99
make[1]: *** [arch/x86/kernel/cpu/cpufreq/powernow-k8.o] Error 1
make: *** [arch/x86/kernel/cpu/cpufreq/powernow-k8.o] Error 2

Missed one of the conversions?

	Dave

--=20
http://www.codemonkey.org.uk
